unit ufrmBaseInputDB;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms,
  Vcl.ComCtrls, Dialogs, System.Variants, Vcl.Samples.Spin, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Graphics, Vcl.AppEvnts, System.Math, Vcl.ImgList,
  Vcl.Menus, Data.DB, System.Rtti,

  FireDAC.Stan.Option, FireDAC.Stan.Intf, FireDAC.Comp.Client,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,

  Ths.Erp.Helper.BaseTypes,
  Ths.Erp.Helper.Edit,
  Ths.Erp.Helper.Memo,
  Ths.Erp.Helper.ComboBox,

  ufrmBase,
  ufrmBaseInput,
  Ths.Erp.Database,
  Ths.Erp.Database.Table,
  Ths.Erp.Database.Table.View.SysViewColumns,
  Ths.Erp.Functions;

{
procedure TfrmBaseInputDB.FDEventAlerter1Alert(ASender: TFDCustomEventAlerter;
  const AEventName: string; const AArgument: Variant);
var
  vMesaj,
  vID,
  vPID: string;
  n1: Integer;
begin
  FDEventAlerter1.Unregister;

  if VarIsArray( AArgument ) then
  begin
    for n1 := VarArrayLowBound(AArgument, 1) to VarArrayHighBound(AArgument, 1) do
    begin
      if n1 = 0 then
      begin
        vMesaj := vMesaj + 'Process ID (pID):' + VarToStr(AArgument[n1]) + ', ';
        vPID := VarToStr(AArgument[n1]);
      end
      else if n1 = 1 then
      begin
        vMesaj := vMesaj + 'Notify Value:' + VarToStr(AArgument[n1]) + ', ';
        vID := VarToStr(AArgument[n1]);
      end;
    end;
  end
  else
  if VarIsNull(AArgument) then
    vMesaj := '<NULL>'
  else if VarIsEmpty(AArgument) then
    vMesaj := '<UNASSIGNED>'
  else
    vMesaj := VarToStr(AArgument);

  if (FormMode = ifmRewiev) and (VarToStr(Table.Id.Value).ToInteger = vID.ToInteger) then
    RefreshData;
end;
}
type
  TfrmBaseInputDB = class(TfrmBaseInput)
    procedure btnSpinDownClick(Sender: TObject);override;
    procedure btnSpinUpClick(Sender: TObject);override;
    procedure btnDeleteClick(Sender: TObject);override;
    procedure btnAcceptClick(Sender: TObject);override;
    procedure FormCreate(Sender: TObject);override;
    procedure FormShow(Sender: TObject);override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);override;
    procedure FormDestroy(Sender: TObject);override;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);override;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);override;
    procedure FormKeyPress(Sender: TObject; var Key: Char);override;
    procedure FormResize(Sender: TObject);override;
    procedure FormPaint(Sender: TObject);override;
  private
    FSysTableInfo: TSysViewColumns;
  protected
    procedure ResetSession();virtual;
    function SetSession():Boolean;virtual;
    procedure HelperProcess(Sender: TObject);virtual;
  public
    property SysTableInfo: TSysViewColumns read FSysTableInfo write FSysTableInfo;

    procedure SetControlDBProperty;
    procedure SetHelperProcess();
  published
    procedure stbBaseDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect); override;
    procedure RefreshData; override;
    procedure RefreshDataAuto; virtual;
    procedure btnAcceptAuto; virtual;
  end;

implementation

uses
  ufrmBaseDBGrid,
  Ths.Erp.Database.Singleton,
  Ths.Erp.Constants;

{$R *.dfm}

procedure TfrmBaseInputDB.btnSpinDownClick(Sender: TObject);
begin
  if (Self.ParentForm <> nil) then//and (Self.ParentForm.Name = 'frmBaseDBGrid') then
  begin
    if TfrmBaseDBGrid(ParentForm).dbgrdBase.DataSource.DataSet.RecNo < TfrmBaseDBGrid(ParentForm).dbgrdBase.DataSource.DataSet.RecordCount then
    begin
      TfrmBaseDBGrid(ParentForm).MoveUp;

      Table.SelectToList(' and ' + Table.TableName + '.' + Table.Id.FieldName + '=' + IntToStr(TfrmBaseDBGrid(ParentForm).Table.Id.Value), False, False);
      DefaultSelectFilter := ' and ' + Table.TableName + '.' + Table.Id.FieldName + '=' + IntToStr(Table.Id.Value);
      RefreshData;
    end;
  end;
end;

procedure TfrmBaseInputDB.btnSpinUpClick(Sender: TObject);
begin
  if (Self.ParentForm <> nil) then//and (Self.ParentForm.Name = 'frmBaseDBGrid') then
  begin
    if TfrmBaseDBGrid(ParentForm).dbgrdBase.DataSource.DataSet.RecNo > 1 then
    begin
      TfrmBaseDBGrid(ParentForm).MoveDown;

      Table.SelectToList(' and ' + Table.TableName + '.' + Table.Id.FieldName + '=' + IntToStr(TfrmBaseDBGrid(ParentForm).Table.Id.Value), false, false);
      DefaultSelectFilter := ' and ' + Table.TableName + '.' + Table.Id.FieldName + '=' + IntToStr(Table.Id.Value);
      RefreshData;
    end;
  end;
end;

procedure TfrmBaseInputDB.btnDeleteClick(Sender: TObject);
begin
  if (FormMode = ifmUpdate)then
  begin
    if CustomMsgDlg(
      TranslateText('Are you sure you want to delete record?', FrameworkLang.MessageDeleteRecord, LngMessage, LngSystem),
      mtConfirmation, mbYesNo, [TranslateText('Yes', FrameworkLang.GeneralYesLower, LngGeneral, LngSystem),
                                TranslateText('No', FrameworkLang.GeneralNoLower, LngGeneral, LngSystem)], mbNo,
                                TranslateText('Confirmation', FrameworkLang.GeneralConfirmationLower, LngGeneral, LngSystem)) = mrYes
    then
    begin
      if (Table.LogicalDelete(True, False)) then
      begin
        ModalResult := mrOK;
        Close;

        TfrmBaseDBGrid(ParentForm).Table.DataSource.DataSet.Refresh;
        //Table.DataSource.DataSet.Refresh;
      end
      else
      begin
        ModalResult := mrNone;
        FormMode := ifmRewiev;
        btnSpin.Visible := True;
        btnDelete.Visible := False;
        btnAccept.Caption := TranslateText('UPDATE', FrameworkLang.ButtonUpdate, LngButton, LngSystem);
        btnAccept.Width := Canvas.TextWidth(btnAccept.Caption) + 56;
        btnAccept.Width := Max(100, btnAccept.Width);

        Repaint;
      end;
    end;
  end;
end;

procedure TfrmBaseInputDB.btnAcceptAuto;
var
  ctx: TRttiContext;
  typ: TRttiType;
  fld: TRttiField;
  AValue: TValue;
  AObject: TObject;
  vControl: TControl;
begin
      typ := ctx.GetType(Table.ClassType);
      if Assigned(typ) then
        for fld in typ.GetFields do
          if Assigned(fld) then
            if fld.FieldType is TRttiInstanceType then
              if TRttiInstanceType(fld.FieldType).MetaclassType.InheritsFrom(TFieldDB) then
              begin
                AValue := fld.GetValue(Table);
                AObject := nil;
                if not AValue.IsEmpty then
                  AObject := AValue.AsObject;

                if Assigned(AObject) then
                  if AObject.InheritsFrom(TFieldDB) then
                  begin
                    vControl := pnlMain.FindChildControl(PREFIX_EDIT + TFieldDB(AObject).FieldName);
                    if Assigned(vControl) then
                    begin
                      if TFieldDB(AObject).IsFK then
                      begin
                        TFieldDB(AObject).Value := TFieldDB(AObject).Value;
                        TFieldDB(AObject).FK.FKCol.Value := TEdit(vControl).Text;
                      end
                      else
                        TFieldDB(AObject).Value := TEdit(vControl).Text;
                    end;
                    vControl := pnlMain.FindChildControl(PREFIX_COMBOBOX + TFieldDB(AObject).FieldName);
                    if Assigned(vControl) then
                    begin
                      if TFieldDB(AObject).IsFK then
                      begin
                        TFieldDB(AObject).Value := TFieldDB(AObject).Value;
                        TFieldDB(AObject).FK.FKCol.Value := TCombobox(vControl).Text;
                      end
                      else
                        TFieldDB(AObject).Value := TCombobox(vControl).Text;
                    end;
                  end;
              end;
end;

procedure TfrmBaseInputDB.btnAcceptClick(Sender: TObject);
var
  id, nIndex : integer;
//  vTable: TTable;
begin
  id := 0;
  if (FormMode = ifmNewRecord) or (FormMode = ifmCopyNewRecord) then
  begin
    if (Table.Database.TranscationIsStarted) then
    begin
      if (Table.LogicalInsert(id, (not Table.Database.TranscationIsStarted), WithCommitTransaction, False)) then
      begin
        if (Self.ParentForm <> nil) then//and (Self.ParentForm.Name = 'frmBaseDBGrid') then
        begin
          TfrmBaseDBGrid(Self.ParentForm).Table.Id.Value := id;
          TfrmBaseDBGrid(Self.ParentForm).dbgrdBase.DataSource.DataSet.Refresh//.RefreshData;
        end;
        ModalResult := mrOK;

        Close;
      end
      else
      begin
        ModalResult := mrNone;//hata durumunda pencere kapanmas�n

        //e�er begin transaction demiyosa insert pencere kapans�n ��nk� rollback yap�ld art�k insert etmemeli
        //�nceki i�lemler geri al�nd��� i�in
        if (Table.Database.TranscationIsStarted) then
          Close;
        Table.Database.Connection.StartTransaction;
      end;
    end
//      else
//      begin
//        raise Exception.Create(GetTextFromLang('There is an active transaction. Complete it first!', FrameworkLang.WarningActiveTransaction, LngWarning, LngSystem));
//      end;
  end
  else
  if (FormMode = ifmUpdate) then
  begin
    if CustomMsgDlg(
      TranslateText('Are you sure you want to update record?', FrameworkLang.MessageUpdateRecord, LngMessage, LngSystem),
      mtConfirmation, mbYesNo, [TranslateText('Yes', FrameworkLang.GeneralYesLower, LngGeneral, LngSystem),
                                TranslateText('No', FrameworkLang.GeneralNoLower, LngGeneral, LngSystem)], mbNo,
                                TranslateText('Confirmation', FrameworkLang.GeneralConfirmationLower, LngGeneral, LngSystem)) = mrYes
    then
    begin
      //Burada yeni kay�t veya g�ncelleme modunda oldu�u i�in b�t�n kontrolleri a�mak gerekiyor.
      SetControlsDisabledOrEnabled(pnlMain, True);

      if (Table.LogicalUpdate(WithCommitTransaction, True)) then
      begin
        ModalResult := mrOK;
        Close;
      end
      else
      begin

        ModalResult := mrNone;
        btnSpin.Visible := true;
        FormMode := ifmRewiev;
        btnAccept.Caption := TranslateText(btnAccept.Caption, FrameworkLang.ButtonUpdate, LngButton, LngSystem);
        btnAccept.Width := Canvas.TextWidth(btnAccept.Caption) + 56;
        btnAccept.Width := Max(100, btnAccept.Width);
        btnDelete.Visible := false;
        Repaint;
      end;

    end;
  end
  else if (FormMode = ifmRewiev) then
  begin
    //burada g�ncelleme modunda oldu�u i�in b�t�n kontrolleri a�mak gerekiyor.
    SetControlsDisabledOrEnabled(pnlMain, False);

    //inceleme modundan g�ncelleme moduna ge�ti�i i�in kontrollerin zorunlu alan ve max length bilgilerini set et
    //False olarak g�nder form ilk a��ld���ndan k���k-b�y�k harf ayar�n� yap. Sonras�nda tekrar bozma
//    SetInputControlProperty(False);

    if (not Table.Database.TranscationIsStarted) then
    begin
      try
        //kay�t kilitle, e�er ba�ka kullan�c� tarf�ndan bu esnada silinmemi�se
        if (Table.LogicalSelect(DefaultSelectFilter, True, ( not Table.Database.TranscationIsStarted), True)) then
        begin
          //e�er aranan kay�t ba�ka bir kullan�c� taraf�ndan silinmi�se count 0 kal�r
          if (Table.List.Count = 1) then
          begin
            //detayl� tablelar listeye dolduruyo i�eri�ini
            //Table := TTable(Table.List[0]).Clone;
//            vTable := TTable(Table.List[0]).Clone;
//            if Assigned(Table) then
//            begin
//              Table.Free;
//              Table := vTable;
//            end;
          end
          else
          if (Table.List.Count = 0) then
          begin
            raise Exception.Create(
              TranslateText('The record was deleted by another user while you were on the review screen.', FrameworkLang.ErrorRecordDeleted, LngError, LngSystem) +
              AddLBs(2) +
              TranslateText('Check the current records again!', FrameworkLang.ErrorRecordDeletedMessage, LngError, LngSystem)
            );
          end;

          btnSpin.Visible := false;
          FormMode := ifmUpdate;
          btnAccept.Caption := TranslateText('CONFIRM', FrameworkLang.ButtonAccept, LngButton, LngSystem);
          btnAccept.Width := Canvas.TextWidth(btnAccept.Caption) + 56;
          btnAccept.Width := Max(100, btnAccept.Width);
          btnDelete.Visible := True;

          if Table.IsAuthorized(ptUpdate, True, False) then
            btnAccept.Enabled := True
          else
            btnAccept.Enabled := False;

          RefreshData;

          Repaint;

          //burada varsa ilk komponent setfocus yap�lmal�
          for nIndex := 0 to pnlMain.ControlCount-1 do
          begin
            if TControl(pnlMain.Controls[nIndex]) is TWinControl then
            begin
              TWinControl(pnlMain.Controls[nIndex]).SetFocus;
              break;
            end;
          end;

          btnDelete.Left := btnAccept.Left-btnDelete.Width;
        end;
      except

      end;
    end
    else
    begin
      CustomMsgDlg(TranslateText('There is an active transaction. Complete it first!', FrameworkLang.WarningActiveTransaction, LngWarning, LngSystem),
        mtError, [mbOK], [TranslateText('Tamam', FrameworkLang.ButtonOK, LngButton, LngSystem)], mbOK, '');
    end;

  end;
end;

procedure TfrmBaseInputDB.FormCreate(Sender: TObject);
begin
  inherited;

  if Assigned(Table) then
  begin
    SysTableInfo := TSysViewColumns.Create(Table.Database);
    SysTableInfo.SelectToList(' AND ' + FSysTableInfo.TableName + '.' + FSysTableInfo.OrjTableName.FieldName + '=' + QuotedStr(Table.TableName), False, False);
  end;

  if Table <> nil then
  begin
    if (FormMode = ifmNewRecord)
    or (FormMode = ifmCopyNewRecord)
    then
      Table.Database.Connection.StartTransaction;
  end;

  ResetSession();

  if (FormMode = ifmNewRecord) or (FormMode = ifmCopyNewRecord) then
  begin
    btnAccept.Visible := True;
    btnClose.Visible := True;
    btnAccept.Caption := TranslateText('CONFIRM', FrameworkLang.ButtonAccept, LngButton, LngSystem);
    btnAccept.Width := Canvas.TextWidth(btnAccept.Caption) + 56;
    btnAccept.Width := Max(100, btnAccept.Width);
  end
  else
  if FormMode = ifmRewiev then
  begin
    btnAccept.Visible := True;
    btnClose.Visible := True;

    btnAccept.Caption := TranslateText('UPDATE', FrameworkLang.ButtonUpdate, LngButton, LngSystem);
    btnAccept.Width := Canvas.TextWidth(btnAccept.Caption) + 56;
    btnAccept.Width := Max(100, btnAccept.Width);
    btnDelete.Caption := TranslateText('DELETE', FrameworkLang.ButtonDelete, LngButton, LngSystem);
    btnDelete.Width := Canvas.TextWidth(btnDelete.Caption) + 56;
    btnDelete.Width := Max(100, btnDelete.Width);
  end;
end;

procedure TfrmBaseInputDB.FormShow(Sender: TObject);
begin
  inherited;

  if Assigned(Table) then
  begin
    SetControlDBProperty();
    SetHelperProcess;
  end;

  if (FormMode <> ifmNewRecord ) then
    RefreshData;

//  Repaint;
end;

procedure TfrmBaseInputDB.HelperProcess(Sender: TObject);
begin
  //override eden dolduracak
end;

procedure TfrmBaseInputDB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

//  ShowMessage(Self.ParentForm.Name + ' ' + Self.ParentForm.Parent.Name);

  if  ((self.FormMode = ifmNewRecord) or (self.FormMode = ifmUpdate))
  and (Self.ParentForm <> nil)
  then
    TfrmBaseDBGrid(Self.ParentForm).RefreshData;

  if Table <> nil then
    Table.Database.Connection.Rollback;
end;

procedure TfrmBaseInputDB.FormDestroy(Sender: TObject);
begin
  FSysTableInfo.Free;
  Table.Database.Connection.Rollback;
  inherited;
  //
end;

procedure TfrmBaseInputDB.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (btnSpin.Visible) and (Key = VK_NEXT) then  //page_down
    btnSpinDownClick(btnSpin)
  else if (btnSpin.Visible) and (Key = VK_PRIOR) then  //page_up
    btnSpinUpClick(btnSpin)
  else
    inherited;
end;

procedure TfrmBaseInputDB.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //ESC key Close action
  if Key = #27 then
  begin
    Key := #0;
    if (FormMode = ifmNewRecord) or (FormMode = ifmCopyNewRecord) or (FormMode = ifmUpdate) then
    begin
      if CustomMsgDlg(
        TranslateText('Are you sure you want to exit?',FrameworkLang.MessageCloseWindow, LngMessage, LngSystem),
        mtConfirmation, mbYesNo, [TranslateText('Yes',FrameworkLang.GeneralYesLower, LngGeneral, LngSystem),
                                  TranslateText('No',FrameworkLang.GeneralNoLower, LngGeneral, LngSystem)], mbNo,
                                  TranslateText('Confirmation',FrameworkLang.GeneralConfirmationLower, LngGeneral, LngSystem)) = mrYes
      then
        Close;
    end
    else
    if (FormMode = ifmRewiev) then
      Close;
  end
  else
    inherited;
end;

procedure TfrmBaseInputDB.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  //
end;

procedure TfrmBaseInputDB.FormResize(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmBaseInputDB.FormPaint(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmBaseInputDB.RefreshData;
begin
  RefreshDataAuto;
end;

procedure TfrmBaseInputDB.RefreshDataAuto;
var
  ctx: TRttiContext;
  typ: TRttiType;
  fld: TRttiField;
  AValue: TValue;
  AObject: TObject;
  vControl: TControl;
begin
  typ := ctx.GetType(Table.ClassType);
  if Assigned(typ) then
    for fld in typ.GetFields do
      if Assigned(fld) then
        if fld.FieldType is TRttiInstanceType then
          if TRttiInstanceType(fld.FieldType).MetaclassType.InheritsFrom(TFieldDB) then
          begin
            AValue := fld.GetValue(Table);
            AObject := nil;
            if not AValue.IsEmpty then
              AObject := AValue.AsObject;

            if Assigned(AObject) then
              if AObject.InheritsFrom(TFieldDB) then
              begin
                vControl := pnlMain.FindChildControl(PREFIX_EDIT + TFieldDB(AObject).FieldName);
                if Assigned(vControl) then
                begin
                  if TFieldDB(AObject).IsFK then
                    TEdit(vControl).Text := FormatedVariantVal(TFieldDB(AObject).FK.FKCol.FieldType, TFieldDB(AObject).FK.FKCol.Value)
                  else
                    TEdit(vControl).Text := FormatedVariantVal(TFieldDB(AObject).FieldType, TFieldDB(AObject).Value);
                end;
                vControl := pnlMain.FindChildControl(PREFIX_MEMO + TFieldDB(AObject).FieldName);
                if Assigned(vControl) then
                begin
                  if TFieldDB(AObject).IsFK then
                    TMemo(vControl).Lines.Text := FormatedVariantVal(TFieldDB(AObject).FK.FKCol.FieldType, TFieldDB(AObject).FK.FKCol.Value)
                  else
                    TMemo(vControl).Lines.Text := FormatedVariantVal(TFieldDB(AObject).FieldType, TFieldDB(AObject).Value);
                end;
                vControl := pnlMain.FindChildControl(PREFIX_COMBOBOX + TFieldDB(AObject).FieldName);
                if Assigned(vControl) then
                begin
                  if TFieldDB(AObject).IsFK then
                    TCombobox(vControl).ItemIndex := TCombobox(vControl).Items.IndexOf( FormatedVariantVal(TFieldDB(AObject).FK.FKCol.FieldType, TFieldDB(AObject).FK.FKCol.Value) )
                  else
                    TCombobox(vControl).ItemIndex := TCombobox(vControl).Items.IndexOf( FormatedVariantVal(TFieldDB(AObject).FieldType, TFieldDB(AObject).Value) );
                end;
              end;
          end;
end;

procedure TfrmBaseInputDB.ResetSession();
begin
  btnAccept.Enabled := false;
  btnDelete.Enabled := false;
  if not SetSession() then
  begin
    Self.Close;
    raise Exception.Create(TranslateText('Access right failure!', FrameworkLang.ErrorAccessRight, LngError, LngSystem));
  end;
end;

procedure TfrmBaseInputDB.SetControlDBProperty;
var
  n1: Integer;
  vControl: TControl;
  vColName: string;
begin
  for n1 := 0 to SysTableInfo.List.Count-1 do
  begin
    vColName := TSysViewColumns(SysTableInfo.List[n1]).OrjColumnName.Value;
    vControl := pnlMain.FindChildControl(PREFIX_EDIT + vColName);
    if Assigned(vControl) then
    begin
      TEdit(vControl).thsDBFieldName := TSysViewColumns(SysTableInfo.List[n1]).OrjColumnName.Value;
      TEdit(vControl).thsRequiredData := TSysViewColumns(SysTableInfo.List[n1]).IsNullable.Value = 'NO';
      TEdit(vControl).thsActiveYear := TSingletonDB.GetInstance.ApplicationSetting.Donem.Value;
      TEdit(vControl).thsCaseUpLowSupportTr := True;
      TEdit(vControl).CharCase := VCL.StdCtrls.ecUpperCase;
      TEdit(vControl).MaxLength := TSysViewColumns(SysTableInfo.List[n1]).CharacterMaximumLength.Value;

      if (TSysViewColumns(SysTableInfo.List[n1]).DataType.Value = 'text')
      or (TSysViewColumns(SysTableInfo.List[n1]).DataType.Value = 'character varying')
      then
        TEdit(vControl).thsInputDataType := itString
      else
      if (TSysViewColumns(FSysTableInfo.List[n1]).DataType.Value = 'integer')
      or (TSysViewColumns(FSysTableInfo.List[n1]).DataType.Value = 'bigint')
      then
        TEdit(vControl).thsInputDataType := itInteger
      else
      if (TSysViewColumns(FSysTableInfo.List[n1]).DataType.Value = 'date')
      or (TSysViewColumns(FSysTableInfo.List[n1]).DataType.Value = 'timestamp without time zone')
      then
        TEdit(vControl).thsInputDataType := itDate
      else if (TSysViewColumns(FSysTableInfo.List[n1]).DataType.Value = 'double precision') then
        TEdit(vControl).thsInputDataType := itFloat;
    end;
    vControl := pnlMain.FindChildControl(PREFIX_MEMO + vColName);
    if Assigned(vControl) then
    begin
    end;
    vControl := pnlMain.FindChildControl(PREFIX_COMBOBOX + vColName);
    if Assigned(vControl) then
    begin
    end;
  end;
end;

procedure TfrmBaseInputDB.SetHelperProcess;
var
  ctx: TRttiContext;
  typ: TRttiType;
  fld: TRttiField;
  AValue: TValue;
  AObject: TObject;
  vControl: TControl;
begin
  typ := ctx.GetType(Table.ClassType);
  if Assigned(typ) then
    for fld in typ.GetFields do
      if Assigned(fld) then
        if fld.FieldType is TRttiInstanceType then
          if TRttiInstanceType(fld.FieldType).MetaclassType.InheritsFrom(TFieldDB) then
          begin
            AValue := fld.GetValue(Table);
            AObject := nil;
            if not AValue.IsEmpty then
              AObject := AValue.AsObject;

            if Assigned(AObject) then
              if AObject.InheritsFrom(TFieldDB) and (TFieldDB(AObject).IsFK) then
              begin
                vControl := pnlMain.FindChildControl(PREFIX_EDIT + TFieldDB(AObject).FieldName);
                if Assigned(vControl) then
                  TEdit(vControl).OnHelperProcess := HelperProcess;
              end;
          end;
end;

function TfrmBaseInputDB.SetSession():Boolean;
var
  vUpdate, vDelete: Boolean;
begin
  vUpdate := False;
  vDelete := False;

  Result := False;

  if Table.IsAuthorized(ptUpdate, True, False) then
  begin
    Result := True;
    vUpdate := True;
  end;

  if Table.IsAuthorized(ptDelete, True, False) then
  begin
    //if you have the right to delete, enable accept button
    btnDelete.Enabled := True;
    Result := True;
    vDelete := True;
  end;

  if Table.IsAuthorized(ptSpeacial, True, False) then
  begin
    //enable special property
    Result := True;
  end;

  //if you have the right to update or delete, enable accept button
  //for the delete or update confirmation
  if vUpdate or vDelete then
    btnAccept.Enabled := True;
end;

procedure TfrmBaseInputDB.stbBaseDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var
  vIco: Integer;
begin
  stbBase.Canvas.Font.Name := 'Tahoma';
  stbBase.Canvas.Font.Style := [fsBold];

  stbBase.Canvas.TextRect(Rect,
    Rect.Left + TSingletonDB.GetInstance.ImageList16.Width + 4,
    Rect.Top + (stbBase.Height-Canvas.TextHeight(Panel.Text)) div 2 - 2,
    Panel.Text);

  vIco := -1;
  case Panel.Index of
    STATUS_SQL_SERVER:
    begin
      if Panel.Text <> '' then
        vIco := IMG_QUALITY
      else
        vIco := -1;
    end;
  end;

  if vIco > -1 then
  begin
    TSingletonDB.GetInstance.ImageList16.Draw(StatusBar.Canvas, Rect.Left, Rect.Top, vIco);
    Panel.Width := stbBase.Width;
  end;
end;

end.

