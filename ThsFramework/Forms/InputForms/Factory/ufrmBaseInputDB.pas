unit ufrmBaseInputDB;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.ComCtrls,
  Vcl.Samples.Spin, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  fyEdit, fyMemo, fyComboBox,
  Ths.Erp.Database,
  Ths.Erp.Database.Table,
  uGenel, Vcl.AppEvnts, ufrmBase;

type
  TfrmBaseInputDB = class(TfrmBase)
    procedure btnSpinDownClick(Sender: TObject);override;
    procedure btnSpinUpClick(Sender: TObject);override;
    procedure btnKapatClick(Sender: TObject);override;
    procedure btnSilClick(Sender: TObject);override;
    procedure btnTamamClick(Sender: TObject);override;
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
    procedure fillSelectionBox();virtual;

  end;

implementation

uses
  uConstGenel,
  ufrmBaseDBGrid,
  uKaynakErisimHakki, uSingleton;

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

procedure TfrmBaseInputDB.btnKapatClick(Sender: TObject);
begin
  if (FormTipi = FORM_INCELEME) then
    inherited
  else
  begin
    if (Application.MessageBox(
        PWideChar('��kmak istedi�inden emin misin?' + TGenel.AddLineBreak(2) +
                  'Yap�lan i�lemler kay�t edilmeden ��k�� yap�lacak.'),
        PWideChar('��lem Onay�'), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes)
    then
      inherited;
  end;
end;

procedure TfrmBaseInputDB.btnSilClick(Sender: TObject);
begin
  if (FormTipi = FORM_GUNCELLEME)then
  begin
      if Application.MessageBox(
          PWideChar('Kayd� silmek istedi�inden emin misin?' + TGenel.AddLineBreak(2) +
                    'Bu i�lemin geri d�n��� yoktur. Kayd�n�z silinecektir.'),
          PWideChar('��lem Onay�'), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes
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
          FormTipi := FORM_INCELEME;
          btnSil.Visible := False;

          Repaint;
        end;
      end;
  end;
end;

procedure TfrmBaseInputDB.btnTamamClick(Sender: TObject);
var
  id, nIndex : integer;
begin
  btnTamam.Enabled := False;
  try
    id := 0;
    if  (FormTipi = FORM_YENI_KAYIT) then
    begin
      if (Table.Database.HasTransactionBegun) then
      begin
        if (Table.LogicalInsert(id, (not Table.Database.HasTransactionBegun), WithCommitTransaction, False)) then
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
          if (Table.Database.HasTransactionBegun) then
            Close;
        end;
      end
      else
      begin
        raise Exception.Create('�u anda aktif bir transaction var, �nce onu tamamlay�n!');
      end;
    end
    else
    if (FormTipi = FORM_GUNCELLEME) then
    begin
      //Burada yeni kay�t veya g�ncelleme modunda oldu�u i�in b�t�n kontrolleri a�mak gerekiyor.
      SetControlsDisabledOrEnabled(PanelMain, True);

        if Application.MessageBox(
          PWideChar('Kayd� g�ncellemek istedi�inden emin misin?'),
          PWideChar('��lem Onay�'), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes
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
            FormTipi := FORM_INCELEME;
            btnTamam.Caption := '!';
            btnSil.Visible := false;
            Repaint;
          end;
        end;
    end
    else if (FormTipi = FORM_INCELEME) then
    begin
      //Burada yeni kay�t veya g�ncelleme modunda oldu�u i�in b�t�n kontrolleri a�mak gerekiyor.
      SetControlsDisabledOrEnabled(PanelMain, False);

      if (not table.Database.HasTransactionBegun) then
      begin
        //kay�t kilitle, e�er ba�ka kullan�c� tarf�ndan bu esnada silinmemi�se
        if (Table.LogicalSelect(DefaultSelectFilter, True, ( not Table.Database.HasTransactionBegun), True)) then
        begin
          //e�er aranan kay�t ba�ka bir kullan�c� taraf�ndan silinmi�se count 0 kal�r
          if (Table.List.Count = 1) then
          begin
            //detayl� tablelar listeye dolduruyo i�eri�ini
            Table := TTable(Table.List[0]).Clone;
          end
          else
            raise Exception.Create('Kay�t siz inceleme ekran�ndayken ba�ka kullan�c� taraf�ndan silinmi�. G�ncel kay�tlara tekrar bak�n�z!');
        end
        else
          raise Exception.Create('Kay�t ba�ka kullan�c� taraf�ndan kilitlenmi�.  Daha sonra tekrar deneyin.');

        //todo:zafer
        //a��lan t�m pencereleri kapatabilene kadar yaratma
        //
        //lock_timer := TLockTimerThread.Create(self, false);
        RefreshData;
        btnSpin.Visible := false;
        FormTipi := FORM_GUNCELLEME;
        btnTamam.Caption := 'TAMAM';
        btnSil.Visible := true;
        Repaint;

        //burada varsa ilk komponent setfocus yap�lmal�
        for nIndex := 0 to PanelMain.ControlCount-1 do
        begin
          if TControl(PanelMain.Controls[nIndex]) is TWinControl then
          begin
            TWinControl(PanelMain.Controls[nIndex]).SetFocus;
            break;
          end;
        end;

        btnSil.Left := btnTamam.Left-btnSil.Width;
      end
      else
      begin
        raise Exception.Create('�u anda aktif bir transaction var, �nce onu tamamlay�n!');
      end;

    end;

  finally
    btnTamam.Enabled := True;
  end;
end;

procedure TfrmBaseInputDB.FormCreate(Sender: TObject);
begin
  inherited;
  ResetSession();

  if FormTipi = FORM_YENI_KAYIT then
  begin
    btnTamam.Visible := True;
    btnKapat.Visible := True;
  end
  else
  if FormTipi = FORM_INCELEME then
  begin
    btnTamam.Visible := True;
    btnKapat.Visible := True;

    btnTamam.Caption := 'G�NCELLE';
  end;

  fillSelectionBox();
end;

procedure TfrmBaseInputDB.FormShow(Sender: TObject);
begin
  inherited;

  if Self.FormTipi = FORM_INCELEME then
  begin
    //e�er ba�ka pencerede a��k transaction varsa g�ncelleme moduna hi� girilmemli
    if (Table.Database.HasTransactionBegun) then
    begin
      btnTamam.Visible   := False;
      btnSil.Visible     := False;
      btnTamam.OnClick   := nil;
      btnSil.OnClick     := nil;
    end;

    if ParentForm <> nil then
    begin
      btnSpin.Visible := True;
    end;

    //Burada inceleme modunda oldu�u i�in b�t�n kontrolleri kapatmak gerekiyor.
    SetControlsDisabledOrEnabled(PanelMain, True);
  end
  else
  begin
    //Burada yeni kay�t veya g�ncelleme modunda oldu�u i�in b�t�n kontrolleri a�mak gerekiyor.
    SetControlsDisabledOrEnabled(PanelMain, False);
  end;


  if (FormTipi <> FORM_YENI_KAYIT ) then
    RefreshData;
  Repaint;
end;

procedure TfrmBaseInputDB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if((self.FormTipi = FORM_YENI_KAYIT) or (self.FormTipi = FORM_GUNCELLEME)) and(self.ParentForm <> nil) then
    TfrmBaseDBGrid(Self.ParentForm).RefreshData;

  Table.Database.Connection.GetConn.Rollback;
end;

procedure TfrmBaseInputDB.FormDestroy(Sender: TObject);
begin
  Table.Database.Connection.GetConn.Rollback;
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
  btnTamam.Enabled := false;
  btnSil.Enabled := false;
  if not SetSession() then
  begin
    self.Close;
    raise Exception.Create('Eri�im hakk� hatas�!');
  end;
end;

function TfrmBaseInputDB.SetSession():Boolean;
var
  erisim_haklari: TKaynakErisimHakki;
begin
  Result := False;

//  erisim_haklari  := TKaynakErisimHakki.Create(Table.Database);
//  try
//    erisim_haklari.select_to_list(' and kullanici_id = ' + IntToStr(SingletonDB.Kullanici.Id) +
//                                  ' and (is_read=True or is_write=True or is_delete=True) ' +
//                                  ' and k.kaynak = ' + QuotedStr(KaynakAdi) +
//                                  ' and table_name = ' + QuotedStr(Table.TableName), False);
//    if (erisim_haklari.List.Count = 1) then
//    begin
//      if (TKaynakErisimHakki(erisim_haklari.List[0]).IsRead) then
//      begin
//        Result:=true;
//      end;
//      if (TKaynakErisimHakki(erisim_haklari.List[0]).IsWrite)  then
//      begin
//        //yazma veya silme hakk� varsa true d�nd�r
//        btnTamam.Enabled := true;
//        Result:=true;
//      end;
//      if (TKaynakErisimHakki(erisim_haklari.List[0]).IsDelete) then
//      begin
//        //yazma veya silme hakk� varsa true d�nd�r
//        btnSil.Enabled := true;
//        Result:=true;
//      end;
//    end;
//  finally
//    erisim_haklari.Free;
//  end;
  Result := True;
end;

procedure TfrmBaseInputDB.SetControlsDisabledOrEnabled(pPanelGroupboxPagecontrolTabsheet: TWinControl; pIsDisable: Boolean);
var
  nIndex: Integer;
  PanelContainer: TWinControl;
begin
  PanelContainer := nil;

  if pPanelGroupboxPagecontrolTabsheet = nil then
    PanelContainer := PanelMain
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
    if (TControl(PanelContainer.Controls[nIndex]).ClassType = TfyEdit)
    or (TControl(PanelContainer.Controls[nIndex]).ClassType = TEdit)
    then
      TEdit(PanelContainer.Controls[nIndex]).ReadOnly := pIsDisable
    else
    if (TControl(PanelContainer.Controls[nIndex]).ClassType = TfyComboBox)
    or (TControl(PanelContainer.Controls[nIndex]).ClassType = TComboBox)
    then
      TComboBox(PanelContainer.Controls[nIndex]).Enabled := (pIsDisable = False)
    else
    if (TControl(PanelContainer.Controls[nIndex]).ClassType = TfyMemo)
    or (TControl(PanelContainer.Controls[nIndex]).ClassType = TMemo)
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
  //esc tu�uyla kapanma
  if Key = #27 then
  begin
    Key := #0;
    if (FormTipi = FORM_YENI_KAYIT) or (FormTipi = FORM_GUNCELLEME) then
    begin
      if Application.MessageBox(
        PWideChar('��kmak istedi�inize emin misiniz?'),
        PWideChar('��lem Onay�'), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes
      then
        Close;
    end
    else
    if (FormTipi = FORM_INCELEME) then
      Close;
  end;
end;

procedure TfrmBaseInputDB.fillSelectionBox;
begin
  //
end;

end.
