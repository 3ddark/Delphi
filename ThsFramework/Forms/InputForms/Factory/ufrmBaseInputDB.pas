unit ufrmBaseInputDB;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.ComCtrls, Dialogs,
  Vcl.Samples.Spin, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  thsEdit, //fyMemo, fyComboBox,
  Ths.Erp.Database,
  Ths.Erp.Database.Table,
  Ths.Erp.SpecialFunctions, Vcl.AppEvnts, ufrmBase, System.ImageList,
  Vcl.ImgList;

type
  TfrmBaseInputDB = class(TfrmBase)
    procedure btnSpinDownClick(Sender: TObject);override;
    procedure btnSpinUpClick(Sender: TObject);override;
    procedure btnCloseClick(Sender: TObject);override;
    procedure btnDeleteClick(Sender: TObject);override;
    procedure btnAcceptClick(Sender: TObject);override;
    procedure FormCreate(Sender: TObject);override;
    procedure FormShow(Sender: TObject);override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);override;
    procedure FormDestroy(Sender: TObject);override;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);override;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);override;
    procedure FormResize(Sender: TObject);override;
    procedure FormPaint(Sender: TObject);override;
  protected
    procedure RefreshData;virtual;abstract;
    procedure ResetSession();virtual;
    function SetSession():Boolean;virtual;
    procedure SetControlsDisabledOrEnabled(pPanelGroupboxPagecontrolTabsheet: TWinControl = nil; pIsDisable: Boolean = True);
  public
    procedure FormKeyPress(Sender: TObject; var Key: Char);override;
  end;

implementation

uses
  ufrmBaseDBGrid,
  Ths.Erp.Database.Table.SysUserAccessRight,
  ufrmMain;

{$R *.dfm}

procedure TfrmBaseInputDB.btnSpinDownClick(Sender: TObject);
begin
  inherited;
  TfrmBaseDBGrid(ParentForm).MoveUp;

  Table.SelectToList(' and id=' + IntToStr(TfrmBaseDBGrid(ParentForm).Table.Id), False, False);
  DefaultSelectFilter := ' and id=' + IntToStr(Table.Id);
  RefreshData;
end;

procedure TfrmBaseInputDB.btnSpinUpClick(Sender: TObject);
begin
  inherited;
  TfrmBaseDBGrid(ParentForm).MoveDown;

  table.SelectToList(' and id=' + IntToStr(TfrmBaseDBGrid(ParentForm).Table.Id), false, false);
  DefaultSelectFilter := ' and =' + IntToStr(Table.Id);
  RefreshData;
end;

procedure TfrmBaseInputDB.btnCloseClick(Sender: TObject);
begin
  if (FormMode = ifmRewiev) then
    inherited
  else
  begin
    if (TSpecialFunctions.CustomMsgDlg(
      'Are you sure you want to exit?   All changes will be canceled!!!',
      mtConfirmation, mbYesNo, ['Yes', 'No'], mbNo, 'Confirmation') = mrYes)
    then
      inherited;
  end;
end;

procedure TfrmBaseInputDB.btnDeleteClick(Sender: TObject);
begin
  if (FormMode = ifmUpdate)then
  begin
    if TSpecialFunctions.CustomMsgDlg('Are you sure you want to delete record?',
      mtConfirmation, mbYesNo, ['Yes', 'No'], mbNo, 'Confirmation') = mrYes
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
    if  (FormMode = ifmNewRecord) then
    begin
      if (Table.Database.TranscationIsStarted) then
      begin
        if (Table.LogicalInsert(id, (not Table.Database.TranscationIsStarted), WithCommitTransaction, False)) then
        begin
          if (Self.ParentForm <> nil) then
          begin
            TfrmBaseDBGrid(Self.ParentForm).Table.Id := id;
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
        raise Exception.Create('There is an active transaction. Complete it first!');
      end;
    end
    else
    if (FormMode = ifmUpdate) then
    begin
      //Burada yeni kay�t veya g�ncelleme modunda oldu�u i�in b�t�n kontrolleri a�mak gerekiyor.
      SetControlsDisabledOrEnabled(pnlMain, True);

      if TSpecialFunctions.CustomMsgDlg('Are you sure you want to update record?',
        mtConfirmation, mbYesNo, ['Yes', 'No'], mbNo, 'Confirmation') = mrYes
      then
      begin
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
          btnAccept.Caption := 'UPDATE';
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
      SetInputControlProperty();

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
            raise Exception.Create('The record was deleted by another user while you were on the review screen.' +
                                   TSpecialFunctions.AddLineBreak(2) + 'Check the current records again!');
        end
        else
          raise Exception.Create('The record is locked by another user. Try again later.');

        RefreshData;
        btnSpin.Visible := false;
        FormMode := ifmUpdate;
        btnAccept.Caption := 'CONFIRM';
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
        raise Exception.Create('There is an active transaction. Complete it first!');
      end;

    end;

end;

procedure TfrmBaseInputDB.FormCreate(Sender: TObject);
begin
  inherited;
  ResetSession();

  if FormMode = ifmNewRecord then
  begin
    btnAccept.Visible := True;
    btnClose.Visible := True;
    btnAccept.Caption := 'CONFIRM';

    SetInputControlProperty();
  end
  else
  if FormMode = ifmRewiev then
  begin
    btnAccept.Visible := True;
    btnClose.Visible := True;

    btnAccept.Caption := 'UPDATE';
    btnDelete.Caption := 'DELETE';
  end;
end;

procedure TfrmBaseInputDB.FormShow(Sender: TObject);
begin
  inherited;

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
  Repaint;
end;

procedure TfrmBaseInputDB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if((self.FormMode = ifmNewRecord) or (self.FormMode = ifmUpdate)) and(self.ParentForm <> nil) then
    TfrmBaseDBGrid(Self.ParentForm).RefreshData;

  Table.Database.Connection.Rollback;
end;

procedure TfrmBaseInputDB.FormDestroy(Sender: TObject);
begin
  Table.Database.Connection.Rollback;
  inherited;
  //
end;

procedure TfrmBaseInputDB.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  //
end;

procedure TfrmBaseInputDB.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (btnSpin.Visible) and (Key = VK_NEXT) then  //page_down
    btnSpinDownClick(btnSpin);
  if (btnSpin.Visible) and (Key = VK_PRIOR) then  //page_up
    btnSpinUpClick(btnSpin);

  inherited;
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
    raise Exception.Create('Access right failure!');
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
    //or (TControl(PanelContainer.Controls[nIndex]).ClassType = TfyComboBox)
    then
      TComboBox(PanelContainer.Controls[nIndex]).Enabled := (pIsDisable = False)
    else
    if (TControl(PanelContainer.Controls[nIndex]).ClassType = TMemo)
    //or (TControl(PanelContainer.Controls[nIndex]).ClassType = TfyMemo)
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

procedure TfrmBaseInputDB.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //ESC key Close action
  if Key = #27 then
  begin
    Key := #0;
    if (FormMode = ifmNewRecord) or (FormMode = ifmUpdate) then
    begin
      if TSpecialFunctions.CustomMsgDlg('Are you sure you want to exit?',
        mtConfirmation, mbYesNo, ['Yes', 'No'], mbNo, 'Confirmation') = mrYes
      then
        Close;
    end
    else
    if (FormMode = ifmRewiev) then
      Close;
  end;
end;

end.
