unit Ths.Erp.Database.Table.SysApplicationSettingsOther;

interface

uses
  SysUtils, Classes, Dialogs, Forms, Windows, Controls, Types, DateUtils,
  FireDAC.Stan.Param, System.Variants, Data.DB,
  Ths.Erp.Database,
  Ths.Erp.Database.Table,
  Ths.Erp.Database.Table.Field;

type
  TSysApplicationSettingsOther = class(TTable)
  private
    FIsEdefterAktif: TFieldDB;
    FVarsayilanSatisCariKod: TFieldDB;
    FVarsayilanAlisCariKod: TFieldDB;
    FIsBolumAmbardaUretimYap: TFieldDB;
    FIsUretimMuhasebeKaydiOlustursun: TFieldDB;
    FIsStokSatimdaNegatifeDusebilir: TFieldDB;
    FIsMalSatisSayilariniGoster: TFieldDB;
    FIsPcbUretim: TFieldDB;
    FIsProformaNoGoster: TFieldDB;
    FIsSatisTakip: TFieldDB;
    FIsHammaddeGiriseGoreSirala: TFieldDB;
    FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle: TFieldDB;
    FIsTahsilatListesiVirmanli: TFieldDB;
    FIsOrtalamaVadeSifirsaSevkiyataIzinVerme: TFieldDB;
    FIsSiparisteTeslimTarihiYazdir: TFieldDB;
    FIsTeklifAyrintilariniGoster: TFieldDB;
    FIsFaturaIrsaliyeNoSifirlaBaslasin: TFieldDB;
    FIsExcelEkliIrsaliyeYazdirma: TFieldDB;
    FIsAmbarTransferNumarasiOtomatikGelsin: TFieldDB;
    FIsAmbarTransferOnayliCalissin: TFieldDB;
  protected
  published
    constructor Create(OwnerDatabase:TDatabase);override;
  public
    procedure SelectToDatasource(pFilter: string; pPermissionControl: Boolean=True); override;
    procedure SelectToList(pFilter: string; pLock: Boolean; pPermissionControl: Boolean=True); override;
    procedure Insert(out pID: Integer; pPermissionControl: Boolean=True); override;
    procedure Update(pPermissionControl: Boolean=True); override;

    procedure Clear();override;
    function Clone():TTable;override;

    Property IsEdefterAktif: TFieldDB read FIsEdefterAktif write FIsEdefterAktif;
    Property VarsayilanSatisCariKod: TFieldDB read FVarsayilanSatisCariKod write FVarsayilanSatisCariKod;
    Property VarsayilanAlisCariKod: TFieldDB read FVarsayilanAlisCariKod write FVarsayilanAlisCariKod;
    Property IsBolumAmbardaUretimYap: TFieldDB read FIsBolumAmbardaUretimYap write FIsBolumAmbardaUretimYap;
    Property IsUretimMuhasebeKaydiOlustursun: TFieldDB read FIsUretimMuhasebeKaydiOlustursun write FIsUretimMuhasebeKaydiOlustursun;
    Property IsStokSatimdaNegatifeDusebilir: TFieldDB read FIsStokSatimdaNegatifeDusebilir write FIsStokSatimdaNegatifeDusebilir;
    Property IsMalSatisSayilariniGoster: TFieldDB read FIsMalSatisSayilariniGoster write FIsMalSatisSayilariniGoster;
    Property IsPcbUretim: TFieldDB read FIsPcbUretim write FIsPcbUretim;
    Property IsProformaNoGoster: TFieldDB read FIsProformaNoGoster write FIsProformaNoGoster;
    Property IsSatisTakip: TFieldDB read FIsSatisTakip write FIsSatisTakip;
    Property IsHammaddeGiriseGoreSirala: TFieldDB read FIsHammaddeGiriseGoreSirala write FIsHammaddeGiriseGoreSirala;
    Property IsUretimEntegrasyonHammaddeKullanimHesabiIscilikle: TFieldDB read FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle write FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle;
    Property IsTahsilatListesiVirmanli: TFieldDB read FIsTahsilatListesiVirmanli write FIsTahsilatListesiVirmanli;
    Property IsOrtalamaVadeSifirsaSevkiyataIzinVerme: TFieldDB read FIsOrtalamaVadeSifirsaSevkiyataIzinVerme write FIsOrtalamaVadeSifirsaSevkiyataIzinVerme;
    Property IsSiparisteTeslimTarihiYazdir: TFieldDB read FIsSiparisteTeslimTarihiYazdir write FIsSiparisteTeslimTarihiYazdir;
    Property IsTeklifAyrintilariniGoster: TFieldDB read FIsTeklifAyrintilariniGoster write FIsTeklifAyrintilariniGoster;
    Property IsFaturaIrsaliyeNoSifirlaBaslasin: TFieldDB read FIsFaturaIrsaliyeNoSifirlaBaslasin write FIsFaturaIrsaliyeNoSifirlaBaslasin;
    Property IsExcelEkliIrsaliyeYazdirma: TFieldDB read FIsExcelEkliIrsaliyeYazdirma write FIsExcelEkliIrsaliyeYazdirma;
    Property IsAmbarTransferNumarasiOtomatikGelsin: TFieldDB read FIsAmbarTransferNumarasiOtomatikGelsin write FIsAmbarTransferNumarasiOtomatikGelsin;
    Property IsAmbarTransferOnayliCalissin: TFieldDB read FIsAmbarTransferOnayliCalissin write FIsAmbarTransferOnayliCalissin;
  end;

implementation

uses
  Ths.Erp.Constants,
  Ths.Erp.Database.Singleton;

constructor TSysApplicationSettingsOther.Create(OwnerDatabase:TDatabase);
begin
  inherited Create(OwnerDatabase);
  TableName := 'sys_application_settings_other';
  SourceCode := '1000';

  FIsEdefterAktif := TFieldDB.Create('is_edefter_aktif', ftBoolean, 0);
  FVarsayilanSatisCariKod := TFieldDB.Create('varsayilan_satis_cari_kod', ftString, '');
  FVarsayilanAlisCariKod := TFieldDB.Create('varsayilan_alis_cari_kod', ftString, '');
  FIsBolumAmbardaUretimYap := TFieldDB.Create('is_bolum_ambarda_uretim_yap', ftBoolean, 0);
  FIsUretimMuhasebeKaydiOlustursun := TFieldDB.Create('is_uretim_muhasebe_kaydi_olustursun', ftBoolean, 0);
  FIsStokSatimdaNegatifeDusebilir := TFieldDB.Create('is_stok_satimda_negatife_dusebilir', ftBoolean, 0);
  FIsMalSatisSayilariniGoster := TFieldDB.Create('is_mal_satis_sayilarini_goster', ftBoolean, 0);
  FIsPcbUretim := TFieldDB.Create('is_pcb_uretim', ftBoolean, 0);
  FIsSatisTakip := TFieldDB.Create('is_satis_takip', ftBoolean, 0);
  FIsHammaddeGiriseGoreSirala := TFieldDB.Create('is_hammadde_girise_gore_sirala', ftString, '');
  FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle := TFieldDB.Create('is_uretim_entegrasyon_hammadde_kullanim_hesabi_iscilikle', ftBoolean, 0);
  FIsTahsilatListesiVirmanli := TFieldDB.Create('is_tahsilat_listesi_virmanli', ftBoolean, 0);
  FIsOrtalamaVadeSifirsaSevkiyataIzinVerme := TFieldDB.Create('is_ortalama_vade_0_ise_sevkiyata_izin_verme', ftBoolean, 0);
  FIsSiparisteTeslimTarihiYazdir := TFieldDB.Create('is_sipariste_teslim_tarihi_yazdir', ftBoolean, 0);
  FIsTeklifAyrintilariniGoster := TFieldDB.Create('is_teklif_ayrintilarini_goster', ftBoolean, 0);
  FIsFaturaIrsaliyeNoSifirlaBaslasin := TFieldDB.Create('is_fatura_irsaliye_no_0_ile_baslasin', ftBoolean, 0);
  FIsExcelEkliIrsaliyeYazdirma := TFieldDB.Create('is_excel_ekli_irsaliye_yazdirma', ftBoolean, 0);
  FIsAmbarTransferNumarasiOtomatikGelsin := TFieldDB.Create('is_ambar_transfer_numara_otomatik_gelsin', ftBoolean, 0);
  FIsAmbarTransferOnayliCalissin := TFieldDB.Create('is_ambar_transfer_onayli_calissin', ftBoolean, 0);
end;

procedure TSysApplicationSettingsOther.SelectToDatasource(pFilter: string; pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptRead, pPermissionControl) then
  begin
    with QueryOfTable do
    begin
      Close;
      SQL.Clear;
      SQL.Text := Database.GetSQLSelectCmd(TableName, [
        TableName + '.' + Self.Id.FieldName,
        TableName + '.' + FIsEdefterAktif.FieldName,
        TableName + '.' + FVarsayilanSatisCariKod.FieldName,
        TableName + '.' + FVarsayilanAlisCariKod.FieldName,
        TableName + '.' + FIsBolumAmbardaUretimYap.FieldName,
        TableName + '.' + FIsUretimMuhasebeKaydiOlustursun.FieldName,
        TableName + '.' + FIsStokSatimdaNegatifeDusebilir.FieldName,
        TableName + '.' + FIsMalSatisSayilariniGoster.FieldName,
        TableName + '.' + FIsPcbUretim.FieldName,
        TableName + '.' + FIsProformaNoGoster.FieldName,
        TableName + '.' + FIsSatisTakip.FieldName,
        TableName + '.' + FIsHammaddeGiriseGoreSirala.FieldName,
        TableName + '.' + FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.FieldName,
        TableName + '.' + FIsTahsilatListesiVirmanli.FieldName,
        TableName + '.' + FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.FieldName,
        TableName + '.' + FIsSiparisteTeslimTarihiYazdir.FieldName,
        TableName + '.' + FIsTeklifAyrintilariniGoster.FieldName,
        TableName + '.' + FIsFaturaIrsaliyeNoSifirlaBaslasin.FieldName,
        TableName + '.' + FIsExcelEkliIrsaliyeYazdirma.FieldName,
        TableName + '.' + FIsAmbarTransferNumarasiOtomatikGelsin.FieldName,
        TableName + '.' + FIsAmbarTransferOnayliCalissin.FieldName
      ]) +
      'WHERE 1=1 ' + pFilter;
      Open;
      Active := True;

      Self.DataSource.DataSet.FindField(Self.Id.FieldName).DisplayLabel := 'ID';
      Self.DataSource.DataSet.FindField(FIsEdefterAktif.FieldName).DisplayLabel := 'E-Defter Aktif?';
      Self.DataSource.DataSet.FindField(FVarsayilanSatisCariKod.FieldName).DisplayLabel := 'Varsay�lan Sat�� Cari Kod';
      Self.DataSource.DataSet.FindField(FVarsayilanAlisCariKod.FieldName).DisplayLabel := 'Varsay�lan Al�� Cari Kod';
      Self.DataSource.DataSet.FindField(FIsBolumAmbardaUretimYap.FieldName).DisplayLabel := 'B�l�m Ambarda �retim Yap';
      Self.DataSource.DataSet.FindField(FIsUretimMuhasebeKaydiOlustursun.FieldName).DisplayLabel := '�retim Muhasebe Kayd� Olu�tursun?';
      Self.DataSource.DataSet.FindField(FIsStokSatimdaNegatifeDusebilir.FieldName).DisplayLabel := 'Stok Sat�mda Negatife D��ebilir?';
      Self.DataSource.DataSet.FindField(FIsMalSatisSayilariniGoster.FieldName).DisplayLabel := 'Mal Sat�� Say�lar�n� G�ster';
      Self.DataSource.DataSet.FindField(FIsPcbUretim.FieldName).DisplayLabel := 'PCB �retim';
      Self.DataSource.DataSet.FindField(FIsProformaNoGoster.FieldName).DisplayLabel := 'Proforma Numaras� G�ster';
      Self.DataSource.DataSet.FindField(FIsSatisTakip.FieldName).DisplayLabel := 'Sat�� Takip';
      Self.DataSource.DataSet.FindField(FIsHammaddeGiriseGoreSirala.FieldName).DisplayLabel := 'Hammadde Giri�e G�re S�rala';
      Self.DataSource.DataSet.FindField(FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.FieldName).DisplayLabel := '�retim Entegrasyon Hamadde Kullan�m Hesab� ���ilikle';
      Self.DataSource.DataSet.FindField(FIsTahsilatListesiVirmanli.FieldName).DisplayLabel := 'Tahsilat Listesi Virmanl�';
      Self.DataSource.DataSet.FindField(FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.FieldName).DisplayLabel := 'Ortalama Vade S�f�r ise Sevkiyata �zin Verme';
      Self.DataSource.DataSet.FindField(FIsSiparisteTeslimTarihiYazdir.FieldName).DisplayLabel := 'Sipari�te Teslim Tarihi Yazd�r';
      Self.DataSource.DataSet.FindField(FIsTeklifAyrintilariniGoster.FieldName).DisplayLabel := 'Teklif Ayr�nt�lar�n� G�ster';
      Self.DataSource.DataSet.FindField(FIsFaturaIrsaliyeNoSifirlaBaslasin.FieldName).DisplayLabel := 'Fatura-�rsaliye No S�f�rla Ba�las�n';
      Self.DataSource.DataSet.FindField(FIsExcelEkliIrsaliyeYazdirma.FieldName).DisplayLabel := 'Excel Ekli �rsaliye Yazd�rma';
      Self.DataSource.DataSet.FindField(FIsAmbarTransferNumarasiOtomatikGelsin.FieldName).DisplayLabel := 'Ambar Transfer Numaras� Otomatik Gelsin';
      Self.DataSource.DataSet.FindField(FIsAmbarTransferOnayliCalissin.FieldName).DisplayLabel := 'Ambar Transfer Onayl� �al��s�n';
    end;
  end;
end;

procedure TSysApplicationSettingsOther.SelectToList(pFilter: string; pLock: Boolean; pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptRead, pPermissionControl) then
  begin
    if (pLock) then
      pFilter := pFilter + ' FOR UPDATE NOWAIT; ';

    with QueryOfTable do
    begin
      Close;
      SQL.Text := Database.GetSQLSelectCmd(TableName, [
        TableName + '.' + Self.Id.FieldName,
        TableName + '.' + FIsEdefterAktif.FieldName,
        TableName + '.' + FVarsayilanSatisCariKod.FieldName,
        TableName + '.' + FVarsayilanAlisCariKod.FieldName,
        TableName + '.' + FIsBolumAmbardaUretimYap.FieldName,
        TableName + '.' + FIsUretimMuhasebeKaydiOlustursun.FieldName,
        TableName + '.' + FIsStokSatimdaNegatifeDusebilir.FieldName,
        TableName + '.' + FIsMalSatisSayilariniGoster.FieldName,
        TableName + '.' + FIsPcbUretim.FieldName,
        TableName + '.' + FIsProformaNoGoster.FieldName,
        TableName + '.' + FIsSatisTakip.FieldName,
        TableName + '.' + FIsHammaddeGiriseGoreSirala.FieldName,
        TableName + '.' + FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.FieldName,
        TableName + '.' + FIsTahsilatListesiVirmanli.FieldName,
        TableName + '.' + FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.FieldName,
        TableName + '.' + FIsSiparisteTeslimTarihiYazdir.FieldName,
        TableName + '.' + FIsTeklifAyrintilariniGoster.FieldName,
        TableName + '.' + FIsFaturaIrsaliyeNoSifirlaBaslasin.FieldName,
        TableName + '.' + FIsExcelEkliIrsaliyeYazdirma.FieldName,
        TableName + '.' + FIsAmbarTransferNumarasiOtomatikGelsin.FieldName,
        TableName + '.' + FIsAmbarTransferOnayliCalissin.FieldName
      ]) +
      'WHERE 1=1 ' + pFilter;
      Open;

      FreeListContent();
      List.Clear;
      while NOT EOF do
      begin
        Self.Id.Value := FormatedVariantVal(FieldByName(Self.Id.FieldName).DataType, FieldByName(Self.Id.FieldName).Value);

        FIsEdefterAktif.Value := FormatedVariantVal(FieldByName(FIsEdefterAktif.FieldName).DataType, FieldByName(FIsEdefterAktif.FieldName).Value);
        FVarsayilanSatisCariKod.Value := FormatedVariantVal(FieldByName(FVarsayilanSatisCariKod.FieldName).DataType, FieldByName(FVarsayilanSatisCariKod.FieldName).Value);
        FVarsayilanAlisCariKod.Value := FormatedVariantVal(FieldByName(FVarsayilanAlisCariKod.FieldName).DataType, FieldByName(FVarsayilanAlisCariKod.FieldName).Value);
        FIsBolumAmbardaUretimYap.Value := FormatedVariantVal(FieldByName(FIsBolumAmbardaUretimYap.FieldName).DataType, FieldByName(FIsBolumAmbardaUretimYap.FieldName).Value);
        FIsUretimMuhasebeKaydiOlustursun.Value := FormatedVariantVal(FieldByName(FIsUretimMuhasebeKaydiOlustursun.FieldName).DataType, FieldByName(FIsUretimMuhasebeKaydiOlustursun.FieldName).Value);
        FIsStokSatimdaNegatifeDusebilir.Value := FormatedVariantVal(FieldByName(FIsStokSatimdaNegatifeDusebilir.FieldName).DataType, FieldByName(FIsStokSatimdaNegatifeDusebilir.FieldName).Value);
        FIsMalSatisSayilariniGoster.Value := FormatedVariantVal(FieldByName(FIsMalSatisSayilariniGoster.FieldName).DataType, FieldByName(FIsMalSatisSayilariniGoster.FieldName).Value);
        FIsPcbUretim.Value := FormatedVariantVal(FieldByName(FIsPcbUretim.FieldName).DataType, FieldByName(FIsPcbUretim.FieldName).Value);
        FIsProformaNoGoster.Value := FormatedVariantVal(FieldByName(FIsProformaNoGoster.FieldName).DataType, FieldByName(FIsProformaNoGoster.FieldName).Value);
        FIsSatisTakip.Value := FormatedVariantVal(FieldByName(FIsSatisTakip.FieldName).DataType, FieldByName(FIsSatisTakip.FieldName).Value);
        FIsHammaddeGiriseGoreSirala.Value := FormatedVariantVal(FieldByName(FIsHammaddeGiriseGoreSirala.FieldName).DataType, FieldByName(FIsHammaddeGiriseGoreSirala.FieldName).Value);
        FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.Value := FormatedVariantVal(FieldByName(FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.FieldName).DataType, FieldByName(FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.FieldName).Value);
        FIsTahsilatListesiVirmanli.Value := FormatedVariantVal(FieldByName(FIsTahsilatListesiVirmanli.FieldName).DataType, FieldByName(FIsTahsilatListesiVirmanli.FieldName).Value);
        FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.Value := FormatedVariantVal(FieldByName(FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.FieldName).DataType, FieldByName(FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.FieldName).Value);
        FIsSiparisteTeslimTarihiYazdir.Value := FormatedVariantVal(FieldByName(FIsSiparisteTeslimTarihiYazdir.FieldName).DataType, FieldByName(FIsSiparisteTeslimTarihiYazdir.FieldName).Value);
        FIsTeklifAyrintilariniGoster.Value := FormatedVariantVal(FieldByName(FIsTeklifAyrintilariniGoster.FieldName).DataType, FieldByName(FIsTeklifAyrintilariniGoster.FieldName).Value);
        FIsFaturaIrsaliyeNoSifirlaBaslasin.Value := FormatedVariantVal(FieldByName(FIsFaturaIrsaliyeNoSifirlaBaslasin.FieldName).DataType, FieldByName(FIsFaturaIrsaliyeNoSifirlaBaslasin.FieldName).Value);
        FIsExcelEkliIrsaliyeYazdirma.Value := FormatedVariantVal(FieldByName(FIsExcelEkliIrsaliyeYazdirma.FieldName).DataType, FieldByName(FIsExcelEkliIrsaliyeYazdirma.FieldName).Value);
        FIsAmbarTransferNumarasiOtomatikGelsin.Value := FormatedVariantVal(FieldByName(FIsAmbarTransferNumarasiOtomatikGelsin.FieldName).DataType, FieldByName(FIsAmbarTransferNumarasiOtomatikGelsin.FieldName).Value);
        FIsAmbarTransferOnayliCalissin.Value := FormatedVariantVal(FieldByName(FIsAmbarTransferOnayliCalissin.FieldName).DataType, FieldByName(FIsAmbarTransferOnayliCalissin.FieldName).Value);

        List.Add(Self.Clone());

        Next;
      end;
      Close;
    end;
  end;
end;

procedure TSysApplicationSettingsOther.Insert(out pID: Integer; pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptAddRecord, pPermissionControl) then
  begin
    with QueryOfTable do
    begin
      Close;
      SQL.Clear;
      SQL.Text := Database.GetSQLInsertCmd(TableName, QUERY_PARAM_CHAR, [
        FIsEdefterAktif.FieldName,
        FVarsayilanSatisCariKod.FieldName,
        FVarsayilanAlisCariKod.FieldName,
        FIsBolumAmbardaUretimYap.FieldName,
        FIsUretimMuhasebeKaydiOlustursun.FieldName,
        FIsStokSatimdaNegatifeDusebilir.FieldName,
        FIsMalSatisSayilariniGoster.FieldName,
        FIsPcbUretim.FieldName,
        FIsProformaNoGoster.FieldName,
        FIsSatisTakip.FieldName,
        FIsHammaddeGiriseGoreSirala.FieldName,
        FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.FieldName,
        FIsTahsilatListesiVirmanli.FieldName,
        FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.FieldName,
        FIsSiparisteTeslimTarihiYazdir.FieldName,
        FIsTeklifAyrintilariniGoster.FieldName,
        FIsFaturaIrsaliyeNoSifirlaBaslasin.FieldName,
        FIsExcelEkliIrsaliyeYazdirma.FieldName,
        FIsAmbarTransferNumarasiOtomatikGelsin.FieldName,
        FIsAmbarTransferOnayliCalissin.FieldName
      ]);

      ParamByName(FIsEdefterAktif.FieldName).Value := FormatedVariantVal(FIsEdefterAktif.FieldType, FIsEdefterAktif.Value);
      ParamByName(FVarsayilanSatisCariKod.FieldName).Value := FormatedVariantVal(FVarsayilanSatisCariKod.FieldType, FVarsayilanSatisCariKod.Value);
      ParamByName(FVarsayilanAlisCariKod.FieldName).Value := FormatedVariantVal(FVarsayilanAlisCariKod.FieldType, FVarsayilanAlisCariKod.Value);
      ParamByName(FIsBolumAmbardaUretimYap.FieldName).Value := FormatedVariantVal(FIsBolumAmbardaUretimYap.FieldType, FIsBolumAmbardaUretimYap.Value);
      ParamByName(FIsUretimMuhasebeKaydiOlustursun.FieldName).Value := FormatedVariantVal(FIsUretimMuhasebeKaydiOlustursun.FieldType, FIsUretimMuhasebeKaydiOlustursun.Value);
      ParamByName(FIsStokSatimdaNegatifeDusebilir.FieldName).Value := FormatedVariantVal(FIsStokSatimdaNegatifeDusebilir.FieldType, FIsStokSatimdaNegatifeDusebilir.Value);
      ParamByName(FIsMalSatisSayilariniGoster.FieldName).Value := FormatedVariantVal(FIsMalSatisSayilariniGoster.FieldType, FIsMalSatisSayilariniGoster.Value);
      ParamByName(FIsPcbUretim.FieldName).Value := FormatedVariantVal(FIsPcbUretim.FieldType, FIsPcbUretim.Value);
      ParamByName(FIsProformaNoGoster.FieldName).Value := FormatedVariantVal(FIsProformaNoGoster.FieldType, FIsProformaNoGoster.Value);
      ParamByName(FIsSatisTakip.FieldName).Value := FormatedVariantVal(FIsSatisTakip.FieldType, FIsSatisTakip.Value);
      ParamByName(FIsHammaddeGiriseGoreSirala.FieldName).Value := FormatedVariantVal(FIsHammaddeGiriseGoreSirala.FieldType, FIsHammaddeGiriseGoreSirala.Value);
      ParamByName(FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.FieldName).Value := FormatedVariantVal(FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.FieldType, FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.Value);
      ParamByName(FIsTahsilatListesiVirmanli.FieldName).Value := FormatedVariantVal(FIsTahsilatListesiVirmanli.FieldType, FIsTahsilatListesiVirmanli.Value);
      ParamByName(FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.FieldName).Value := FormatedVariantVal(FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.FieldType, FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.Value);
      ParamByName(FIsSiparisteTeslimTarihiYazdir.FieldName).Value := FormatedVariantVal(FIsSiparisteTeslimTarihiYazdir.FieldType, FIsSiparisteTeslimTarihiYazdir.Value);
      ParamByName(FIsTeklifAyrintilariniGoster.FieldName).Value := FormatedVariantVal(FIsTeklifAyrintilariniGoster.FieldType, FIsTeklifAyrintilariniGoster.Value);
      ParamByName(FIsFaturaIrsaliyeNoSifirlaBaslasin.FieldName).Value := FormatedVariantVal(FIsFaturaIrsaliyeNoSifirlaBaslasin.FieldType, FIsFaturaIrsaliyeNoSifirlaBaslasin.Value);
      ParamByName(FIsExcelEkliIrsaliyeYazdirma.FieldName).Value := FormatedVariantVal(FIsExcelEkliIrsaliyeYazdirma.FieldType, FIsExcelEkliIrsaliyeYazdirma.Value);
      ParamByName(FIsAmbarTransferNumarasiOtomatikGelsin.FieldName).Value := FormatedVariantVal(FIsAmbarTransferNumarasiOtomatikGelsin.FieldType, FIsAmbarTransferNumarasiOtomatikGelsin.Value);
      ParamByName(FIsAmbarTransferOnayliCalissin.FieldName).Value := FormatedVariantVal(FIsAmbarTransferOnayliCalissin.FieldType, FIsAmbarTransferOnayliCalissin.Value);

      Database.SetQueryParamsDefaultValue(QueryOfTable);

      Open;
      if (Fields.Count > 0) and (not Fields.FieldByName(Self.Id.FieldName).IsNull) then
        pID := Fields.FieldByName(Self.Id.FieldName).AsInteger
      else
        pID := 0;

      EmptyDataSet;
      Close;
    end;
    Self.notify;
  end;
end;

procedure TSysApplicationSettingsOther.Update(pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptUpdate, pPermissionControl) then
  begin
    with QueryOfTable do
    begin
      Close;
      SQL.Clear;
      SQL.Text := Database.GetSQLUpdateCmd(TableName, QUERY_PARAM_CHAR, [
        FIsEdefterAktif.FieldName,
        FVarsayilanSatisCariKod.FieldName,
        FVarsayilanAlisCariKod.FieldName,
        FIsBolumAmbardaUretimYap.FieldName,
        FIsUretimMuhasebeKaydiOlustursun.FieldName,
        FIsStokSatimdaNegatifeDusebilir.FieldName,
        FIsMalSatisSayilariniGoster.FieldName,
        FIsPcbUretim.FieldName,
        FIsProformaNoGoster.FieldName,
        FIsSatisTakip.FieldName,
        FIsHammaddeGiriseGoreSirala.FieldName,
        FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.FieldName,
        FIsTahsilatListesiVirmanli.FieldName,
        FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.FieldName,
        FIsSiparisteTeslimTarihiYazdir.FieldName,
        FIsTeklifAyrintilariniGoster.FieldName,
        FIsFaturaIrsaliyeNoSifirlaBaslasin.FieldName,
        FIsExcelEkliIrsaliyeYazdirma.FieldName,
        FIsAmbarTransferNumarasiOtomatikGelsin.FieldName,
        FIsAmbarTransferOnayliCalissin.FieldName
      ]);

      ParamByName(FIsEdefterAktif.FieldName).Value := FormatedVariantVal(FIsEdefterAktif.FieldType, FIsEdefterAktif.Value);
      ParamByName(FVarsayilanSatisCariKod.FieldName).Value := FormatedVariantVal(FVarsayilanSatisCariKod.FieldType, FVarsayilanSatisCariKod.Value);
      ParamByName(FVarsayilanAlisCariKod.FieldName).Value := FormatedVariantVal(FVarsayilanAlisCariKod.FieldType, FVarsayilanAlisCariKod.Value);
      ParamByName(FIsBolumAmbardaUretimYap.FieldName).Value := FormatedVariantVal(FIsBolumAmbardaUretimYap.FieldType, FIsBolumAmbardaUretimYap.Value);
      ParamByName(FIsUretimMuhasebeKaydiOlustursun.FieldName).Value := FormatedVariantVal(FIsUretimMuhasebeKaydiOlustursun.FieldType, FIsUretimMuhasebeKaydiOlustursun.Value);
      ParamByName(FIsStokSatimdaNegatifeDusebilir.FieldName).Value := FormatedVariantVal(FIsStokSatimdaNegatifeDusebilir.FieldType, FIsStokSatimdaNegatifeDusebilir.Value);
      ParamByName(FIsMalSatisSayilariniGoster.FieldName).Value := FormatedVariantVal(FIsMalSatisSayilariniGoster.FieldType, FIsMalSatisSayilariniGoster.Value);
      ParamByName(FIsPcbUretim.FieldName).Value := FormatedVariantVal(FIsPcbUretim.FieldType, FIsPcbUretim.Value);
      ParamByName(FIsProformaNoGoster.FieldName).Value := FormatedVariantVal(FIsProformaNoGoster.FieldType, FIsProformaNoGoster.Value);
      ParamByName(FIsSatisTakip.FieldName).Value := FormatedVariantVal(FIsSatisTakip.FieldType, FIsSatisTakip.Value);
      ParamByName(FIsHammaddeGiriseGoreSirala.FieldName).Value := FormatedVariantVal(FIsHammaddeGiriseGoreSirala.FieldType, FIsHammaddeGiriseGoreSirala.Value);
      ParamByName(FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.FieldName).Value := FormatedVariantVal(FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.FieldType, FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.Value);
      ParamByName(FIsTahsilatListesiVirmanli.FieldName).Value := FormatedVariantVal(FIsTahsilatListesiVirmanli.FieldType, FIsTahsilatListesiVirmanli.Value);
      ParamByName(FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.FieldName).Value := FormatedVariantVal(FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.FieldType, FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.Value);
      ParamByName(FIsSiparisteTeslimTarihiYazdir.FieldName).Value := FormatedVariantVal(FIsSiparisteTeslimTarihiYazdir.FieldType, FIsSiparisteTeslimTarihiYazdir.Value);
      ParamByName(FIsTeklifAyrintilariniGoster.FieldName).Value := FormatedVariantVal(FIsTeklifAyrintilariniGoster.FieldType, FIsTeklifAyrintilariniGoster.Value);
      ParamByName(FIsFaturaIrsaliyeNoSifirlaBaslasin.FieldName).Value := FormatedVariantVal(FIsFaturaIrsaliyeNoSifirlaBaslasin.FieldType, FIsFaturaIrsaliyeNoSifirlaBaslasin.Value);
      ParamByName(FIsExcelEkliIrsaliyeYazdirma.FieldName).Value := FormatedVariantVal(FIsExcelEkliIrsaliyeYazdirma.FieldType, FIsExcelEkliIrsaliyeYazdirma.Value);
      ParamByName(FIsAmbarTransferNumarasiOtomatikGelsin.FieldName).Value := FormatedVariantVal(FIsAmbarTransferNumarasiOtomatikGelsin.FieldType, FIsAmbarTransferNumarasiOtomatikGelsin.Value);
      ParamByName(FIsAmbarTransferOnayliCalissin.FieldName).Value := FormatedVariantVal(FIsAmbarTransferOnayliCalissin.FieldType, FIsAmbarTransferOnayliCalissin.Value);

      ParamByName(Self.Id.FieldName).Value := FormatedVariantVal(Self.Id.FieldType, Self.Id.Value);

      Database.SetQueryParamsDefaultValue(QueryOfTable);

      ExecSQL;
      Close;
    end;
    Self.notify;
  end;
end;

procedure TSysApplicationSettingsOther.Clear();
begin
  inherited;

  FIsEdefterAktif.Value := 0;
  FVarsayilanSatisCariKod.Value := '';
  FVarsayilanAlisCariKod.Value := '';
  FIsBolumAmbardaUretimYap.Value := 0;
  FIsUretimMuhasebeKaydiOlustursun.Value := 0;
  FIsStokSatimdaNegatifeDusebilir.Value := 0;
  FIsMalSatisSayilariniGoster.Value := 0;
  FIsPcbUretim.Value := 0;
  FIsSatisTakip.Value := 0;
  FIsHammaddeGiriseGoreSirala.Value := '';
  FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.Value := 0;
  FIsTahsilatListesiVirmanli.Value := 0;
  FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.Value := 0;
  FIsSiparisteTeslimTarihiYazdir.Value := 0;
  FIsTeklifAyrintilariniGoster.Value := 0;
  FIsFaturaIrsaliyeNoSifirlaBaslasin.Value := 0;
  FIsExcelEkliIrsaliyeYazdirma.Value := 0;
  FIsAmbarTransferNumarasiOtomatikGelsin.Value := 0;
  FIsAmbarTransferOnayliCalissin.Value := 0;
end;

function TSysApplicationSettingsOther.Clone():TTable;
begin
  Result := TSysApplicationSettingsOther.Create(Database);

  Self.Id.Clone(TSysApplicationSettingsOther(Result).Id);

  FIsEdefterAktif.Clone(TSysApplicationSettingsOther(Result).FIsEdefterAktif);
  FVarsayilanSatisCariKod.Clone(TSysApplicationSettingsOther(Result).FVarsayilanSatisCariKod);
  FVarsayilanAlisCariKod.Clone(TSysApplicationSettingsOther(Result).FVarsayilanAlisCariKod);
  FIsBolumAmbardaUretimYap.Clone(TSysApplicationSettingsOther(Result).FIsBolumAmbardaUretimYap);
  FIsUretimMuhasebeKaydiOlustursun.Clone(TSysApplicationSettingsOther(Result).FIsUretimMuhasebeKaydiOlustursun);
  FIsStokSatimdaNegatifeDusebilir.Clone(TSysApplicationSettingsOther(Result).FIsStokSatimdaNegatifeDusebilir);
  FIsMalSatisSayilariniGoster.Clone(TSysApplicationSettingsOther(Result).FIsMalSatisSayilariniGoster);
  FIsPcbUretim.Clone(TSysApplicationSettingsOther(Result).FIsPcbUretim);
  FIsProformaNoGoster.Clone(TSysApplicationSettingsOther(Result).FIsProformaNoGoster);
  FIsSatisTakip.Clone(TSysApplicationSettingsOther(Result).FIsSatisTakip);
  FIsHammaddeGiriseGoreSirala.Clone(TSysApplicationSettingsOther(Result).FIsHammaddeGiriseGoreSirala);
  FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle.Clone(TSysApplicationSettingsOther(Result).FIsUretimEntegrasyonHammaddeKullanimHesabiIscilikle);
  FIsTahsilatListesiVirmanli.Clone(TSysApplicationSettingsOther(Result).FIsTahsilatListesiVirmanli);
  FIsOrtalamaVadeSifirsaSevkiyataIzinVerme.Clone(TSysApplicationSettingsOther(Result).FIsOrtalamaVadeSifirsaSevkiyataIzinVerme);
  FIsSiparisteTeslimTarihiYazdir.Clone(TSysApplicationSettingsOther(Result).FIsSiparisteTeslimTarihiYazdir);
  FIsTeklifAyrintilariniGoster.Clone(TSysApplicationSettingsOther(Result).FIsTeklifAyrintilariniGoster);
  FIsFaturaIrsaliyeNoSifirlaBaslasin.Clone(TSysApplicationSettingsOther(Result).FIsFaturaIrsaliyeNoSifirlaBaslasin);
  FIsExcelEkliIrsaliyeYazdirma.Clone(TSysApplicationSettingsOther(Result).FIsExcelEkliIrsaliyeYazdirma);
  FIsAmbarTransferNumarasiOtomatikGelsin.Clone(TSysApplicationSettingsOther(Result).FIsAmbarTransferNumarasiOtomatikGelsin);
  FIsAmbarTransferOnayliCalissin.Clone(TSysApplicationSettingsOther(Result).FIsAmbarTransferOnayliCalissin);
end;

end.
