unit ufrmBaseInputDB;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.ComCtrls, Dialogs, System.Variants,
  Vcl.Samples.Spin, Vcl.StdCtrls, Vcl.ExtCtrls, System.Rtti, Vcl.Graphics,
  thsEdit, thsMemo, thsComboBox,
  Ths.Erp.Database,
  Ths.Erp.Database.Table,
  Ths.Erp.SpecialFunctions, Vcl.AppEvnts, ufrmBase, System.ImageList,
  Vcl.ImgList, System.WideStrUtils, System.StrUtils, FireDAC.Phys.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Intf, FireDAC.Comp.Client,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, Vcl.Menus;

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
  TfrmBaseInputDB = class(TfrmBase)
    pmLabels: TPopupMenu;
    mniAddLanguageContent: TMenuItem;
    procedure btnSpinDownClick(Sender: TObject);override;
    procedure btnSpinUpClick(Sender: TObject);override;
    procedure btnCloseClick(Sender: TObject);override;
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
    procedure mniAddLanguageContentClick(Sender: TObject);
  protected
    procedure RefreshData;virtual;abstract;
    procedure ResetSession();virtual;
    function SetSession():Boolean;virtual;
    procedure SetControlsDisabledOrEnabled(pPanelGroupboxPagecontrolTabsheet: TWinControl = nil; pIsDisable: Boolean = True);
    procedure SetLabelPopup(Sender: TControl = nil);
    procedure SetCaptionFromLangContent();
  public
  published
    procedure stbBaseDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect); override;
  end;

implementation

uses
  ufrmBaseDBGrid, Ths.Erp.Database.Singleton, Ths.Erp.Database.Table.Field, Ths.Erp.Constants, Ths.Erp.Database.Table.SysLangContents, ufrmSysLangContent;

{$R *.dfm}

procedure TfrmBaseInputDB.btnSpinDownClick(Sender: TObject);
begin
  if (Self.ParentForm <> nil) and (Self.ParentForm.Name = 'frmBaseDBGrid') then
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
  if (Self.ParentForm <> nil) and (Self.ParentForm.Name = 'frmBaseDBGrid') then
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

procedure TfrmBaseInputDB.btnCloseClick(Sender: TObject);
begin
  if (FormMode = ifmRewiev) then
    inherited
  else
  begin
    if (TSpecialFunctions.CustomMsgDlg(
      TSingletonDB.GetInstance.GetTextFromLang('Are you sure you want to exit?   All changes will be canceled!!!', TSingletonDB.GetInstance.LangFramework.MessageCloseWindow, LngMessage, LngSystem),
      mtConfirmation, mbYesNo, [TSingletonDB.GetInstance.GetTextFromLang('Yes', TSingletonDB.GetInstance.LangFramework.GeneralYesLower, LngGeneral, LngSystem),
                                TSingletonDB.GetInstance.GetTextFromLang('No', TSingletonDB.GetInstance.LangFramework.GeneralNoLower, LngGeneral, LngSystem)], mbNo,
                                TSingletonDB.GetInstance.GetTextFromLang('Confirmation', TSingletonDB.GetInstance.LangFramework.GeneralConfirmationLower, LngGeneral, LngSystem)) = mrYes)
    then
      inherited;
  end;
end;

procedure TfrmBaseInputDB.btnDeleteClick(Sender: TObject);
begin
  if (FormMode = ifmUpdate)then
  begin
    if TSpecialFunctions.CustomMsgDlg(
      TSingletonDB.GetInstance.GetTextFromLang('Are you sure you want to delete record?', TSingletonDB.GetInstance.LangFramework.MessageDeleteRecord, LngMessage, LngSystem),
      mtConfirmation, mbYesNo, [TSingletonDB.GetInstance.GetTextFromLang('Yes', TSingletonDB.GetInstance.LangFramework.GeneralYesLower, LngGeneral, LngSystem),
                                TSingletonDB.GetInstance.GetTextFromLang('No', TSingletonDB.GetInstance.LangFramework.GeneralNoLower, LngGeneral, LngSystem)], mbNo,
                                TSingletonDB.GetInstance.GetTextFromLang('Confirmation', TSingletonDB.GetInstance.LangFramework.GeneralConfirmationLower, LngGeneral, LngSystem)) = mrYes
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
        btnSpin.Visible := True;
        FormMode := ifmRewiev;
        btnDelete.Visible := False;

        Repaint;
      end;
    end;
  end;
end;

procedure TfrmBaseInputDB.btnAcceptClick(Sender: TObject);
var
  id, nIndex : integer;
begin

    id := 0;
    if (FormMode = ifmNewRecord) or (FormMode = ifmCopyNewRecord) then
    begin
      if (Table.Database.TranscationIsStarted) then
      begin
        if (Table.LogicalInsert(id, (not Table.Database.TranscationIsStarted), WithCommitTransaction, False)) then
        begin
          if (Self.ParentForm <> nil) and (Self.ParentForm.Name = 'frmBaseDBGrid') then
          begin
            TfrmBaseDBGrid(Self.ParentForm).Table.Id.Value := id;
            TfrmBaseDBGrid(Self.ParentForm).RefreshData;
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
      else
      begin
        raise Exception.Create(TSingletonDB.GetInstance.GetTextFromLang('There is an active transaction. Complete it first!', TSingletonDB.GetInstance.LangFramework.WarningActiveTransaction, LngWarning, LngSystem));
      end;
    end
    else
    if (FormMode = ifmUpdate) then
    begin
      if TSpecialFunctions.CustomMsgDlg(
        TSingletonDB.GetInstance.GetTextFromLang('Are you sure you want to update record?', TSingletonDB.GetInstance.LangFramework.MessageUpdateRecord, LngMessage, LngSystem),
        mtConfirmation, mbYesNo, [TSingletonDB.GetInstance.GetTextFromLang('Yes', TSingletonDB.GetInstance.LangFramework.GeneralYesLower, LngGeneral, LngSystem),
                                  TSingletonDB.GetInstance.GetTextFromLang('No', TSingletonDB.GetInstance.LangFramework.GeneralNoLower, LngGeneral, LngSystem)], mbNo,
                                  TSingletonDB.GetInstance.GetTextFromLang('Confirmation', TSingletonDB.GetInstance.LangFramework.GeneralConfirmationLower, LngGeneral, LngSystem)) = mrYes
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
          btnAccept.Caption := TSingletonDB.GetInstance.GetTextFromLang(btnAccept.Caption, TSingletonDB.GetInstance.LangFramework.ButtonUpdate, LngButton, LngSystem);
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
      SetInputControlProperty(False);

      if (not table.Database.TranscationIsStarted) then
      begin
        //kay�t kilitle, e�er ba�ka kullan�c� tarf�ndan bu esnada silinmemi�se
        if (Table.LogicalSelect(DefaultSelectFilter, True, ( not Table.Database.TranscationIsStarted), True)) then
        begin
          //e�er aranan kay�t ba�ka bir kullan�c� taraf�ndan silinmi�se count 0 kal�r
          if (Table.List.Count = 1) then
          begin
            //detayl� tablelar listeye dolduruyo i�eri�ini
            //Table := TTable(Table.List[0]).Clone;
          end
          else
          if (Table.List.Count = 0) then
          begin
            raise Exception.Create(
              TSingletonDB.GetInstance.GetTextFromLang('The record was deleted by another user while you were on the review screen.', TSingletonDB.GetInstance.LangFramework.ErrorRecordDeleted, LngError, LngSystem) +
              TSpecialFunctions.AddLineBreak(2) +
              TSingletonDB.GetInstance.GetTextFromLang('Check the current records again!', TSingletonDB.GetInstance.LangFramework.ErrorRecordDeletedMessage, LngError, LngSystem)
            );
          end;
        end
        else
        begin
          raise Exception.Create( TSingletonDB.GetInstance.GetTextFromLang('The record is locked by another user. Try again later.', TSingletonDB.GetInstance.LangFramework.WarningLockedRecord, LngWarning, LngSystem) );
        end;

        RefreshData;
        btnSpin.Visible := false;
        FormMode := ifmUpdate;
        btnAccept.Caption := TSingletonDB.GetInstance.GetTextFromLang('CONFIRM', TSingletonDB.GetInstance.LangFramework.ButtonAccept, LngButton, LngSystem);
        btnDelete.Visible := True;

        if Table.IsAuthorized(ptUpdate, True, False) then
          btnAccept.Enabled := True
        else
          btnAccept.Enabled := False;

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
      end
      else
      begin
        raise Exception.Create( TSingletonDB.GetInstance.GetTextFromLang('There is an active transaction. Complete it first!', TSingletonDB.GetInstance.LangFramework.WarningActiveTransaction, LngWarning, LngSystem) );
      end;

    end;

end;

procedure TfrmBaseInputDB.FormCreate(Sender: TObject);
begin
  inherited;

  TSingletonDB.GetInstance.HaneMiktari.SelectToList('', False, False);

  stbBase.Panels.Delete(STATUS_KEY_F7);
  stbBase.Panels.Delete(STATUS_KEY_F6);
  stbBase.Panels.Delete(STATUS_KEY_F5);
  stbBase.Panels.Delete(STATUS_KEY_F4);
  stbBase.Panels.Delete(STATUS_USERNAME);
  stbBase.Panels.Delete(STATUS_EX_RATE_EUR);
  stbBase.Panels.Delete(STATUS_EX_RATE_USD);
  stbBase.Panels.Delete(STATUS_DATE);

  pnlBottom.Visible := False;
  stbBase.Visible := True;
  pnlBottom.Visible := True;

  ResetSession();

  if (FormMode = ifmNewRecord) or (FormMode = ifmCopyNewRecord) then
  begin
    btnAccept.Visible := True;
    btnClose.Visible := True;
    btnAccept.Caption := TSingletonDB.GetInstance.GetTextFromLang('CONFIRM', TSingletonDB.GetInstance.LangFramework.ButtonAccept, LngButton, LngSystem);

    //TRUE olarak g�nder form ilk a��ld���ndan k���k-b�y�k harf ayar�n� yap.
    SetInputControlProperty(True);
  end
  else
  if FormMode = ifmRewiev then
  begin
    btnAccept.Visible := True;
    btnClose.Visible := True;

    btnAccept.Caption := TSingletonDB.GetInstance.GetTextFromLang('UPDATE', TSingletonDB.GetInstance.LangFramework.ButtonUpdate, LngButton, LngSystem);
    btnDelete.Caption := TSingletonDB.GetInstance.GetTextFromLang('DELETE', TSingletonDB.GetInstance.LangFramework.ButtonDelete, LngButton, LngSystem);
  end;
end;

procedure TfrmBaseInputDB.FormShow(Sender: TObject);
var
  vQualityFormNo: string;
begin
  inherited;

  //Form Numaras� status bara yaz
  stbBase.Panels.Items[STATUS_DATE].Text := '';
  if TSingletonDB.GetInstance.DataBase.Connection.Connected then
  begin
    vQualityFormNo := TSingletonDB.GetInstance.GetQualityFormNo(Table.TableName);
    if vQualityFormNo <> '' then
      stbBase.Panels.Items[STATUS_SQL_SERVER].Text := vQualityFormNo
    else
      stbBase.Panels.Items[STATUS_SQL_SERVER].Text := '';

    stbBase.Panels.Items[STATUS_SQL_SERVER].Width := stbBase.Width;
  end;

  SetCaptionFromLangContent();

  Self.Caption := TSingletonDB.GetInstance.GetTextFromLang(Self.Caption, ReplaceRealColOrTableNameTo(Table.TableName), LngInputFormCaption);

  if Self.FormMode = ifmRewiev then
  begin
    //e�er ba�ka pencerede a��k transaction varsa g�ncelleme moduna hi� girilmemli
    if (Table.Database.TranscationIsStarted) then
    begin
      btnAccept.Visible   := False;
      btnDelete.Visible     := False;
      btnAccept.OnClick   := nil;
      btnDelete.OnClick     := nil;
    end;

    if ParentForm <> nil then
    begin
      btnSpin.Visible := True;
    end;

    //Burada inceleme modunda oldu�u i�in b�t�n kontrolleri kapatmak gerekiyor.
    SetControlsDisabledOrEnabled(pnlMain, True);
  end
  else
  begin
    //Burada yeni kay�t veya g�ncelleme modunda oldu�u i�in b�t�n kontrolleri a�mak gerekiyor.
    SetControlsDisabledOrEnabled(pnlMain, False);
  end;

  if (FormMode <> ifmNewRecord ) then
    RefreshData;


  if (TSingletonDB.GetInstance.User.IsSuperUser.Value) and (FormMode = ifmRewiev) then
  begin
    //yeni kay�tta transactionlardan dolay� sorun oluyor. D�zeltmek i�in u�ral�lmad�
    SetLabelPopup();
  end;


  Application.ProcessMessages;
//  Repaint;
end;

procedure TfrmBaseInputDB.mniAddLanguageContentClick(Sender: TObject);
var
  vSysLangContent: TSysLangContents;
begin
  vSysLangContent := TSysLangContents.Create(TSingletonDB.GetInstance.DataBase);

  vSysLangContent.Lang.Value := TSingletonDB.GetInstance.DataBase.ConnSetting.Language;
  vSysLangContent.Code.Value := StringReplace(pmLabels.PopupComponent.Name, PREFIX_LABEL, '', [rfReplaceAll]);
  vSysLangContent.ContentType.Value := LngInputLabelCaption;
  vSysLangContent.TableName1.Value := ReplaceRealColOrTableNameTo(Table.TableName);
  vSysLangContent.Value.Value := TLabel(pmLabels.PopupComponent).Caption;

  TfrmSysLangContent.Create(Self, Self, vSysLangContent, True, ifmCopyNewRecord).ShowModal;

  SetCaptionFromLangContent();
end;

procedure TfrmBaseInputDB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if  ((self.FormMode = ifmNewRecord) or (self.FormMode = ifmUpdate))
  and ((Self.ParentForm <> nil) and (Self.ParentForm.Name = 'frmBaseDBGrid'))
  then
    TfrmBaseDBGrid(Self.ParentForm).RefreshData;

  Table.Database.Connection.Rollback;
end;

procedure TfrmBaseInputDB.FormDestroy(Sender: TObject);
begin
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
      if TSpecialFunctions.CustomMsgDlg(
        TSingletonDB.GetInstance.GetTextFromLang('Are you sure you want to exit?',TSingletonDB.GetInstance.LangFramework.MessageCloseWindow, LngMessage, LngSystem),
        mtConfirmation, mbYesNo, [TSingletonDB.GetInstance.GetTextFromLang('Yes',TSingletonDB.GetInstance.LangFramework.GeneralYesLower, LngGeneral, LngSystem),
                                  TSingletonDB.GetInstance.GetTextFromLang('No',TSingletonDB.GetInstance.LangFramework.GeneralNoLower, LngGeneral, LngSystem)], mbNo,
                                  TSingletonDB.GetInstance.GetTextFromLang('Confirmation',TSingletonDB.GetInstance.LangFramework.GeneralConfirmationLower, LngGeneral, LngSystem)) = mrYes
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

procedure TfrmBaseInputDB.ResetSession();
begin
  btnAccept.Enabled := false;
  btnDelete.Enabled := false;
  if not SetSession() then
  begin
    Self.Close;
    raise Exception.Create(TSingletonDB.GetInstance.GetTextFromLang('Access right failure!', TSingletonDB.GetInstance.LangFramework.ErrorAccessRight, LngError, LngSystem));
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
    Rect.Left + il16x16.Width + 4,
    Rect.Top + (stbBase.Height-Canvas.TextHeight(Panel.Text)) div 2 - 2,
    Panel.Text);

  vIco := -1;
  case Panel.Index of
    STATUS_SQL_SERVER:
    begin
      if Panel.Text <> '' then
        vIco := IMG_NOTE
      else
        vIco := -1;
    end;
  end;

  if vIco > -1 then
  begin
    il16x16.Draw(StatusBar.Canvas, Rect.Left, Rect.Top, vIco);
    Panel.Width := stbBase.Width;
  end;
end;

procedure TfrmBaseInputDB.SetCaptionFromLangContent;
var
  vCtx: TRttiContext;
  vRtf: TRttiField;
  vRtt: TRttiType;
  vLabel: TLabel;
begin
  vCtx := TRttiContext.Create;
  vRtt := vCtx.GetType(Self.ClassType);
  for vRtf in vRtt.GetFields do
    //label component isimleri lbl + db_field_name olacak �ekilde verilece�i varsay�larak bu kod yazildi. �rnek: lblcountry_code
    if vRtf.FieldType.Name = 'TLabel' then
    begin
      vLabel := TLabel(FindComponent(vRtf.Name));
      TLabel(vLabel).Caption :=
          TSingletonDB.GetInstance.GetTextFromLang(TLabel(vLabel).Caption,
          StringReplace(TLabel(vLabel).Name, PREFIX_LABEL, '', [rfReplaceAll]),
          LngInputLabelCaption,
          ReplaceRealColOrTableNameTo(Table.TableName));
    end;
end;

procedure TfrmBaseInputDB.SetLabelPopup(Sender: TControl);
var
  n1: Integer;
begin
  if Sender = nil then
  begin
    Sender := pnlMain;
    SetLabelPopup(Sender);
  end;


  for n1 := 0 to TWinControl(Sender).ControlCount-1 do
  begin
    if TWinControl(Sender).Controls[n1].ClassType = TPageControl then
      SetLabelPopup(TWinControl(Sender).Controls[n1])
    else if TWinControl(Sender).Controls[n1].ClassType = TTabSheet then
      SetLabelPopup(TWinControl(Sender).Controls[n1])
    else if TWinControl(Sender).Controls[n1].ClassType = TLabel then
    begin
      TLabel(TWinControl(Sender).Controls[n1]).PopupMenu := pmLabels;
    end;
  end;

end;

procedure TfrmBaseInputDB.SetControlsDisabledOrEnabled(pPanelGroupboxPagecontrolTabsheet: TWinControl; pIsDisable: Boolean);
var
  nIndex: Integer;
  PanelContainer: TWinControl;
begin
  PanelContainer := nil;

  if pPanelGroupboxPagecontrolTabsheet = nil then
    PanelContainer := pnlMain
  else
  begin
    if pPanelGroupboxPagecontrolTabsheet.ClassType = TPanel then
      PanelContainer := pPanelGroupboxPagecontrolTabsheet as TPanel
    else if pPanelGroupboxPagecontrolTabsheet.ClassType = TGroupBox then
      PanelContainer := pPanelGroupboxPagecontrolTabsheet as TGroupBox
    else if pPanelGroupboxPagecontrolTabsheet.ClassType = TPageControl then
      PanelContainer := pPanelGroupboxPagecontrolTabsheet as TPageControl
    else if pPanelGroupboxPagecontrolTabsheet.ClassType = TTabSheet then
      PanelContainer := pPanelGroupboxPagecontrolTabsheet as TTabSheet;
  end;

  for nIndex := 0 to PanelContainer.ControlCount-1 do
  begin
    if PanelContainer.Controls[nIndex].ClassType = TPanel then
      SetControlsDisabledOrEnabled(PanelContainer.Controls[nIndex] as TPanel, pIsDisable)
    else if PanelContainer.Controls[nIndex].ClassType = TGroupBox then
      SetControlsDisabledOrEnabled(PanelContainer.Controls[nIndex] as TGroupBox, pIsDisable)
    else if PanelContainer.Controls[nIndex].ClassType = TPageControl then
      SetControlsDisabledOrEnabled(PanelContainer.Controls[nIndex] as TPageControl, pIsDisable)
    else if PanelContainer.Controls[nIndex].ClassType = TTabSheet then
      SetControlsDisabledOrEnabled(PanelContainer.Controls[nIndex] as TTabSheet, pIsDisable)
    else
    if (TControl(PanelContainer.Controls[nIndex]).ClassType = TthsEdit)
    or (TControl(PanelContainer.Controls[nIndex]).ClassType = TEdit)
    then
      TEdit(PanelContainer.Controls[nIndex]).ReadOnly := pIsDisable
    else
    if (TControl(PanelContainer.Controls[nIndex]).ClassType = TComboBox)
    or (TControl(PanelContainer.Controls[nIndex]).ClassType = TthsCombobox)
    then
      TComboBox(PanelContainer.Controls[nIndex]).Enabled := (pIsDisable = False)
    else
    if (TControl(PanelContainer.Controls[nIndex]).ClassType = TMemo)
    or (TControl(PanelContainer.Controls[nIndex]).ClassType = TthsMemo)
    then
      TMemo(PanelContainer.Controls[nIndex]).ReadOnly := pIsDisable
    else if (TControl(PanelContainer.Controls[nIndex]).ClassType = TCheckBox) then
      TCheckBox(PanelContainer.Controls[nIndex]).Enabled := (pIsDisable = False)
    else if (TControl(PanelContainer.Controls[nIndex]).ClassType = TRadioGroup) then
      TRadioGroup(PanelContainer.Controls[nIndex]).Enabled := (pIsDisable = False)
    else if (TControl(PanelContainer.Controls[nIndex]).ClassType = TRadioButton) then
      TRadioButton(PanelContainer.Controls[nIndex]).Enabled := (pIsDisable = False);
  end;
end;

end.
