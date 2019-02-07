unit ufrmStokTipi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, StrUtils,
  Vcl.AppEvnts,
  Ths.Erp.Helper.Edit, Ths.Erp.Helper.ComboBox, Ths.Erp.Helper.Memo,

  ufrmBase, ufrmBaseInputDB, Vcl.Menus, Vcl.Samples.Spin;

type
  TfrmStokTipi = class(TfrmBaseInputDB)
    lblTip: TLabel;
    edtTip: TEdit;
    lblIsDefault: TLabel;
    chkIsDefault: TCheckBox;
    lblIsStokHareketiYap: TLabel;
    chkIsStokHareketiYap: TCheckBox;
    procedure FormCreate(Sender: TObject);override;
    procedure RefreshData();override;
    procedure btnAcceptClick(Sender: TObject);override;
  private
    function VarsayilanKontrol(): Boolean;
  public
  protected
    function ValidateInput(panel_groupbox_pagecontrol_tabsheet: TWinControl = nil): Boolean;
      override;
  published
    procedure btnDeleteClick(Sender: TObject); override;
  end;

implementation

uses
  Ths.Erp.Database.Singleton,
  Ths.Erp.Functions,
  Ths.Erp.Constants,
  Ths.Erp.Database.Table.StokTipi;

{$R *.dfm}

procedure TfrmStokTipi.btnDeleteClick(Sender: TObject);
begin
  //silme i�leminde, i�lem �ncesinde varsay�lan olan kay�t silinemez �nce ba�ka bir varsay�lan se�ilmeli
  if (FormMode = ifmUpdate) then
  begin
    if (FormatedVariantVal(TStokTipi(Table).IsDefault.FieldType, TStokTipi(Table).IsDefault.Value) = True) then
    begin
      if VarsayilanKontrol then
        inherited;
    end
    else
      inherited;
  end
  else
    inherited;
end;

procedure TfrmStokTipi.FormCreate(Sender: TObject);
begin
  TStokTipi(Table).Tip.SetControlProperty(Table.TableName, edtTip);

  inherited;
end;

procedure TfrmStokTipi.RefreshData();
begin
  //control i�eri�ini table class ile doldur
  edtTip.Text := FormatedVariantVal(TStokTipi(Table).Tip.FieldType, TStokTipi(Table).Tip.Value);
  chkIsDefault.Checked := FormatedVariantVal(TStokTipi(Table).IsDefault.FieldType, TStokTipi(Table).IsDefault.Value);
  chkIsStokHareketiYap.Checked := FormatedVariantVal(TStokTipi(Table).IsStokHareketiYap.FieldType, TStokTipi(Table).IsStokHareketiYap.Value);
end;

function TfrmStokTipi.ValidateInput(
  panel_groupbox_pagecontrol_tabsheet: TWinControl): Boolean;
begin
  Result := inherited ValidateInput();

  //g�ncelleme i�leminde, i�lem �ncesinde varsay�lan olan kayd�n varsay�lan i�aretini kald�ramazs�n�z �nce ba�ka bir varsay�lan se�ilmeli
  if ((FormMode = ifmUpdate) and (not chkIsDefault.Checked)
  and (FormatedVariantVal(TStokTipi(Table).IsDefault.FieldType, TStokTipi(Table).IsDefault.Value) = True)) then
    Result := VarsayilanKontrol;
end;

function TfrmStokTipi.VarsayilanKontrol: Boolean;
begin
  Result := True;
  if ((FormMode = ifmUpdate)
  and (not chkIsDefault.Checked)
  and (FormatedVariantVal(TStokTipi(Table).IsDefault.FieldType, TStokTipi(Table).IsDefault.Value) = True))
  then
    Result := False;
    CustomMsgDlg(
      ReplaceMessages(
      TranslateText(
          'Bu i�lemi yapamazs�n�z! Bu i�lemde "Varsay�lan" i�areti kald�r�l�yor.' + AddLBs +
          '�nce ba�ka bir kayd� "Varsay�lan" olarak se�melisiniz.' + AddLBs +
          'Daha sonra bu kayd�n Varsay�lan i�aretini kad�rabilirsiniz.',
          'Stok Tipi Varsayilan Yok', LngMsgData, LngApplication), [''], ['']),
          mtError, [mbOK], [TranslateText('Tamam', FrameworkLang.ButtonOK, LngButton, LngSystem)], mbOK,
          TranslateText('Di�er', FrameworkLang.MessageTitleError, LngMsgTitle, LngSystem)
    );
end;

procedure TfrmStokTipi.btnAcceptClick(Sender: TObject);
begin
  if (FormMode = ifmNewRecord) or (FormMode = ifmCopyNewRecord) or (FormMode = ifmUpdate) then
  begin
    if (ValidateInput) then
    begin
      TStokTipi(Table).Tip.Value := edtTip.Text;
      TStokTipi(Table).IsDefault.Value := chkIsDefault.Checked;
      TStokTipi(Table).IsStokHareketiYap.Value := chkIsStokHareketiYap.Checked;
      inherited;
    end;
  end
  else
    inherited;
end;

end.
