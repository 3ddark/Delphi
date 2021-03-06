PGDMP     ;                     w            ths_erp2018    9.5.15    9.5.15 J   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    45375    ths_erp2018    DATABASE     �   CREATE DATABASE ths_erp2018 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Turkish_Turkey.1254' LC_CTYPE = 'Turkish_Turkey.1254';
    DROP DATABASE ths_erp2018;
             postgres    false            �           0    0    DATABASE ths_erp2018    COMMENT     6   COMMENT ON DATABASE ths_erp2018 IS 'THS ERP Systems';
                  postgres    false    4242                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7            �           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO ths_admin;
                  postgres    false    7                        3079    12355    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �           1255    45376 �   add_adres(integer, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)    FUNCTION       CREATE FUNCTION public.add_adres(pulke_id integer, psehir_id integer, pilce character varying, pmahalle character varying, pcadde character varying, psokak character varying, pbina character varying, pkapi_no character varying, pposta_kutusu character varying, pposta_kodu character varying, pweb_sitesi character varying, peposta_adresi character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN

	INSERT INTO public.adres(
    ulke_id, sehir_id, ilce, mahalle, cadde, sokak, bina, kapi_no, posta_kutusu, posta_kodu, web_sitesi, eposta_adresi)
  VALUES (
    pulke_id, psehir_id, pilce, pmahalle, pcadde, psokak, pbina, pkapi_no, pposta_kutusu, pposta_kodu, pweb_sitesi, peposta_adresi)
  RETURNING id INTO _id;
  RETURN _id;
  
END;
$$;
 d  DROP FUNCTION public.add_adres(pulke_id integer, psehir_id integer, pilce character varying, pmahalle character varying, pcadde character varying, psokak character varying, pbina character varying, pkapi_no character varying, pposta_kutusu character varying, pposta_kodu character varying, pweb_sitesi character varying, peposta_adresi character varying);
       public       postgres    false    1    7            �           1255    45377 "   add_ayar_prs_askerlik_durumu(text)    FUNCTION     X  CREATE FUNCTION public.add_ayar_prs_askerlik_durumu(paskerlik_durumu text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
  BEGIN
    START TRANSACTION;
    INSERT INTO public.ayar_prs_askerlik_durumu(askerlik_durumu) VALUES (paskerlik_durumu) RETURNING id INTO _id;
    RETURN _id;
    COMMIT TRANSACTION;
  EXCEPTION WHEN others THEN
    ROLLBACK TRANSACTION;
    raise notice 'The transaction is in an uncommittable state. '
                 'Transaction was rolled back';
    raise notice 'Yo this is good! --> % %', SQLERRM, SQLSTATE;
  END;
END;
$$;
 J   DROP FUNCTION public.add_ayar_prs_askerlik_durumu(paskerlik_durumu text);
       public       postgres    false    7    1            �           1255    45378 !   add_ayar_prs_ayrilma_nedeni(text)    FUNCTION       CREATE FUNCTION public.add_ayar_prs_ayrilma_nedeni(payrilma_nedeni text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_ayrilma_nedeni(ayrilma_nedeni) VALUES (payrilma_nedeni) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 H   DROP FUNCTION public.add_ayar_prs_ayrilma_nedeni(payrilma_nedeni text);
       public       postgres    false    7    1            �           1255    45379 !   add_ayar_prs_birim(integer, text)    FUNCTION       CREATE FUNCTION public.add_ayar_prs_birim(pbolum_id integer, pbirim text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_birim(bolum_id, birim) VALUES (pbolum_id, pbirim) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 I   DROP FUNCTION public.add_ayar_prs_birim(pbolum_id integer, pbirim text);
       public       postgres    false    7    1            �           1255    45380    add_ayar_prs_bolum(text)    FUNCTION     �   CREATE FUNCTION public.add_ayar_prs_bolum(pbolum text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_bolum(bolum) VALUES (pbolum) RETURNING id INTO _id;
	RETURN _id as id;
END;
$$;
 6   DROP FUNCTION public.add_ayar_prs_bolum(pbolum text);
       public       postgres    false    7    1            �           1255    45381 $   add_ayar_prs_cinsiyet(text, boolean)    FUNCTION     !  CREATE FUNCTION public.add_ayar_prs_cinsiyet(pcinsiyet text, pis_man boolean) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_cinsiyet(cinsiyet, is_man) VALUES (pcinsiyet, pis_man) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 M   DROP FUNCTION public.add_ayar_prs_cinsiyet(pcinsiyet text, pis_man boolean);
       public       postgres    false    1    7            �           1255    45382     add_ayar_prs_egitim_durumu(text)    FUNCTION       CREATE FUNCTION public.add_ayar_prs_egitim_durumu(egitim_durumu text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_egitim_durumu(egitim_durumu) VALUES (pegitim_durumu) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 E   DROP FUNCTION public.add_ayar_prs_egitim_durumu(egitim_durumu text);
       public       postgres    false    1    7            �           1255    45383    add_ayar_prs_ehliyet_tipi(text)    FUNCTION       CREATE FUNCTION public.add_ayar_prs_ehliyet_tipi(pehliyet_tipi text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_ehliyet_tipi(ehliyet_tipi) VALUES (pehliyet_tipi) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 D   DROP FUNCTION public.add_ayar_prs_ehliyet_tipi(pehliyet_tipi text);
       public       postgres    false    7    1            �           1255    45384    add_ayar_prs_gorev(text)    FUNCTION     �   CREATE FUNCTION public.add_ayar_prs_gorev(pgorev text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_gorev(gorev) VALUES (pgorev) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 6   DROP FUNCTION public.add_ayar_prs_gorev(pgorev text);
       public       postgres    false    7    1            �           1255    45385    add_ayar_prs_izin_tipi(text)    FUNCTION       CREATE FUNCTION public.add_ayar_prs_izin_tipi(pizin_tipi text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_izin_tipi(izin_tipi) VALUES (pizin_Tipi) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 >   DROP FUNCTION public.add_ayar_prs_izin_tipi(pizin_tipi text);
       public       postgres    false    1    7            �           1255    45386 (   add_ayar_prs_medeni_durum(text, boolean)    FUNCTION     A  CREATE FUNCTION public.add_ayar_prs_medeni_durum(pmedeni_durum text, pis_married boolean) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_medeni_durum(medeni_durum, is_married) VALUES (pmedeni_durum, pis_married) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 Y   DROP FUNCTION public.add_ayar_prs_medeni_durum(pmedeni_durum text, pis_married boolean);
       public       postgres    false    1    7            �           1255    45387    add_ayar_prs_mektup_tipi(text)    FUNCTION       CREATE FUNCTION public.add_ayar_prs_mektup_tipi(pmektup_tipi text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_mektup_tipi(mektup_tipi) VALUES (pmektup_tipi) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 B   DROP FUNCTION public.add_ayar_prs_mektup_tipi(pmektup_tipi text);
       public       postgres    false    1    7            �           1255    45388    add_ayar_prs_myk_tipi(text)    FUNCTION     �   CREATE FUNCTION public.add_ayar_prs_myk_tipi(pmyk_tipi text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_myk_tipi(myk_tipi) VALUES (pmyk_tipi) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 <   DROP FUNCTION public.add_ayar_prs_myk_tipi(pmyk_tipi text);
       public       postgres    false    1    7            �           1255    45389 )   add_ayar_prs_personel_tipi(text, boolean)    FUNCTION     C  CREATE FUNCTION public.add_ayar_prs_personel_tipi(ppersonel_tipi text, pis_active boolean) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_personel_tipi(personel_tipi, is_active) VALUES (ppersonel_tipi, pis_active) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 Z   DROP FUNCTION public.add_ayar_prs_personel_tipi(ppersonel_tipi text, pis_active boolean);
       public       postgres    false    1    7            �           1255    45390    add_ayar_prs_rapor_tipi(text)    FUNCTION     	  CREATE FUNCTION public.add_ayar_prs_rapor_tipi(prapor_tipi text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_rapor_tipi(rapor_tipi) VALUES (prapor_tipi) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 @   DROP FUNCTION public.add_ayar_prs_rapor_tipi(prapor_tipi text);
       public       postgres    false    7    1            �           1255    45391    add_ayar_prs_src_tipi(text)    FUNCTION     �   CREATE FUNCTION public.add_ayar_prs_src_tipi(psrc_tipi text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_src_tipi(src_tipi) VALUES (psrc_tipi) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 <   DROP FUNCTION public.add_ayar_prs_src_tipi(psrc_tipi text);
       public       postgres    false    7    1            �           1255    45392 &   add_ayar_prs_tatil_tipi(text, boolean)    FUNCTION     B  CREATE FUNCTION public.add_ayar_prs_tatil_tipi(ptatil_tipi text, pis_resmi_tatil boolean) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_tatil_tipi(tatil_tipi, is_resmi_tatil) VALUES (ptatil_tipi, is_resmi_tatil) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 Y   DROP FUNCTION public.add_ayar_prs_tatil_tipi(ptatil_tipi text, pis_resmi_tatil boolean);
       public       postgres    false    7    1            �           1255    45393    add_ayar_prs_yabanci_dil(text)    FUNCTION       CREATE FUNCTION public.add_ayar_prs_yabanci_dil(pyabanci_dil text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_yabanci_dil(yabanci_dil) VALUES (pyabanci_dil) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 B   DROP FUNCTION public.add_ayar_prs_yabanci_dil(pyabanci_dil text);
       public       postgres    false    7    1            �           1255    45394 '   add_ayar_prs_yabanci_dil_seviyesi(text)    FUNCTION     ;  CREATE FUNCTION public.add_ayar_prs_yabanci_dil_seviyesi(pyabanci_dil_seviyesi text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	INSERT INTO public.ayar_prs_yabanci_dil_seviyesi(yabanci_dil_seviyesi) VALUES (pyabanci_dil_seviyesi) RETURNING id INTO _id;
	RETURN _id;
END;
$$;
 T   DROP FUNCTION public.add_ayar_prs_yabanci_dil_seviyesi(pyabanci_dil_seviyesi text);
       public       postgres    false    7    1            �           1255    45395 �  add_personel_karti(boolean, character varying, character varying, character varying, character varying, integer, integer, integer, integer, character varying, date, character varying, integer, integer, integer, integer, character varying, character varying, integer, character varying, character varying, integer, integer, character varying, double precision, integer, double precision, text, integer)    FUNCTION     /  CREATE FUNCTION public.add_personel_karti(pis_active boolean, ppersonel_ad character varying, ppersonel_soyad character varying, ptelefon1 character varying, ptelefon2 character varying, ppersonel_tipi_id integer, pbolum_id integer, pbirim_id integer, pgorev_id integer, pmail_adresi character varying, pdogum_tarihi date, pkan_grubu character varying, pcinsiyet_id integer, paskerlik_durum_id integer, pmedeni_durum_id integer, pcocuk_sayisi integer, pyakin_ad_soyad character varying, pyakin_telefon character varying, payakkabi_no integer, pelbise_bedeni character varying, pgenel_not character varying, pservis_id integer, ppersonel_gecmisi_id integer, pozel_not character varying, pbrut_maas double precision, pikramiye_sayisi integer, pikramiye_miktar double precision, ptc_kimlik_no text, padres_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN

	INSERT INTO public.personel_karti(
    is_active, personel_ad, personel_soyad, telefon1, telefon2, personel_tipi_id, bolum_id, birim_id, gorev_id, mail_adresi, dogum_tarihi, kan_grubu, cinsiyet_id, 
    askerlik_durum_id, medeni_durum_id, cocuk_sayisi, yakin_ad_soyad, yakin_telefon, ayakkabi_no, elbise_bedeni, genel_not, servis_id, personel_gecmisi_id, 
    ozel_not, brut_maas, ikramiye_sayisi, ikramiye_miktar, tc_kimlik_no, adres_id)
  VALUES (
    pis_active, ppersonel_ad, ppersonel_soyad, ptelefon1, ptelefon2, ppersonel_tipi_id, pbolum_id, pbirim_id, pgorev_id, pmail_adresi, pdogum_tarihi, pkan_grubu, pcinsiyet_id, 
    paskerlik_durum_id, pmedeni_durum_id, pcocuk_sayisi, pyakin_ad_soyad, pyakin_telefon, payakkabi_no, pelbise_bedeni, pgenel_not, pservis_id, ppersonel_gecmisi_id, 
    pozel_not, pbrut_maas, pikramiye_sayisi, pikramiye_miktar, ptc_kimlik_no, padres_id)
  RETURNING id INTO _id;
  RETURN _id;
END;
$$;
 .  DROP FUNCTION public.add_personel_karti(pis_active boolean, ppersonel_ad character varying, ppersonel_soyad character varying, ptelefon1 character varying, ptelefon2 character varying, ppersonel_tipi_id integer, pbolum_id integer, pbirim_id integer, pgorev_id integer, pmail_adresi character varying, pdogum_tarihi date, pkan_grubu character varying, pcinsiyet_id integer, paskerlik_durum_id integer, pmedeni_durum_id integer, pcocuk_sayisi integer, pyakin_ad_soyad character varying, pyakin_telefon character varying, payakkabi_no integer, pelbise_bedeni character varying, pgenel_not character varying, pservis_id integer, ppersonel_gecmisi_id integer, pozel_not character varying, pbrut_maas double precision, pikramiye_sayisi integer, pikramiye_miktar double precision, ptc_kimlik_no text, padres_id integer);
       public       postgres    false    7    1            �           1255    45396 �  add_satis_teklif(integer, integer, integer, boolean, boolean, boolean, double precision, double precision, double precision, double precision, double precision, double precision, double precision, integer, character varying, date, date, date, character varying, character varying, character varying, character varying, character varying, integer, integer, character varying, character varying, character varying, character varying, character varying, integer, date, integer, character varying, character varying, double precision, double precision, integer, integer, integer, character varying, integer, character varying, integer, integer, date, date, character varying, character varying, integer, integer, character varying)    FUNCTION     )  CREATE FUNCTION public.add_satis_teklif(psiparis_id integer, pirsaliye_id integer, pfatura_id integer, pis_siparislesti boolean, pis_taslak boolean, pis_efatura boolean, ptutar double precision, piskonto_tutar double precision, piskonto_ara_toplam double precision, pgenel_iskonto_tutar double precision, para_toplam double precision, pkdv_tutar double precision, pgenel_toplam double precision, pislem_tipi_id integer, pteklif_no character varying, pteklif_tarihi date, pteslim_tarihi date, pgecerlilik_tarihi date, pmusteri_kodu character varying, pmusteri_adi character varying, pposta_kodu character varying, pvergi_dairesi character varying, pvergi_no character varying, pmusteri_temsilcisi_id integer, pteklif_tipi_id integer, pmuhattap_ad character varying, pmuhattap_soyad character varying, podeme_vadesi character varying, preferans character varying, pteslimat_suresi character varying, pteklif_durum_id integer, psevk_tarihi date, pvade_gun_sayisi integer, pfatura_sevk_tarihi character varying, ppara_birimi character varying, pdolar_kur double precision, peuro_kur double precision, podeme_baslangic_donemi_id integer, pteslim_sarti_id integer, pgonderim_sekli_id integer, pgonderim_sekli_detay character varying, podeme_sekli_id integer, paciklama character varying, pproforma_no integer, parayan_kisi_id integer, parama_tarihi date, psonraki_aksiyon_tarihi date, paksiyon_notu character varying, ptevkifat_kodu character varying, ptevkifat_pay integer, ptevkifat_payda integer, pihrac_kayit_kodu character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN

	INSERT INTO public.satis_teklif(
    siparis_id, irsaliye_id, fatura_id, is_siparislesti, is_taslak, is_efatura, tutar, iskonto_tutar, iskonto_ara_toplam, genel_iskonto_tutar, ara_toplam, kdv_tutar, 
    genel_toplam, islem_tipi_id, teklif_no, teklif_tarihi, teslim_tarihi, gecerlilik_tarihi, musteri_kodu, musteri_adi, posta_kodu, vergi_dairesi, vergi_no, musteri_temsilcisi_id, 
    teklif_tipi_id, muhattap_ad, muhattap_soyad, odeme_vadesi, referans, teslimat_suresi, teklif_durum_id, sevk_tarihi, vade_gun_sayisi, fatura_sevk_tarihi, para_birimi, 
    dolar_kur, euro_kur, odeme_baslangic_donemi_id, teslim_sarti_id, gonderim_sekli_id, gonderim_sekli_detay, odeme_sekli_id, aciklama, proforma_no, arayan_kisi_id, 
    arama_tarihi, sonraki_aksiyon_tarihi, aksiyon_notu, tevkifat_kodu, tevkifat_pay, tevkifat_payda, ihrac_kayit_kodu)
  VALUES (
    psiparis_id, pirsaliye_id, pfatura_id, pis_siparislesti, pis_taslak, pis_efatura, ptutar, piskonto_tutar, piskonto_ara_toplam, pgenel_iskonto_tutar, para_toplam, pkdv_tutar, 
    pgenel_toplam, pislem_tipi_id, pteklif_no, pteklif_tarihi, pteslim_tarihi, pgecerlilik_tarihi, pmusteri_kodu, pmusteri_adi, pposta_kodu, pvergi_dairesi, pvergi_no, pmusteri_temsilcisi_id, 
    pteklif_tipi_id, pmuhattap_ad, pmuhattap_soyad, podeme_vadesi, preferans, pteslimat_suresi, pteklif_durum_id, psevk_tarihi, pvade_gun_sayisi, pfatura_sevk_tarihi, ppara_birimi, 
    pdolar_kur, peuro_kur, podeme_baslangic_donemi_id, pteslim_sarti_id, pgonderim_sekli_id, pgonderim_sekli_detay, podeme_sekli_id, paciklama, pproforma_no, parayan_kisi_id, 
    parama_tarihi, psonraki_aksiyon_tarihi, paksiyon_notu, ptevkifat_kodu, ptevkifat_pay, ptevkifat_payda, pihrac_kayit_kodu)
  RETURNING id INTO _id;
  
END;
$$;
 �  DROP FUNCTION public.add_satis_teklif(psiparis_id integer, pirsaliye_id integer, pfatura_id integer, pis_siparislesti boolean, pis_taslak boolean, pis_efatura boolean, ptutar double precision, piskonto_tutar double precision, piskonto_ara_toplam double precision, pgenel_iskonto_tutar double precision, para_toplam double precision, pkdv_tutar double precision, pgenel_toplam double precision, pislem_tipi_id integer, pteklif_no character varying, pteklif_tarihi date, pteslim_tarihi date, pgecerlilik_tarihi date, pmusteri_kodu character varying, pmusteri_adi character varying, pposta_kodu character varying, pvergi_dairesi character varying, pvergi_no character varying, pmusteri_temsilcisi_id integer, pteklif_tipi_id integer, pmuhattap_ad character varying, pmuhattap_soyad character varying, podeme_vadesi character varying, preferans character varying, pteslimat_suresi character varying, pteklif_durum_id integer, psevk_tarihi date, pvade_gun_sayisi integer, pfatura_sevk_tarihi character varying, ppara_birimi character varying, pdolar_kur double precision, peuro_kur double precision, podeme_baslangic_donemi_id integer, pteslim_sarti_id integer, pgonderim_sekli_id integer, pgonderim_sekli_detay character varying, podeme_sekli_id integer, paciklama character varying, pproforma_no integer, parayan_kisi_id integer, parama_tarihi date, psonraki_aksiyon_tarihi date, paksiyon_notu character varying, ptevkifat_kodu character varying, ptevkifat_pay integer, ptevkifat_payda integer, pihrac_kayit_kodu character varying);
       public       postgres    false    7    1            �           1255    45397 �  add_satis_teklif_detay(integer, integer, integer, integer, character varying, character varying, character varying, character varying, double precision, character varying, double precision, integer, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, boolean, integer, integer, character varying, character varying, character varying, character varying, character varying, bigint)    FUNCTION     �  CREATE FUNCTION public.add_satis_teklif_detay(pheader_id integer, psiparis_detay_id integer, pirsaliye_detay_id integer, pfatura_detay_id integer, pstok_kodu character varying, pstok_aciklama character varying, paciklama character varying, preferans character varying, pmiktar double precision, polcu_birimi character varying, piskonto_orani double precision, pkdv_orani integer, pfiyat double precision, pnet_fiyat double precision, ptutar double precision, piskonto_tutar double precision, pnet_tutar double precision, pkdv_tutar double precision, ptoplam_tutar double precision, pvade_gun double precision, pis_ana_urun boolean, pana_urun_id integer, preferans_ana_urun_id integer, ptransfer_hesap_kodu character varying, pkdv_transfer_hesap_kodu character varying, pvergi_kodu character varying, pvergi_muafiyet_kodu character varying, pdiger_vergi_kodu character varying, pgtip_no bigint) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN

	INSERT INTO public.satis_teklif_detay(
    header_id, siparis_detay_id, irsaliye_detay_id, fatura_detay_id, stok_kodu, stok_aciklama, aciklama, referans, miktar, olcu_birimi, iskonto_orani, kdv_orani, 
    fiyat, net_fiyat, tutar, iskonto_tutar, net_tutar, kdv_tutar, toplam_tutar, vade_gun, is_ana_urun, ana_urun_id, referans_ana_urun_id, transfer_hesap_kodu, 
    kdv_transfer_hesap_kodu, vergi_kodu, vergi_muafiyet_kodu, diger_vergi_kodu, gtip_no)
  VALUES (
    pheader_id, psiparis_detay_id, pirsaliye_detay_id, pfatura_detay_id, pstok_kodu, pstok_aciklama, paciklama, preferans, pmiktar, polcu_birimi, piskonto_orani, pkdv_orani, 
    pfiyat, pnet_fiyat, ptutar, piskonto_tutar, pnet_tutar, pkdv_tutar, ptoplam_tutar, pvade_gun, pis_ana_urun, pana_urun_id, preferans_ana_urun_id, ptransfer_hesap_kodu, 
    pkdv_transfer_hesap_kodu, pvergi_kodu, pvergi_muafiyet_kodu, pdiger_vergi_kodu, pgtip_no)
  RETURNING id INTO _id;
  
END;
$$;
 }  DROP FUNCTION public.add_satis_teklif_detay(pheader_id integer, psiparis_detay_id integer, pirsaliye_detay_id integer, pfatura_detay_id integer, pstok_kodu character varying, pstok_aciklama character varying, paciklama character varying, preferans character varying, pmiktar double precision, polcu_birimi character varying, piskonto_orani double precision, pkdv_orani integer, pfiyat double precision, pnet_fiyat double precision, ptutar double precision, piskonto_tutar double precision, pnet_tutar double precision, pkdv_tutar double precision, ptoplam_tutar double precision, pvade_gun double precision, pis_ana_urun boolean, pana_urun_id integer, preferans_ana_urun_id integer, ptransfer_hesap_kodu character varying, pkdv_transfer_hesap_kodu character varying, pvergi_kodu character varying, pvergi_muafiyet_kodu character varying, pdiger_vergi_kodu character varying, pgtip_no bigint);
       public       postgres    false    7    1            �           1255    45398    audit()    FUNCTION     _  CREATE FUNCTION public.audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $_$
declare
_username varchar;
_ip varchar;
_database varchar;
_sql text;
_old_val text[];
_test text;
_tarih timestamp without time zone;
BEGIN

	IF (TG_OP = 'INSERT') OR (TG_OP = 'DELETE') OR ((TG_OP = 'UPDATE') AND (ARRAY[OLD] <> ARRAY[NEW])) THEN

		_username 	:= (upper(session_user)); 
		_ip 		:= (inet_client_addr());
		_database	:= (SELECT current_database());
		_tarih		:= (SELECT NOW());

		IF (TG_OP = 'INSERT') THEN
			_old_val	:= (SELECT array[NEW]);
		ELSE
			_old_val	:= (SELECT array[OLD]);
		END IF;

		_test		:= (SELECT array_to_string(_old_val, ', '));

--		raise exception 'Mesaj =%', _test;

		_test := replace(_test, ',,', ', null,');
		_test := replace(_test, ',,', ', null,');
		_test := replace(_test, ',,', ', null,');
		_test := replace(_test, ',,', ', null,');
		_test := replace(_test, ',,', ', null,');
		_test := replace(_test, ',,', ', null,');
		_test := replace(_test, ',,', ', null,');
		_test := replace(_test, '"', '''');
		_test := replace(_test, '(', '''');
		_test := replace(_test, ')', '''');
		_test := replace(_test, ',', ''', ''');
		_test := replace(_test, '''''', '''');
		_test := replace(_test, ''' null''', ' null');

		--raise exception 'Mesaj =%', _test;

		_sql		:= (SELECT format('INSERT INTO %I.%I VALUES (%L, %L, %L, %L, %s)', _database, TG_TABLE_NAME, _username, _ip, _tarih, TG_OP, _test));

		--raise exception 'Mesaj =%', _sql;

		PERFORM dblink(
			'host=localhost user=ths_admin password=THSERP dbname=ths_erp_log port=5432', 
			' ' || _sql || ';'
		);

	END IF;

	RETURN NULL;
/*
	EXECUTE format('INSERT INTO %I.%I VALUES ($1.*)', (SELECT current_database()), TG_TABLE_NAME, _username, _ip)
	USING OLD;
	RETURN OLD;

	RETURN null;
	IF OLD IS NOT DISTINCT FROM NEW THEN
*/

END
$_$;
    DROP FUNCTION public.audit();
       public       postgres    false    1    7            �           1255    45399    audit_old()    FUNCTION     �  CREATE FUNCTION public.audit_old() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$DECLARE
	_username varchar;
	_ip varchar;
	_table_name varchar;
	_orj_table_name varchar;
	_row_id integer;
	_access_type varchar;
	_time_of_change timestamp without time zone;
	_db_name varchar;
	_old_data text;
    BEGIN
	_username 		:= (upper(session_user)); 
	_ip 			:= (inet_client_addr());
	_table_name 		:= (upper(TG_TABLE_NAME)); 
	_orj_table_name		:= (TG_TABLE_NAME);
	_time_of_change 	:= (now());
	_db_name 		:= (current_database());
	_old_data		:= '';

	IF (TG_OP = 'INSERT') THEN
		_access_type 	:= (TG_OP);
		_row_id 	:= (NEW.id);
        END IF;

        IF (TG_OP = 'UPDATE') THEN
	    IF (OLD.validity = TRUE  AND  NEW.validity = FALSE) THEN
		_access_type 	:= quote_literal('VIRTUAL_DELETE');
		_row_id 	:= quote_literal(OLD.id);
	    ELSE
		_access_type 	:= (TG_OP);
		_row_id 	:= (OLD.id);
		--_old_data	:= (SELECT * FROM _orj_table_name);
	    END IF;
	END IF;

	IF (TG_OP = 'DELETE') THEN
            _access_type	:= (TG_OP);
            _row_id 		:= (OLD.id);
        END IF;


	PERFORM dblink('host=localhost user=postgres password=123 dbname=ths_erp2017_log port=5432', 
	'INSERT INTO audit(username, ip, table_name, access_type, time_of_change, row_id, db_name, old_data) ' || 
	'VALUES(' || 
		(quote_literal(_username)) || ',' || 
		(quote_literal(_ip)) || ',' ||  
		(quote_literal(upper(_table_name))) || ',' || 
		(quote_literal(_access_type)) || ',' || 
		(quote_literal(_time_of_change)) || ',' ||
		(quote_literal(_row_id)) || ',' || 
		(quote_literal(_db_name)) || ',' ||
		(quote_literal(_old_data)) || ');');
	    
        RETURN NULL;
    END;
$$;
 "   DROP FUNCTION public.audit_old();
       public       postgres    false    1    7            �           1255    45400 %   del_ayar_prs_askerlik_durumu(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_askerlik_durumu(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_askerlik_durumu WHERE id = pID;
END;
$$;
 @   DROP FUNCTION public.del_ayar_prs_askerlik_durumu(pid integer);
       public       postgres    false    1    7            �           1255    45401 $   del_ayar_prs_ayrilma_nedeni(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_ayrilma_nedeni(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_ayrilma_nedeni WHERE id = pID;
END;
$$;
 ?   DROP FUNCTION public.del_ayar_prs_ayrilma_nedeni(pid integer);
       public       postgres    false    1    7            �           1255    45402    del_ayar_prs_birim(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_birim(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_birim WHERE id = pID;
END;
$$;
 6   DROP FUNCTION public.del_ayar_prs_birim(pid integer);
       public       postgres    false    1    7            �           1255    45403    del_ayar_prs_bolum(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_bolum(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_bolum WHERE id = pID;
  RETURN;
END;
$$;
 6   DROP FUNCTION public.del_ayar_prs_bolum(pid integer);
       public       postgres    false    1    7            �           0    0 (   FUNCTION del_ayar_prs_bolum(pid integer)    COMMENT     h   COMMENT ON FUNCTION public.del_ayar_prs_bolum(pid integer) IS 'sp delete personel tanımları bölüm';
            public       postgres    false    490            �           1255    45404    del_ayar_prs_cinsiyet(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_cinsiyet(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_cinsiyet WHERE id = pID;
END;
$$;
 9   DROP FUNCTION public.del_ayar_prs_cinsiyet(pid integer);
       public       postgres    false    1    7            �           1255    45405 #   del_ayar_prs_egitim_durumu(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_egitim_durumu(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_egitim_durumu WHERE id = pID;
END;
$$;
 >   DROP FUNCTION public.del_ayar_prs_egitim_durumu(pid integer);
       public       postgres    false    1    7            �           1255    45406 "   del_ayar_prs_ehliyet_tipi(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_ehliyet_tipi(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_ehliyet_tipi WHERE id = pID;
END;
$$;
 =   DROP FUNCTION public.del_ayar_prs_ehliyet_tipi(pid integer);
       public       postgres    false    1    7            �           1255    45407    del_ayar_prs_gorev(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_gorev(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_gorev WHERE id = pID;
END;
$$;
 6   DROP FUNCTION public.del_ayar_prs_gorev(pid integer);
       public       postgres    false    7    1            �           1255    45408    del_ayar_prs_izin_tipi(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_izin_tipi(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_izin_tipi WHERE id = pID;
END;
$$;
 :   DROP FUNCTION public.del_ayar_prs_izin_tipi(pid integer);
       public       postgres    false    7    1            �           1255    45409 "   del_ayar_prs_medeni_durum(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_medeni_durum(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_medeni_durum WHERE id = pID;
END;
$$;
 =   DROP FUNCTION public.del_ayar_prs_medeni_durum(pid integer);
       public       postgres    false    7    1            �           1255    45410 !   del_ayar_prs_mektup_tipi(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_mektup_tipi(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_mektup_tipi WHERE id = pID;
END;
$$;
 <   DROP FUNCTION public.del_ayar_prs_mektup_tipi(pid integer);
       public       postgres    false    1    7            �           1255    45411    del_ayar_prs_myk_tipi(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_myk_tipi(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_myk_tipi WHERE id = pID;
END;
$$;
 9   DROP FUNCTION public.del_ayar_prs_myk_tipi(pid integer);
       public       postgres    false    7    1            �           1255    45412 #   del_ayar_prs_personel_tipi(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_personel_tipi(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_personel_tipi WHERE id = pID;
END;
$$;
 >   DROP FUNCTION public.del_ayar_prs_personel_tipi(pid integer);
       public       postgres    false    7    1            �           1255    45413     del_ayar_prs_rapor_tipi(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_rapor_tipi(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_rapor_tipi WHERE id = pID;
END;
$$;
 ;   DROP FUNCTION public.del_ayar_prs_rapor_tipi(pid integer);
       public       postgres    false    1    7            �           1255    45414    del_ayar_prs_src_tipi(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_src_tipi(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_src_tipi WHERE id = pID;
END;
$$;
 9   DROP FUNCTION public.del_ayar_prs_src_tipi(pid integer);
       public       postgres    false    7    1            �           1255    45415 !   del_ayar_prs_yabanci_dil(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_yabanci_dil(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_yabanci_dil WHERE id = pID;
END;
$$;
 <   DROP FUNCTION public.del_ayar_prs_yabanci_dil(pid integer);
       public       postgres    false    7    1            �           1255    45416 *   del_ayar_prs_yabanci_dil_seviyesi(integer)    FUNCTION     �   CREATE FUNCTION public.del_ayar_prs_yabanci_dil_seviyesi(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.ayar_prs_yabanci_dil_seviyesi WHERE id = pID;
END;
$$;
 E   DROP FUNCTION public.del_ayar_prs_yabanci_dil_seviyesi(pid integer);
       public       postgres    false    1    7            �           1255    45417    del_personel_karti(integer)    FUNCTION     �   CREATE FUNCTION public.del_personel_karti(pid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM public.personel_karti WHERE id = pID;
END;
$$;
 6   DROP FUNCTION public.del_personel_karti(pid integer);
       public       postgres    false    7    1            �           1255    45418    delete_table_lang_content()    FUNCTION     ]  CREATE FUNCTION public.delete_table_lang_content() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$DECLARE
    BEGIN
    
	IF (TG_OP = 'DELETE') THEN
            DELETE FROM sys_lang_data_content WHERE table_name=initcap(replace(TG_TABLE_NAME, '_', ' ')) AND row_id=OLD.id;
        END IF;

        RETURN NULL;
    END;
$$;
 2   DROP FUNCTION public.delete_table_lang_content();
       public       postgres    false    7    1                        1255    45419    get_default_para_birimi()    FUNCTION     �   CREATE FUNCTION public.get_default_para_birimi() RETURNS character varying
    LANGUAGE sql
    AS $$SELECT kod FROM public.para_birimi WHERE is_varsayilan limit 1$$;
 0   DROP FUNCTION public.get_default_para_birimi();
       public       postgres    false    7                       1255    45420    get_default_para_birimi_id()    FUNCTION     �   CREATE FUNCTION public.get_default_para_birimi_id() RETURNS integer
    LANGUAGE sql
    AS $$SELECT id FROM public.para_birimi WHERE is_varsayilan limit 1$$;
 3   DROP FUNCTION public.get_default_para_birimi_id();
       public       postgres    false    7                       1255    47394    get_default_stok_tipi()    FUNCTION     �   CREATE FUNCTION public.get_default_stok_tipi() RETURNS integer
    LANGUAGE sql
    AS $$SELECT id FROM ayar_stk_stok_tipi WHERE is_default=true$$;
 .   DROP FUNCTION public.get_default_stok_tipi();
       public       postgres    false    7            �           0    0     FUNCTION get_default_stok_tipi()    ACL     �   REVOKE ALL ON FUNCTION public.get_default_stok_tipi() FROM PUBLIC;
REVOKE ALL ON FUNCTION public.get_default_stok_tipi() FROM postgres;
            public       postgres    false    542                       1255    45422 .   get_lang_text(text, text, text, integer, text)    FUNCTION     �  CREATE FUNCTION public.get_lang_text(_default_value text, _table_name text, _column_name text, _row_id integer, _lang text) RETURNS character varying
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$declare
	dmp text;
	--_default_val text;
begin
--  _default_val := exec(concat('SELECT raw', _table_name, '.', pRawTableColName, ' FROM ', _table_name, ' as raw', _table_name ' WHERE raw', _table_name, '.id=', pDataTableName, '.', pDataColName));

	SELECT INTO dmp val FROM sys_lang_data_content 
	WHERE	1=1
		AND row_id = _row_id
		AND lang = _lang
		AND column_name = _column_name
		AND table_name = _table_name
	LIMIT 1;
  
	IF (dmp is null) OR (dmp = '') THEN
		return _default_value;
	ELSE
		return dmp;
	END IF;

end
$$;
 {   DROP FUNCTION public.get_lang_text(_default_value text, _table_name text, _column_name text, _row_id integer, _lang text);
       public       postgres    false    7    1                       1255    45423 +   get_lang_text(text, text, text, text, text)    FUNCTION     �  CREATE FUNCTION public.get_lang_text(_default_value text, _table_name text, _column_name text, _data_col text, _lang text) RETURNS character varying
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$declare
	--dmp text;
	--_default_val text;
begin
--  _default_val := exec(concat('SELECT raw', _table_name, '.', pRawTableColName, ' FROM ', _table_name, ' as raw', _table_name ' WHERE raw', _table_name, '.id=', pDataTableName, '.', pDataColName));
/*
	SELECT INTO dmp val FROM sys_lang_data_content 
	WHERE	1=1
		AND row_id = _row_id
		AND lang = _lang
		AND column_name = _column_name
		AND table_name = _table_name
	LIMIT 1;
  
	IF (dmp is null) OR (dmp = '') THEN*/
		return _default_value;
/*	ELSE
		return dmp;
	END IF;
*/
end
$$;
 z   DROP FUNCTION public.get_lang_text(_default_value text, _table_name text, _column_name text, _data_col text, _lang text);
       public       postgres    false    1    7                       1255    45424    get_sys_lang_id(text)    FUNCTION     �   CREATE FUNCTION public.get_sys_lang_id(planguage text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
 _id Integer;
BEGIN
	SELECT INTO _id id FROM sys_lang WHERE language=planguage;
	RETURN _id;
END;
$$;
 6   DROP FUNCTION public.get_sys_lang_id(planguage text);
       public       postgres    false    1    7                       1255    45425    login(text, text, text, text)    FUNCTION     �  CREATE FUNCTION public.login(kullanici_adi text, pwd text, surum text, mac_adres text) RETURNS integer
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$declare 
	id integer;
	kullanici record;
begin
	select into kullanici * from kullanicilar where kullanicilar.kullanici_adi = $1;
	IF NOT FOUND THEN
		return -1;
		--RAISE EXCEPTION 'kullanici % bulunamadi', $1;
	ELSE
		IF kullanici.is_active = false THEN
			return -2;
			--RAISE EXCEPTION 'kullanici % aktif değil', $1;
		ELSE
			select into kullanici * from kullanicilar where kullanicilar.kullanici_adi = $1 and kullanicilar.surum = crypt($3, kullanicilar.surum);
			IF NOT FOUND THEN
				return -6;
			--geçersiz sürüm
			ELSE
			--IF kullanici.cevrim_ici = false THEN
				select into kullanici * from kullanicilar where kullanicilar.kullanici_adi = $1 and kullanicilar.ip = text(inet_client_addr());
				IF NOT FOUND THEN
					return -3;
					--RAISE EXCEPTION 'ip % hatalı!', text(inet_client_addr());
				ELSE
					select into kullanici * from kullanicilar where kullanicilar.kullanici_adi = $1 and kullanicilar.mac_address = $4;
					IF NOT FOUND THEN
						return -7;
						--geçersiz mac_adresi;
					ELSE				
					
						select into kullanici * from kullanicilar where kullanicilar.kullanici_adi = $1 and kullanicilar.pwd = crypt($2, kullanicilar.pwd);
						IF NOT FOUND THEN
							--RAISE EXCEPTION 'şifre hatalı!';
							select into kullanici * from kullanicilar where kullanicilar.kullanici_adi = $1;
							IF kullanici.login_deneme_sayisi = 3 THEN
									UPDATE kullanicilar SET is_active=false WHERE kullanicilar.kullanici_adi = $1;
									return -8;
							END IF;
							select into kullanici * from kullanicilar where kullanicilar.kullanici_adi = $1;
							UPDATE kullanicilar SET login_deneme_sayisi=(kullanici.login_deneme_sayisi +1) WHERE kullanicilar.kullanici_adi = $1;
							return -4;
						ELSE
							UPDATE kullanicilar SET cevrim_ici=true, login_deneme_sayisi = 0 WHERE kullanicilar.id = kullanici.id;	
							return kullanici.id;
						END IF;
					END IF;
				END IF;
			--ELSE
			--	return -5;
				--RAISE EXCEPTION 'kullanici % zaten çevrim içi!', $1;
			--END IF;
			END IF;
		END IF;

	END IF;
	--return 0;
end
$_$;
 V   DROP FUNCTION public.login(kullanici_adi text, pwd text, surum text, mac_adres text);
       public       postgres    false    1    7            �           0    0 H   FUNCTION login(kullanici_adi text, pwd text, surum text, mac_adres text)    ACL     �   REVOKE ALL ON FUNCTION public.login(kullanici_adi text, pwd text, surum text, mac_adres text) FROM PUBLIC;
REVOKE ALL ON FUNCTION public.login(kullanici_adi text, pwd text, surum text, mac_adres text) FROM postgres;
            public       postgres    false    538                       1255    45426    mal_ortalama_maliyet_2()    FUNCTION     �	  CREATE FUNCTION public.mal_ortalama_maliyet_2() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$DECLARE
    stok_hareketi RECORD;
    stok_hareketi_donem_basi RECORD;
    _miktar float;
    _ortalama_maliyet numeric;
    _stok_kodu character varying;
    _bHesapla boolean;
    ondalikli_hane RECORD;
BEGIN
	_miktar := 0;
	_ortalama_maliyet := 0;
	_bHesapla := true;

	IF (TG_OP = 'INSERT') OR (TG_OP = 'UPDATE') THEN
		_stok_kodu := NEW.stok_kodu;
	ELSIF (TG_OP = 'DELETE') THEN
		_stok_kodu := OLD.stok_kodu;
	END IF;

	IF _bHesapla = true THEN
		--her ambarın ayrıdönem başı hareketi var(fiyat aynıdır, miktarlar toplanır)
		FOR stok_hareketi_donem_basi IN SELECT miktar, tutar FROM stok_hareketi WHERE stok_kodu=_stok_kodu AND stok_hareketi.is_donem_basi_hareket = true AND stok_hareketi.miktar > 0 
		LOOP
			_miktar := _miktar + stok_hareketi_donem_basi.miktar;
			_ortalama_maliyet := stok_hareketi_donem_basi.tutar;
		END LOOP;
	

		FOR stok_hareketi IN SELECT giris_cikis, miktar, tutar FROM stok_hareketi WHERE stok_kodu= _stok_kodu AND stok_hareketi.is_donem_basi_hareket = FALSE AND stok_hareketi.miktar <> 0 ORDER BY tarih, id
		LOOP
			IF (mal_hareketi.giris_cikis_tip_id = 1)  THEN	--giriş
				IF _miktar > 0 THEN
					IF _miktar + stok_hareketi.miktar <= 0 THEN
						_ortalama_maliyet := 0;	
					ELSIF _miktar + stok_hareketi.miktar > 0 THEN
						_ortalama_maliyet := (_miktar * _ortalama_maliyet + mal_hareketi.miktar * mal_hareketi.tl_fiyat) / ( _miktar + mal_hareketi.miktar );
					END IF;
				ELSIF _miktar <= 0 THEN
					IF _miktar + mal_hareketi.miktar <= 0 THEN
						_ortalama_maliyet := 0;
					ELSIF (_miktar + mal_hareketi.miktar) > 0 THEN
						_ortalama_maliyet := mal_hareketi.tl_fiyat;
					END IF;
				END IF;
			END IF;	
			--miktar çıkışta negatif girişte pozitif o yüzden sadece topla
			_miktar := _miktar + mal_hareketi.miktar;
		END LOOP;
		
		SELECT mallar_fiyat, alim_fiyat, satim_fiyat into ondalikli_hane FROM ondalikli_haneler;
		 
		_ortalama_maliyet := round(_ortalama_maliyet, greatest(ondalikli_hane.mallar_fiyat, ondalikli_hane.alim_fiyat, ondalikli_hane.satim_fiyat));

		UPDATE mallar SET ortalama_maliyet=_ortalama_maliyet WHERE mal_kodu = _mal_kodu;
		
	END IF;
	
	IF (TG_OP = 'INSERT') OR (TG_OP = 'UPDATE') THEN
		RETURN NEW;
	ELSIF (TG_OP = 'DELETE') THEN
		RETURN OLD;
	END IF;
END$$;
 /   DROP FUNCTION public.mal_ortalama_maliyet_2();
       public       postgres    false    7    1            �           0    0 !   FUNCTION mal_ortalama_maliyet_2()    COMMENT     �   COMMENT ON FUNCTION public.mal_ortalama_maliyet_2() IS 'mal_hareketleri tablosunda 
after insert, update, delete 
işlemden sonra malın tüm hareketlerinden ortalama maliyet hesaplar
şu an kullanılan trigger';
            public       postgres    false    539            �           0    0 !   FUNCTION mal_ortalama_maliyet_2()    ACL     �   REVOKE ALL ON FUNCTION public.mal_ortalama_maliyet_2() FROM PUBLIC;
REVOKE ALL ON FUNCTION public.mal_ortalama_maliyet_2() FROM postgres;
GRANT ALL ON FUNCTION public.mal_ortalama_maliyet_2() TO postgres;
            public       postgres    false    539                       1255    45427    personel_adsoyad()    FUNCTION     ]  CREATE FUNCTION public.personel_adsoyad() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$DECLARE
    BEGIN
	IF (TG_OP = 'UPDATE') OR (TG_OP = 'INSERT') THEN
		UPDATE personel_karti SET 
			personel_ad_soyad=personel_ad || ' ' || personel_soyad
		WHERE personel_karti.id=NEW.id;
	END IF;
	
        RETURN NULL;
    END;
$$;
 )   DROP FUNCTION public.personel_adsoyad();
       public       postgres    false    1    7            �           0    0    FUNCTION personel_adsoyad()    ACL     �   REVOKE ALL ON FUNCTION public.personel_adsoyad() FROM PUBLIC;
REVOKE ALL ON FUNCTION public.personel_adsoyad() FROM postgres;
GRANT ALL ON FUNCTION public.personel_adsoyad() TO postgres;
GRANT ALL ON FUNCTION public.personel_adsoyad() TO PUBLIC;
            public       postgres    false    540                       1255    45428 +   set_ayar_prs_askerlik_durumu(integer, text)    FUNCTION     �   CREATE FUNCTION public.set_ayar_prs_askerlik_durumu(pid integer, paskerlikdurumu text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_askerlik_durumu SET askerlik_durumu=pAskerlikDurumu WHERE id=pID;
	RETURN;
END;
$$;
 V   DROP FUNCTION public.set_ayar_prs_askerlik_durumu(pid integer, paskerlikdurumu text);
       public       postgres    false    1    7                       1255    45429 *   set_ayar_prs_ayrilma_nedeni(integer, text)    FUNCTION     �   CREATE FUNCTION public.set_ayar_prs_ayrilma_nedeni(pid integer, payrilmanedeni text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_ayrilma_nedeni SET ayrilma_nedeni=pAyrilmaNedeni WHERE id=pID;
END;
$$;
 T   DROP FUNCTION public.set_ayar_prs_ayrilma_nedeni(pid integer, payrilmanedeni text);
       public       postgres    false    7    1                       1255    45430 *   set_ayar_prs_birim(integer, integer, text)    FUNCTION     �   CREATE FUNCTION public.set_ayar_prs_birim(pid integer, pbolumid integer, pbirim text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_birim SET bolum_id=pbolumID, birim=pBirim WHERE id=pID;
	RETURN;
END;
$$;
 U   DROP FUNCTION public.set_ayar_prs_birim(pid integer, pbolumid integer, pbirim text);
       public       postgres    false    1    7                       1255    45431 !   set_ayar_prs_bolum(integer, text)    FUNCTION     �   CREATE FUNCTION public.set_ayar_prs_bolum(pid integer, pbolum text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_bolum SET bolum=pBolum WHERE id=pID;
	RETURN;
END;
$$;
 C   DROP FUNCTION public.set_ayar_prs_bolum(pid integer, pbolum text);
       public       postgres    false    7    1            �           0    0 5   FUNCTION set_ayar_prs_bolum(pid integer, pbolum text)    COMMENT     u   COMMENT ON FUNCTION public.set_ayar_prs_bolum(pid integer, pbolum text) IS 'sp update personel tanımları bölüm';
            public       postgres    false    520            	           1255    45432 -   set_ayar_prs_cinsiyet(integer, text, boolean)    FUNCTION     �   CREATE FUNCTION public.set_ayar_prs_cinsiyet(pid integer, pcinsiyet text, pisman boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_cinsiyet SET cinsiyet=pCinsiyet, is_man=pIsMan WHERE id=pID;
	RETURN;
END;
$$;
 Y   DROP FUNCTION public.set_ayar_prs_cinsiyet(pid integer, pcinsiyet text, pisman boolean);
       public       postgres    false    7    1            
           1255    45433 )   set_ayar_prs_egitim_durumu(integer, text)    FUNCTION     �   CREATE FUNCTION public.set_ayar_prs_egitim_durumu(pid integer, pegitimdurumu text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_egitim_durumu SET egitim_durumu=pEgitimDurumu WHERE id=pID;
	RETURN;
END;
$$;
 R   DROP FUNCTION public.set_ayar_prs_egitim_durumu(pid integer, pegitimdurumu text);
       public       postgres    false    7    1                       1255    45434 (   set_ayar_prs_ehliyet_tipi(integer, text)    FUNCTION     �   CREATE FUNCTION public.set_ayar_prs_ehliyet_tipi(pid integer, pehliyettipi text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_ehliyet_tipi SET ehliyet_tipi=pEhliyetTipi WHERE id=pID;
	RETURN;
END;
$$;
 P   DROP FUNCTION public.set_ayar_prs_ehliyet_tipi(pid integer, pehliyettipi text);
       public       postgres    false    1    7                       1255    45435 !   set_ayar_prs_gorev(integer, text)    FUNCTION     �   CREATE FUNCTION public.set_ayar_prs_gorev(pid integer, pgorev text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_gorev SET gorev=pGorev WHERE id=pID;
	RETURN;
END;
$$;
 C   DROP FUNCTION public.set_ayar_prs_gorev(pid integer, pgorev text);
       public       postgres    false    1    7                       1255    45436 %   set_ayar_prs_izin_tipi(integer, text)    FUNCTION     �   CREATE FUNCTION public.set_ayar_prs_izin_tipi(pid integer, pizintipi text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_izin_tipi SET izin_tipi=pIzinTipi WHERE id=pID;
	RETURN;
END;
$$;
 J   DROP FUNCTION public.set_ayar_prs_izin_tipi(pid integer, pizintipi text);
       public       postgres    false    7    1                       1255    45437 1   set_ayar_prs_medeni_durum(integer, text, boolean)    FUNCTION       CREATE FUNCTION public.set_ayar_prs_medeni_durum(pid integer, pmedenidurum text, pismarried boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_medeni_durum SET medeni_durum=pMedeniDurum, is_married=pIsMarried WHERE id=pID;
	RETURN;
END;
$$;
 d   DROP FUNCTION public.set_ayar_prs_medeni_durum(pid integer, pmedenidurum text, pismarried boolean);
       public       postgres    false    1    7                       1255    45438 '   set_ayar_prs_mektup_tipi(integer, text)    FUNCTION     �   CREATE FUNCTION public.set_ayar_prs_mektup_tipi(pid integer, pmektuptipi text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_mektup_tipi SET mektup_tipi=pMektupTipi WHERE id=pID;
	RETURN;
END;
$$;
 N   DROP FUNCTION public.set_ayar_prs_mektup_tipi(pid integer, pmektuptipi text);
       public       postgres    false    1    7                       1255    45439 $   set_ayar_prs_myk_tipi(integer, text)    FUNCTION     �   CREATE FUNCTION public.set_ayar_prs_myk_tipi(pid integer, pmyktipi text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_myk_tipi SET myk_tipi=pMykTipi WHERE id=pID;
	RETURN;
END;
$$;
 H   DROP FUNCTION public.set_ayar_prs_myk_tipi(pid integer, pmyktipi text);
       public       postgres    false    7    1                       1255    45440 2   set_ayar_prs_personel_tipi(integer, text, boolean)    FUNCTION       CREATE FUNCTION public.set_ayar_prs_personel_tipi(pid integer, ppersoneltipi text, pisactive boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_personel_tipi SET personel_tipi=pPersonelTipi, is_active=pIsActive WHERE id=pID;
	RETURN;
END;
$$;
 e   DROP FUNCTION public.set_ayar_prs_personel_tipi(pid integer, ppersoneltipi text, pisactive boolean);
       public       postgres    false    7    1                       1255    45441 &   set_ayar_prs_rapor_tipi(integer, text)    FUNCTION     �   CREATE FUNCTION public.set_ayar_prs_rapor_tipi(pid integer, praportipi text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_rapor_tipi SET rapor_tipi=pRaporTipi WHERE id=pID;
	RETURN;
END;
$$;
 L   DROP FUNCTION public.set_ayar_prs_rapor_tipi(pid integer, praportipi text);
       public       postgres    false    1    7                       1255    45442 $   set_ayar_prs_src_tipi(integer, text)    FUNCTION     �   CREATE FUNCTION public.set_ayar_prs_src_tipi(pid integer, psrctipi text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_src_tipi SET src_tipi=pSrcTipi WHERE id=pID;
	RETURN;
END;
$$;
 H   DROP FUNCTION public.set_ayar_prs_src_tipi(pid integer, psrctipi text);
       public       postgres    false    7    1                       1255    45443 /   set_ayar_prs_tatil_tipi(integer, text, boolean)    FUNCTION       CREATE FUNCTION public.set_ayar_prs_tatil_tipi(pid integer, ptatiltipi text, pisresmitatil boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_tatil_tipi SET tatil_tipi=pTatilTipi, is_resmi_tatil=pIsResmiTatil WHERE id=pID;
	RETURN;
END;
$$;
 c   DROP FUNCTION public.set_ayar_prs_tatil_tipi(pid integer, ptatiltipi text, pisresmitatil boolean);
       public       postgres    false    7    1                       1255    45444 '   set_ayar_prs_yabanci_dil(integer, text)    FUNCTION     �   CREATE FUNCTION public.set_ayar_prs_yabanci_dil(pid integer, pyabancidil text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_yabanci_dil SET yabanci_dil=pYabanciDil WHERE id=pID;
	RETURN;
END;
$$;
 N   DROP FUNCTION public.set_ayar_prs_yabanci_dil(pid integer, pyabancidil text);
       public       postgres    false    7    1                       1255    45445 0   set_ayar_prs_yabanci_dil_seviyesi(integer, text)    FUNCTION       CREATE FUNCTION public.set_ayar_prs_yabanci_dil_seviyesi(pid integer, pdilseviyesi text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ayar_prs_yabanci_dil_seviyesi SET yabanci_dil_seviyesi=pDilSeviyesi WHERE id=pID;
	RETURN;
END;
$$;
 X   DROP FUNCTION public.set_ayar_prs_yabanci_dil_seviyesi(pid integer, pdilseviyesi text);
       public       postgres    false    7    1                       1255    45446    table_listen(text)    FUNCTION     �   CREATE FUNCTION public.table_listen(table_name text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  SELECT listen table_name;
  RETURN;
END;
$$;
 4   DROP FUNCTION public.table_listen(table_name text);
       public       postgres    false    1    7                       1255    45447    table_notify()    FUNCTION     �  CREATE FUNCTION public.table_notify() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$    BEGIN
        IF (TG_OP = 'INSERT') THEN
		PERFORM pg_notify(TG_TABLE_NAME, NEW.id::varchar);
        ELSIF (TG_OP = 'UPDATE') THEN
		PERFORM pg_notify(TG_TABLE_NAME, OLD.id::varchar);
        ELSIF (TG_OP = 'DELETE') THEN
		PERFORM pg_notify(TG_TABLE_NAME, '');
        END IF;
        RETURN NEW;
    END;$$;
 %   DROP FUNCTION public.table_notify();
       public       postgres    false    1    7            �           0    0    FUNCTION table_notify()    ACL     v   REVOKE ALL ON FUNCTION public.table_notify() FROM PUBLIC;
REVOKE ALL ON FUNCTION public.table_notify() FROM postgres;
            public       postgres    false    541                       1255    45448    table_notify(text)    FUNCTION     �   CREATE FUNCTION public.table_notify(table_name text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  SELECT notify table_name;
  RETURN;
END;
$$;
 4   DROP FUNCTION public.table_notify(table_name text);
       public       postgres    false    1    7                       1255    45449    table_unlisten(text)    FUNCTION     �   CREATE FUNCTION public.table_unlisten(table_name text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  SELECT unlisten table_name;
  RETURN;
END;
$$;
 6   DROP FUNCTION public.table_unlisten(table_name text);
       public       postgres    false    7    1            �            1259    45450    adres    TABLE     �  CREATE TABLE public.adres (
    id integer NOT NULL,
    ulke_id integer,
    sehir_id integer,
    ilce character varying(64),
    mahalle character varying(64),
    cadde character varying(64),
    sokak character varying(64),
    bina character varying(8),
    kapi_no character varying(8),
    posta_kutusu character varying(16),
    posta_kodu character varying(16),
    web_sitesi character varying(64),
    eposta_adresi character varying(128)
);
    DROP TABLE public.adres;
       public         postgres    false    7            �            1259    45456    adres_id_seq    SEQUENCE     u   CREATE SEQUENCE public.adres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.adres_id_seq;
       public       postgres    false    181    7            �           0    0    adres_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.adres_id_seq OWNED BY public.adres.id;
            public       postgres    false    182            �            1259    45458    alis_teklif    TABLE     �  CREATE TABLE public.alis_teklif (
    id integer NOT NULL,
    teklif_no integer NOT NULL,
    teklif_tarihi timestamp without time zone NOT NULL,
    cari_kod character varying(16),
    firma character varying(128),
    vergi_dairesi character varying(32),
    vergi_no character varying(16),
    aciklama character varying(128),
    referans character varying(32),
    teslim_tarihi timestamp without time zone,
    son_gecerlilik_tarihi timestamp without time zone,
    para_birimi character varying(3) NOT NULL,
    odeme_baslangic_donemi character varying(8),
    toplam_tutar double precision DEFAULT 0 NOT NULL,
    toplam_iskonto_tutar double precision DEFAULT 0 NOT NULL,
    toplam_kdv_tutar double precision DEFAULT 0 NOT NULL,
    genel_toplam double precision DEFAULT 0 NOT NULL,
    musteri_temsilcisi_id integer,
    ulke character varying(64),
    sehir character varying(32),
    adres character varying(80),
    posta_kodu character varying(7),
    yurtici_ihracat character varying(24),
    ortalama_opsiyon double precision,
    fatura_tipi character varying(16),
    tevkifat_kodu character varying(3),
    ihrac_kayit_kodu character varying(3),
    tevkifat_pay integer,
    tevkifat_payda integer,
    genel_iskonto_orani double precision DEFAULT 0 NOT NULL,
    genel_iskonto_tutar double precision DEFAULT 0 NOT NULL,
    is_e_fatura boolean DEFAULT false NOT NULL,
    siparislesti boolean NOT NULL
);
    DROP TABLE public.alis_teklif;
       public         postgres    false    7            �           0    0    TABLE alis_teklif    ACL     �   REVOKE ALL ON TABLE public.alis_teklif FROM PUBLIC;
REVOKE ALL ON TABLE public.alis_teklif FROM postgres;
GRANT ALL ON TABLE public.alis_teklif TO postgres;
            public       postgres    false    183            �            1259    45471    alis_teklif_detay    TABLE     Z   CREATE TABLE public.alis_teklif_detay (
    id integer NOT NULL,
    header_id integer
);
 %   DROP TABLE public.alis_teklif_detay;
       public         postgres    false    7            �           0    0    TABLE alis_teklif_detay    ACL     �   REVOKE ALL ON TABLE public.alis_teklif_detay FROM PUBLIC;
REVOKE ALL ON TABLE public.alis_teklif_detay FROM postgres;
GRANT ALL ON TABLE public.alis_teklif_detay TO postgres;
            public       postgres    false    184            �            1259    45474    alis_teklif_detay_id_seq    SEQUENCE     �   CREATE SEQUENCE public.alis_teklif_detay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.alis_teklif_detay_id_seq;
       public       postgres    false    184    7            �           0    0    alis_teklif_detay_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.alis_teklif_detay_id_seq OWNED BY public.alis_teklif_detay.id;
            public       postgres    false    185            �           0    0 !   SEQUENCE alis_teklif_detay_id_seq    ACL       REVOKE ALL ON SEQUENCE public.alis_teklif_detay_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.alis_teklif_detay_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.alis_teklif_detay_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.alis_teklif_detay_id_seq TO PUBLIC;
            public       postgres    false    185            �            1259    45476    alis_teklif_id_seq    SEQUENCE     {   CREATE SEQUENCE public.alis_teklif_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.alis_teklif_id_seq;
       public       postgres    false    183    7            �           0    0    alis_teklif_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.alis_teklif_id_seq OWNED BY public.alis_teklif.id;
            public       postgres    false    186            �           0    0    SEQUENCE alis_teklif_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.alis_teklif_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.alis_teklif_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.alis_teklif_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.alis_teklif_id_seq TO PUBLIC;
            public       postgres    false    186            �            1259    45478    ambar    TABLE       CREATE TABLE public.ambar (
    id integer NOT NULL,
    ambar_adi character varying(32),
    is_varsayilan_hammadde_ambari boolean DEFAULT false NOT NULL,
    is_varsayilan_uretim_ambari boolean DEFAULT false NOT NULL,
    is_varsayilan_satis_ambari boolean DEFAULT false NOT NULL
);
    DROP TABLE public.ambar;
       public         postgres    false    7            �           0    0    TABLE ambar    COMMENT     Q   COMMENT ON TABLE public.ambar IS 'Stok hareketlerinin tutulduğu ambar bilgisi';
            public       postgres    false    187            �           0    0    TABLE ambar    ACL     �   REVOKE ALL ON TABLE public.ambar FROM PUBLIC;
REVOKE ALL ON TABLE public.ambar FROM postgres;
GRANT ALL ON TABLE public.ambar TO postgres;
            public       postgres    false    187            �            1259    45484    ambar_id_seq    SEQUENCE     u   CREATE SEQUENCE public.ambar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.ambar_id_seq;
       public       postgres    false    7    187            �           0    0    ambar_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.ambar_id_seq OWNED BY public.ambar.id;
            public       postgres    false    188            �           0    0    SEQUENCE ambar_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.ambar_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ambar_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ambar_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ambar_id_seq TO PUBLIC;
            public       postgres    false    188            �            1259    45486    arc_arac    TABLE     �  CREATE TABLE public.arc_arac (
    id integer NOT NULL,
    marka character varying(32),
    model character varying(32),
    plaka character varying(16),
    renk character varying(16),
    gelis_tarihi date,
    gelis_km integer,
    gelis_yeri character varying(64),
    aciklama character varying(128),
    is_active boolean DEFAULT true NOT NULL,
    aktif_km integer,
    aktif_konum character varying(64)
);
    DROP TABLE public.arc_arac;
       public         postgres    false    7            �            1259    45490    arc_arac_id_seq    SEQUENCE     x   CREATE SEQUENCE public.arc_arac_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.arc_arac_id_seq;
       public       postgres    false    7    189            �           0    0    arc_arac_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.arc_arac_id_seq OWNED BY public.arc_arac.id;
            public       postgres    false    190            �            1259    45492    ayar_barkod_hazirlik_dosya_turu    TABLE     y   CREATE TABLE public.ayar_barkod_hazirlik_dosya_turu (
    id integer NOT NULL,
    tur character varying(32) NOT NULL
);
 3   DROP TABLE public.ayar_barkod_hazirlik_dosya_turu;
       public         postgres    false    7            �            1259    45495 &   ayar_barkod_hazirlik_dosya_turu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_barkod_hazirlik_dosya_turu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.ayar_barkod_hazirlik_dosya_turu_id_seq;
       public       postgres    false    7    191            �           0    0 &   ayar_barkod_hazirlik_dosya_turu_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.ayar_barkod_hazirlik_dosya_turu_id_seq OWNED BY public.ayar_barkod_hazirlik_dosya_turu.id;
            public       postgres    false    192            �           0    0 /   SEQUENCE ayar_barkod_hazirlik_dosya_turu_id_seq    ACL     F  REVOKE ALL ON SEQUENCE public.ayar_barkod_hazirlik_dosya_turu_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_barkod_hazirlik_dosya_turu_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_barkod_hazirlik_dosya_turu_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_barkod_hazirlik_dosya_turu_id_seq TO PUBLIC;
            public       postgres    false    192            �            1259    45497    ayar_barkod_serino_turu    TABLE     �   CREATE TABLE public.ayar_barkod_serino_turu (
    id integer NOT NULL,
    tur character varying(4) NOT NULL,
    aciklama character varying(16) NOT NULL
);
 +   DROP TABLE public.ayar_barkod_serino_turu;
       public         postgres    false    7            �            1259    45500    ayar_barkod_serino_turu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_barkod_serino_turu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.ayar_barkod_serino_turu_id_seq;
       public       postgres    false    7    193            �           0    0    ayar_barkod_serino_turu_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.ayar_barkod_serino_turu_id_seq OWNED BY public.ayar_barkod_serino_turu.id;
            public       postgres    false    194            �           0    0 '   SEQUENCE ayar_barkod_serino_turu_id_seq    ACL     &  REVOKE ALL ON SEQUENCE public.ayar_barkod_serino_turu_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_barkod_serino_turu_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_barkod_serino_turu_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_barkod_serino_turu_id_seq TO PUBLIC;
            public       postgres    false    194            �            1259    45502    ayar_barkod_tezgah    TABLE     �   CREATE TABLE public.ayar_barkod_tezgah (
    id integer NOT NULL,
    tezgah_adi character varying(32) NOT NULL,
    ambar_id integer NOT NULL
);
 &   DROP TABLE public.ayar_barkod_tezgah;
       public         postgres    false    7            �            1259    45505    ayar_barkod_tezgah_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_barkod_tezgah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.ayar_barkod_tezgah_id_seq;
       public       postgres    false    195    7            �           0    0    ayar_barkod_tezgah_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.ayar_barkod_tezgah_id_seq OWNED BY public.ayar_barkod_tezgah.id;
            public       postgres    false    196            �           0    0 "   SEQUENCE ayar_barkod_tezgah_id_seq    ACL       REVOKE ALL ON SEQUENCE public.ayar_barkod_tezgah_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_barkod_tezgah_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_barkod_tezgah_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_barkod_tezgah_id_seq TO PUBLIC;
            public       postgres    false    196            �            1259    45507    ayar_barkod_urun_turu    TABLE     o   CREATE TABLE public.ayar_barkod_urun_turu (
    id integer NOT NULL,
    tur character varying(16) NOT NULL
);
 )   DROP TABLE public.ayar_barkod_urun_turu;
       public         postgres    false    7            �            1259    45510    ayar_barkod_urun_turu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_barkod_urun_turu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.ayar_barkod_urun_turu_id_seq;
       public       postgres    false    197    7            �           0    0    ayar_barkod_urun_turu_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.ayar_barkod_urun_turu_id_seq OWNED BY public.ayar_barkod_urun_turu.id;
            public       postgres    false    198            �           0    0 %   SEQUENCE ayar_barkod_urun_turu_id_seq    ACL       REVOKE ALL ON SEQUENCE public.ayar_barkod_urun_turu_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_barkod_urun_turu_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_barkod_urun_turu_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_barkod_urun_turu_id_seq TO PUBLIC;
            public       postgres    false    198            �            1259    45512    ayar_bb_calisma_durumu    TABLE     {   CREATE TABLE public.ayar_bb_calisma_durumu (
    id integer NOT NULL,
    calisma_durumu character varying(32) NOT NULL
);
 *   DROP TABLE public.ayar_bb_calisma_durumu;
       public         postgres    false    7            �            1259    45515    ayar_bb_calisma_durumu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_bb_calisma_durumu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.ayar_bb_calisma_durumu_id_seq;
       public       postgres    false    199    7            �           0    0    ayar_bb_calisma_durumu_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.ayar_bb_calisma_durumu_id_seq OWNED BY public.ayar_bb_calisma_durumu.id;
            public       postgres    false    200            �            1259    45517    ayar_bb_finans_durumu    TABLE     y   CREATE TABLE public.ayar_bb_finans_durumu (
    id integer NOT NULL,
    finans_durumu character varying(32) NOT NULL
);
 )   DROP TABLE public.ayar_bb_finans_durumu;
       public         postgres    false    7            �            1259    45520    ayar_bb_finans_durumu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_bb_finans_durumu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.ayar_bb_finans_durumu_id_seq;
       public       postgres    false    201    7            �           0    0    ayar_bb_finans_durumu_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.ayar_bb_finans_durumu_id_seq OWNED BY public.ayar_bb_finans_durumu.id;
            public       postgres    false    202            �            1259    45522    ayar_bb_firma_tipi    TABLE     s   CREATE TABLE public.ayar_bb_firma_tipi (
    id integer NOT NULL,
    firma_tipi character varying(32) NOT NULL
);
 &   DROP TABLE public.ayar_bb_firma_tipi;
       public         postgres    false    7            �            1259    45525    ayar_bb_firma_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_bb_firma_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.ayar_bb_firma_tipi_id_seq;
       public       postgres    false    203    7            �           0    0    ayar_bb_firma_tipi_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.ayar_bb_firma_tipi_id_seq OWNED BY public.ayar_bb_firma_tipi.id;
            public       postgres    false    204            �            1259    45527    ayar_bordro_tipi    TABLE     l   CREATE TABLE public.ayar_bordro_tipi (
    id integer NOT NULL,
    deger character varying(32) NOT NULL
);
 $   DROP TABLE public.ayar_bordro_tipi;
       public         postgres    false    7            �            1259    45530    ayar_bordro_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_bordro_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.ayar_bordro_tipi_id_seq;
       public       postgres    false    205    7            �           0    0    ayar_bordro_tipi_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.ayar_bordro_tipi_id_seq OWNED BY public.ayar_bordro_tipi.id;
            public       postgres    false    206            �           0    0     SEQUENCE ayar_bordro_tipi_id_seq    ACL     
  REVOKE ALL ON SEQUENCE public.ayar_bordro_tipi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_bordro_tipi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_bordro_tipi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_bordro_tipi_id_seq TO PUBLIC;
            public       postgres    false    206            �            1259    45532    ayar_cek_senet_cash_edici_tipi    TABLE     q   CREATE TABLE public.ayar_cek_senet_cash_edici_tipi (
    id integer NOT NULL,
    deger character varying(32)
);
 2   DROP TABLE public.ayar_cek_senet_cash_edici_tipi;
       public         postgres    false    7            �            1259    45535 %   ayar_cek_senet_cash_edici_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_cek_senet_cash_edici_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.ayar_cek_senet_cash_edici_tipi_id_seq;
       public       postgres    false    7    207            �           0    0 %   ayar_cek_senet_cash_edici_tipi_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.ayar_cek_senet_cash_edici_tipi_id_seq OWNED BY public.ayar_cek_senet_cash_edici_tipi.id;
            public       postgres    false    208            �           0    0 .   SEQUENCE ayar_cek_senet_cash_edici_tipi_id_seq    ACL     B  REVOKE ALL ON SEQUENCE public.ayar_cek_senet_cash_edici_tipi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_cek_senet_cash_edici_tipi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_cek_senet_cash_edici_tipi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_cek_senet_cash_edici_tipi_id_seq TO PUBLIC;
            public       postgres    false    208            �            1259    45537     ayar_cek_senet_tahsil_odeme_tipi    TABLE     |   CREATE TABLE public.ayar_cek_senet_tahsil_odeme_tipi (
    id integer NOT NULL,
    deger character varying(32) NOT NULL
);
 4   DROP TABLE public.ayar_cek_senet_tahsil_odeme_tipi;
       public         postgres    false    7            �            1259    45540 '   ayar_cek_senet_tahsil_odeme_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_cek_senet_tahsil_odeme_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.ayar_cek_senet_tahsil_odeme_tipi_id_seq;
       public       postgres    false    7    209            �           0    0 '   ayar_cek_senet_tahsil_odeme_tipi_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.ayar_cek_senet_tahsil_odeme_tipi_id_seq OWNED BY public.ayar_cek_senet_tahsil_odeme_tipi.id;
            public       postgres    false    210            �           0    0 0   SEQUENCE ayar_cek_senet_tahsil_odeme_tipi_id_seq    ACL     J  REVOKE ALL ON SEQUENCE public.ayar_cek_senet_tahsil_odeme_tipi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_cek_senet_tahsil_odeme_tipi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_cek_senet_tahsil_odeme_tipi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_cek_senet_tahsil_odeme_tipi_id_seq TO PUBLIC;
            public       postgres    false    210            �            1259    45542    ayar_cek_senet_tipi    TABLE     o   CREATE TABLE public.ayar_cek_senet_tipi (
    id integer NOT NULL,
    deger character varying(32) NOT NULL
);
 '   DROP TABLE public.ayar_cek_senet_tipi;
       public         postgres    false    7            �            1259    45545    ayar_cek_senet_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_cek_senet_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.ayar_cek_senet_tipi_id_seq;
       public       postgres    false    211    7            �           0    0    ayar_cek_senet_tipi_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.ayar_cek_senet_tipi_id_seq OWNED BY public.ayar_cek_senet_tipi.id;
            public       postgres    false    212            �           0    0 #   SEQUENCE ayar_cek_senet_tipi_id_seq    ACL       REVOKE ALL ON SEQUENCE public.ayar_cek_senet_tipi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_cek_senet_tipi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_cek_senet_tipi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_cek_senet_tipi_id_seq TO PUBLIC;
            public       postgres    false    212            �            1259    45547    ayar_diger_database_bilgisi    TABLE       CREATE TABLE public.ayar_diger_database_bilgisi (
    id integer NOT NULL,
    db_name character varying(64),
    host_name character varying(64),
    db_user character varying(64),
    db_pass character varying(64),
    db_port integer,
    firma_adi character varying(64),
    is_aybey_teklif_hesapla boolean DEFAULT false NOT NULL,
    is_bulut_teklif_hesapla boolean DEFAULT false NOT NULL,
    is_maliyet_analiz boolean DEFAULT false NOT NULL,
    is_siparis_kopyala boolean DEFAULT false NOT NULL,
    is_otomatik_doviz_kaydet boolean DEFAULT false NOT NULL,
    is_staff_personel_bilgisi boolean DEFAULT false NOT NULL,
    is_uretim_takip boolean DEFAULT false NOT NULL,
    is_pano_uretim boolean DEFAULT false NOT NULL,
    is_nakit_akis boolean DEFAULT false NOT NULL
);
 /   DROP TABLE public.ayar_diger_database_bilgisi;
       public         postgres    false    7            �            1259    45559 "   ayar_diger_database_bilgisi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_diger_database_bilgisi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.ayar_diger_database_bilgisi_id_seq;
       public       postgres    false    213    7            �           0    0 "   ayar_diger_database_bilgisi_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.ayar_diger_database_bilgisi_id_seq OWNED BY public.ayar_diger_database_bilgisi.id;
            public       postgres    false    214            �           0    0 +   SEQUENCE ayar_diger_database_bilgisi_id_seq    ACL     6  REVOKE ALL ON SEQUENCE public.ayar_diger_database_bilgisi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_diger_database_bilgisi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_diger_database_bilgisi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_diger_database_bilgisi_id_seq TO PUBLIC;
            public       postgres    false    214            �            1259    45561    ayar_edefter_donem_raporu    TABLE     �   CREATE TABLE public.ayar_edefter_donem_raporu (
    id integer NOT NULL,
    rapor_baslangic_donemi date,
    rapor_bitis_donemi date,
    rapor_alma_tarihi date,
    yevmiye_no_baslangic integer,
    yevmiye_no_bitis integer
);
 -   DROP TABLE public.ayar_edefter_donem_raporu;
       public         postgres    false    7            �            1259    45564     ayar_edefter_donem_raporu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_edefter_donem_raporu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.ayar_edefter_donem_raporu_id_seq;
       public       postgres    false    7    215            �           0    0     ayar_edefter_donem_raporu_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.ayar_edefter_donem_raporu_id_seq OWNED BY public.ayar_edefter_donem_raporu.id;
            public       postgres    false    216            �           0    0 )   SEQUENCE ayar_edefter_donem_raporu_id_seq    ACL     .  REVOKE ALL ON SEQUENCE public.ayar_edefter_donem_raporu_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_edefter_donem_raporu_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_edefter_donem_raporu_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_edefter_donem_raporu_id_seq TO PUBLIC;
            public       postgres    false    216            �            1259    45566    ayar_efatura_alici_bilgisi    TABLE     _  CREATE TABLE public.ayar_efatura_alici_bilgisi (
    id integer NOT NULL,
    alias character varying(128),
    title character varying(256),
    type_ character varying(128),
    first_creation_time character varying(32),
    alias_creation_time character varying(32),
    register_time character varying(32),
    identifier character varying(11)
);
 .   DROP TABLE public.ayar_efatura_alici_bilgisi;
       public         postgres    false    7            �            1259    45572 !   ayar_efatura_alici_bilgisi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_alici_bilgisi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.ayar_efatura_alici_bilgisi_id_seq;
       public       postgres    false    217    7            �           0    0 !   ayar_efatura_alici_bilgisi_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.ayar_efatura_alici_bilgisi_id_seq OWNED BY public.ayar_efatura_alici_bilgisi.id;
            public       postgres    false    218            �           0    0 *   SEQUENCE ayar_efatura_alici_bilgisi_id_seq    ACL     2  REVOKE ALL ON SEQUENCE public.ayar_efatura_alici_bilgisi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_alici_bilgisi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_alici_bilgisi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_alici_bilgisi_id_seq TO PUBLIC;
            public       postgres    false    218            �            1259    45574    ayar_efatura_evrak_cinsi    TABLE     q   CREATE TABLE public.ayar_efatura_evrak_cinsi (
    id integer NOT NULL,
    evrak_cinsi character varying(32)
);
 ,   DROP TABLE public.ayar_efatura_evrak_cinsi;
       public         postgres    false    7            �            1259    45577    ayar_efatura_evrak_cinsi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_evrak_cinsi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.ayar_efatura_evrak_cinsi_id_seq;
       public       postgres    false    7    219            �           0    0    ayar_efatura_evrak_cinsi_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.ayar_efatura_evrak_cinsi_id_seq OWNED BY public.ayar_efatura_evrak_cinsi.id;
            public       postgres    false    220            �           0    0 (   SEQUENCE ayar_efatura_evrak_cinsi_id_seq    ACL     *  REVOKE ALL ON SEQUENCE public.ayar_efatura_evrak_cinsi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_evrak_cinsi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_evrak_cinsi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_evrak_cinsi_id_seq TO PUBLIC;
            public       postgres    false    220            �            1259    45579    ayar_efatura_evrak_tipi    TABLE     o   CREATE TABLE public.ayar_efatura_evrak_tipi (
    id integer NOT NULL,
    evrak_tipi character varying(32)
);
 +   DROP TABLE public.ayar_efatura_evrak_tipi;
       public         postgres    false    7            �            1259    45582    ayar_efatura_evrak_tipi_cinsi    TABLE     �   CREATE TABLE public.ayar_efatura_evrak_tipi_cinsi (
    id integer NOT NULL,
    evrak_tipi_id integer,
    evrak_cinsi_id integer
);
 1   DROP TABLE public.ayar_efatura_evrak_tipi_cinsi;
       public         postgres    false    7            �            1259    45585 $   ayar_efatura_evrak_tipi_cinsi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_evrak_tipi_cinsi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.ayar_efatura_evrak_tipi_cinsi_id_seq;
       public       postgres    false    7    222            �           0    0 $   ayar_efatura_evrak_tipi_cinsi_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.ayar_efatura_evrak_tipi_cinsi_id_seq OWNED BY public.ayar_efatura_evrak_tipi_cinsi.id;
            public       postgres    false    223            �           0    0 -   SEQUENCE ayar_efatura_evrak_tipi_cinsi_id_seq    ACL     >  REVOKE ALL ON SEQUENCE public.ayar_efatura_evrak_tipi_cinsi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_evrak_tipi_cinsi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_evrak_tipi_cinsi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_evrak_tipi_cinsi_id_seq TO PUBLIC;
            public       postgres    false    223            �            1259    45587    ayar_efatura_evrak_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_evrak_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.ayar_efatura_evrak_tipi_id_seq;
       public       postgres    false    7    221            �           0    0    ayar_efatura_evrak_tipi_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.ayar_efatura_evrak_tipi_id_seq OWNED BY public.ayar_efatura_evrak_tipi.id;
            public       postgres    false    224            �           0    0 '   SEQUENCE ayar_efatura_evrak_tipi_id_seq    ACL     &  REVOKE ALL ON SEQUENCE public.ayar_efatura_evrak_tipi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_evrak_tipi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_evrak_tipi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_evrak_tipi_id_seq TO PUBLIC;
            public       postgres    false    224            �            1259    45589    ayar_efatura_fatura_tipi    TABLE     r   CREATE TABLE public.ayar_efatura_fatura_tipi (
    id integer NOT NULL,
    tip character varying(32) NOT NULL
);
 ,   DROP TABLE public.ayar_efatura_fatura_tipi;
       public         postgres    false    7            �           0    0    TABLE ayar_efatura_fatura_tipi    COMMENT     J   COMMENT ON TABLE public.ayar_efatura_fatura_tipi IS 'eFatura Evrak Tipi';
            public       postgres    false    225            �            1259    45592    ayar_efatura_fatura_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_fatura_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.ayar_efatura_fatura_tipi_id_seq;
       public       postgres    false    225    7            �           0    0    ayar_efatura_fatura_tipi_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.ayar_efatura_fatura_tipi_id_seq OWNED BY public.ayar_efatura_fatura_tipi.id;
            public       postgres    false    226            �           0    0 (   SEQUENCE ayar_efatura_fatura_tipi_id_seq    ACL     *  REVOKE ALL ON SEQUENCE public.ayar_efatura_fatura_tipi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_fatura_tipi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_fatura_tipi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_fatura_tipi_id_seq TO PUBLIC;
            public       postgres    false    226            �            1259    45594    ayar_efatura_gonderici_bilgisi    TABLE     c  CREATE TABLE public.ayar_efatura_gonderici_bilgisi (
    id integer NOT NULL,
    alias character varying(128),
    title character varying(256),
    type_ character varying(128),
    first_creation_time character varying(32),
    alias_creation_time character varying(32),
    register_time character varying(32),
    identifier character varying(11)
);
 2   DROP TABLE public.ayar_efatura_gonderici_bilgisi;
       public         postgres    false    7            �            1259    45600 %   ayar_efatura_gonderici_bilgisi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_gonderici_bilgisi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.ayar_efatura_gonderici_bilgisi_id_seq;
       public       postgres    false    227    7            �           0    0 %   ayar_efatura_gonderici_bilgisi_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.ayar_efatura_gonderici_bilgisi_id_seq OWNED BY public.ayar_efatura_gonderici_bilgisi.id;
            public       postgres    false    228            �           0    0 .   SEQUENCE ayar_efatura_gonderici_bilgisi_id_seq    ACL     B  REVOKE ALL ON SEQUENCE public.ayar_efatura_gonderici_bilgisi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_gonderici_bilgisi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_gonderici_bilgisi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_gonderici_bilgisi_id_seq TO PUBLIC;
            public       postgres    false    228            �            1259    45602    ayar_efatura_gonderim_sekli    TABLE     �   CREATE TABLE public.ayar_efatura_gonderim_sekli (
    id integer NOT NULL,
    kod character varying(8),
    kod_adi character varying(64),
    aciklama character varying(1024),
    is_active boolean DEFAULT true NOT NULL
);
 /   DROP TABLE public.ayar_efatura_gonderim_sekli;
       public         postgres    false    7            �            1259    45609 "   ayar_efatura_gonderim_sekli_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_gonderim_sekli_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.ayar_efatura_gonderim_sekli_id_seq;
       public       postgres    false    229    7            �           0    0 "   ayar_efatura_gonderim_sekli_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.ayar_efatura_gonderim_sekli_id_seq OWNED BY public.ayar_efatura_gonderim_sekli.id;
            public       postgres    false    230            �           0    0 +   SEQUENCE ayar_efatura_gonderim_sekli_id_seq    ACL     6  REVOKE ALL ON SEQUENCE public.ayar_efatura_gonderim_sekli_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_gonderim_sekli_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_gonderim_sekli_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_gonderim_sekli_id_seq TO PUBLIC;
            public       postgres    false    230            �            1259    45611 (   ayar_efatura_ihrac_kayitli_fatura_sebebi    TABLE     �   CREATE TABLE public.ayar_efatura_ihrac_kayitli_fatura_sebebi (
    id integer NOT NULL,
    kod character varying(3),
    aciklama character varying(256)
);
 <   DROP TABLE public.ayar_efatura_ihrac_kayitli_fatura_sebebi;
       public         postgres    false    7            �            1259    45614 /   ayar_efatura_ihrac_kayitli_fatura_sebebi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_ihrac_kayitli_fatura_sebebi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.ayar_efatura_ihrac_kayitli_fatura_sebebi_id_seq;
       public       postgres    false    231    7            �           0    0 /   ayar_efatura_ihrac_kayitli_fatura_sebebi_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.ayar_efatura_ihrac_kayitli_fatura_sebebi_id_seq OWNED BY public.ayar_efatura_ihrac_kayitli_fatura_sebebi.id;
            public       postgres    false    232            �           0    0 8   SEQUENCE ayar_efatura_ihrac_kayitli_fatura_sebebi_id_seq    ACL     j  REVOKE ALL ON SEQUENCE public.ayar_efatura_ihrac_kayitli_fatura_sebebi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_ihrac_kayitli_fatura_sebebi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_ihrac_kayitli_fatura_sebebi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_ihrac_kayitli_fatura_sebebi_id_seq TO PUBLIC;
            public       postgres    false    232            �            1259    45616    ayar_efatura_iletisim_kanali    TABLE     �   CREATE TABLE public.ayar_efatura_iletisim_kanali (
    id integer NOT NULL,
    kod character varying(2) NOT NULL,
    aciklama character varying(512)
);
 0   DROP TABLE public.ayar_efatura_iletisim_kanali;
       public         postgres    false    7            �           0    0 "   TABLE ayar_efatura_iletisim_kanali    ACL     �   REVOKE ALL ON TABLE public.ayar_efatura_iletisim_kanali FROM PUBLIC;
REVOKE ALL ON TABLE public.ayar_efatura_iletisim_kanali FROM postgres;
GRANT ALL ON TABLE public.ayar_efatura_iletisim_kanali TO postgres;
            public       postgres    false    233            �            1259    45622 #   ayar_efatura_iletisim_kanali_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_iletisim_kanali_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.ayar_efatura_iletisim_kanali_id_seq;
       public       postgres    false    7    233            �           0    0 #   ayar_efatura_iletisim_kanali_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.ayar_efatura_iletisim_kanali_id_seq OWNED BY public.ayar_efatura_iletisim_kanali.id;
            public       postgres    false    234            �           0    0 ,   SEQUENCE ayar_efatura_iletisim_kanali_id_seq    ACL     :  REVOKE ALL ON SEQUENCE public.ayar_efatura_iletisim_kanali_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_iletisim_kanali_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_iletisim_kanali_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_iletisim_kanali_id_seq TO PUBLIC;
            public       postgres    false    234            �            1259    45624    ayar_efatura_istisna_kodu    TABLE     �   CREATE TABLE public.ayar_efatura_istisna_kodu (
    id integer NOT NULL,
    kod character varying(4) NOT NULL,
    aciklama character varying(512) NOT NULL,
    is_tam_istisna boolean DEFAULT true NOT NULL,
    fatura_tip_id integer NOT NULL
);
 -   DROP TABLE public.ayar_efatura_istisna_kodu;
       public         postgres    false    7            �           0    0    TABLE ayar_efatura_istisna_kodu    ACL     �   REVOKE ALL ON TABLE public.ayar_efatura_istisna_kodu FROM PUBLIC;
REVOKE ALL ON TABLE public.ayar_efatura_istisna_kodu FROM postgres;
GRANT ALL ON TABLE public.ayar_efatura_istisna_kodu TO postgres;
            public       postgres    false    235            �            1259    45631     ayar_efatura_istisna_kodu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_istisna_kodu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.ayar_efatura_istisna_kodu_id_seq;
       public       postgres    false    7    235            �           0    0     ayar_efatura_istisna_kodu_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.ayar_efatura_istisna_kodu_id_seq OWNED BY public.ayar_efatura_istisna_kodu.id;
            public       postgres    false    236            �           0    0 )   SEQUENCE ayar_efatura_istisna_kodu_id_seq    ACL     .  REVOKE ALL ON SEQUENCE public.ayar_efatura_istisna_kodu_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_istisna_kodu_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_istisna_kodu_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_istisna_kodu_id_seq TO PUBLIC;
            public       postgres    false    236            �           1259    47561    ayar_efatura_kimlik_semasi    TABLE     �   CREATE TABLE public.ayar_efatura_kimlik_semasi (
    id integer NOT NULL,
    deger character varying(16),
    aciklama character varying(64),
    is_active boolean DEFAULT false NOT NULL
);
 .   DROP TABLE public.ayar_efatura_kimlik_semasi;
       public         postgres    false    7            �           0    0     TABLE ayar_efatura_kimlik_semasi    ACL     �   REVOKE ALL ON TABLE public.ayar_efatura_kimlik_semasi FROM PUBLIC;
REVOKE ALL ON TABLE public.ayar_efatura_kimlik_semasi FROM postgres;
GRANT ALL ON TABLE public.ayar_efatura_kimlik_semasi TO postgres;
            public       postgres    false    456            �           1259    47559 !   ayar_efatura_kimlik_semasi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_kimlik_semasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.ayar_efatura_kimlik_semasi_id_seq;
       public       postgres    false    456    7            �           0    0 !   ayar_efatura_kimlik_semasi_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.ayar_efatura_kimlik_semasi_id_seq OWNED BY public.ayar_efatura_kimlik_semasi.id;
            public       postgres    false    455            �            1259    45638    ayar_efatura_odeme_sekli    TABLE       CREATE TABLE public.ayar_efatura_odeme_sekli (
    id integer NOT NULL,
    kod character varying(16),
    odeme_sekli character varying(96),
    aciklama character varying(512),
    is_efatura boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT false NOT NULL
);
 ,   DROP TABLE public.ayar_efatura_odeme_sekli;
       public         postgres    false    7            �            1259    45646    ayar_efatura_odeme_sekli_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_odeme_sekli_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.ayar_efatura_odeme_sekli_id_seq;
       public       postgres    false    7    237            �           0    0    ayar_efatura_odeme_sekli_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.ayar_efatura_odeme_sekli_id_seq OWNED BY public.ayar_efatura_odeme_sekli.id;
            public       postgres    false    238            �           0    0 (   SEQUENCE ayar_efatura_odeme_sekli_id_seq    ACL     *  REVOKE ALL ON SEQUENCE public.ayar_efatura_odeme_sekli_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_odeme_sekli_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_odeme_sekli_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_odeme_sekli_id_seq TO PUBLIC;
            public       postgres    false    238            �            1259    45648    ayar_efatura_paket_tipi    TABLE     �   CREATE TABLE public.ayar_efatura_paket_tipi (
    id integer NOT NULL,
    kod character varying(2),
    paket_adi character varying(128),
    aciklama character varying(512),
    is_active boolean DEFAULT true NOT NULL
);
 +   DROP TABLE public.ayar_efatura_paket_tipi;
       public         postgres    false    7            �            1259    45655    ayar_efatura_paket_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_paket_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.ayar_efatura_paket_tipi_id_seq;
       public       postgres    false    7    239            �           0    0    ayar_efatura_paket_tipi_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.ayar_efatura_paket_tipi_id_seq OWNED BY public.ayar_efatura_paket_tipi.id;
            public       postgres    false    240            �           0    0 '   SEQUENCE ayar_efatura_paket_tipi_id_seq    ACL     &  REVOKE ALL ON SEQUENCE public.ayar_efatura_paket_tipi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_paket_tipi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_paket_tipi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_paket_tipi_id_seq TO PUBLIC;
            public       postgres    false    240            �            1259    45657    ayar_efatura_response_code    TABLE     l   CREATE TABLE public.ayar_efatura_response_code (
    id integer NOT NULL,
    deger character varying(8)
);
 .   DROP TABLE public.ayar_efatura_response_code;
       public         postgres    false    7            �           0    0     TABLE ayar_efatura_response_code    ACL     �   REVOKE ALL ON TABLE public.ayar_efatura_response_code FROM PUBLIC;
REVOKE ALL ON TABLE public.ayar_efatura_response_code FROM postgres;
GRANT ALL ON TABLE public.ayar_efatura_response_code TO postgres;
            public       postgres    false    241            �            1259    45660 !   ayar_efatura_response_code_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_response_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.ayar_efatura_response_code_id_seq;
       public       postgres    false    241    7            �           0    0 !   ayar_efatura_response_code_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.ayar_efatura_response_code_id_seq OWNED BY public.ayar_efatura_response_code.id;
            public       postgres    false    242            �           0    0 *   SEQUENCE ayar_efatura_response_code_id_seq    ACL     2  REVOKE ALL ON SEQUENCE public.ayar_efatura_response_code_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_response_code_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_response_code_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_response_code_id_seq TO PUBLIC;
            public       postgres    false    242            �            1259    45662    ayar_efatura_senaryo_tipi    TABLE     �   CREATE TABLE public.ayar_efatura_senaryo_tipi (
    id integer NOT NULL,
    tip character varying(32) NOT NULL,
    aciklama character varying(64)
);
 -   DROP TABLE public.ayar_efatura_senaryo_tipi;
       public         postgres    false    7            �           0    0    TABLE ayar_efatura_senaryo_tipi    COMMENT     P   COMMENT ON TABLE public.ayar_efatura_senaryo_tipi IS 'eFatura Senaryo tipleri';
            public       postgres    false    243            �           0    0    TABLE ayar_efatura_senaryo_tipi    ACL     �   REVOKE ALL ON TABLE public.ayar_efatura_senaryo_tipi FROM PUBLIC;
REVOKE ALL ON TABLE public.ayar_efatura_senaryo_tipi FROM postgres;
GRANT ALL ON TABLE public.ayar_efatura_senaryo_tipi TO postgres;
            public       postgres    false    243            �            1259    45665     ayar_efatura_senaryo_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_senaryo_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.ayar_efatura_senaryo_tipi_id_seq;
       public       postgres    false    7    243            �           0    0     ayar_efatura_senaryo_tipi_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.ayar_efatura_senaryo_tipi_id_seq OWNED BY public.ayar_efatura_senaryo_tipi.id;
            public       postgres    false    244            �           0    0 )   SEQUENCE ayar_efatura_senaryo_tipi_id_seq    ACL     .  REVOKE ALL ON SEQUENCE public.ayar_efatura_senaryo_tipi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_senaryo_tipi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_senaryo_tipi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_senaryo_tipi_id_seq TO PUBLIC;
            public       postgres    false    244            �            1259    45667    ayar_efatura_teslim_sarti    TABLE     �   CREATE TABLE public.ayar_efatura_teslim_sarti (
    id integer NOT NULL,
    kod character varying(16) NOT NULL,
    aciklama character varying(64) NOT NULL,
    is_efatura boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);
 -   DROP TABLE public.ayar_efatura_teslim_sarti;
       public         postgres    false    7            �            1259    45672     ayar_efatura_teslim_sarti_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_teslim_sarti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.ayar_efatura_teslim_sarti_id_seq;
       public       postgres    false    245    7            �           0    0     ayar_efatura_teslim_sarti_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.ayar_efatura_teslim_sarti_id_seq OWNED BY public.ayar_efatura_teslim_sarti.id;
            public       postgres    false    246            �           0    0 )   SEQUENCE ayar_efatura_teslim_sarti_id_seq    ACL     .  REVOKE ALL ON SEQUENCE public.ayar_efatura_teslim_sarti_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_teslim_sarti_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_teslim_sarti_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_teslim_sarti_id_seq TO PUBLIC;
            public       postgres    false    246            �            1259    45674    ayar_efatura_tevkifat_kodu    TABLE     �   CREATE TABLE public.ayar_efatura_tevkifat_kodu (
    id integer NOT NULL,
    kodu character varying(3),
    adi character varying(256),
    orani character varying(32),
    pay integer,
    payda integer
);
 .   DROP TABLE public.ayar_efatura_tevkifat_kodu;
       public         postgres    false    7            �           0    0     TABLE ayar_efatura_tevkifat_kodu    ACL     �   REVOKE ALL ON TABLE public.ayar_efatura_tevkifat_kodu FROM PUBLIC;
REVOKE ALL ON TABLE public.ayar_efatura_tevkifat_kodu FROM postgres;
GRANT ALL ON TABLE public.ayar_efatura_tevkifat_kodu TO postgres;
            public       postgres    false    247            �            1259    45677 !   ayar_efatura_tevkifat_kodu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_tevkifat_kodu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.ayar_efatura_tevkifat_kodu_id_seq;
       public       postgres    false    7    247            �           0    0 !   ayar_efatura_tevkifat_kodu_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.ayar_efatura_tevkifat_kodu_id_seq OWNED BY public.ayar_efatura_tevkifat_kodu.id;
            public       postgres    false    248            �           0    0 *   SEQUENCE ayar_efatura_tevkifat_kodu_id_seq    ACL     2  REVOKE ALL ON SEQUENCE public.ayar_efatura_tevkifat_kodu_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_tevkifat_kodu_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_tevkifat_kodu_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_tevkifat_kodu_id_seq TO PUBLIC;
            public       postgres    false    248            �            1259    45679    ayar_efatura_vergi_kodu    TABLE     �   CREATE TABLE public.ayar_efatura_vergi_kodu (
    id integer NOT NULL,
    kodu character varying(4),
    adi character varying(128),
    kisaltma character varying(32),
    tevkifat boolean DEFAULT false NOT NULL
);
 +   DROP TABLE public.ayar_efatura_vergi_kodu;
       public         postgres    false    7            �           0    0    TABLE ayar_efatura_vergi_kodu    ACL     �   REVOKE ALL ON TABLE public.ayar_efatura_vergi_kodu FROM PUBLIC;
REVOKE ALL ON TABLE public.ayar_efatura_vergi_kodu FROM postgres;
GRANT ALL ON TABLE public.ayar_efatura_vergi_kodu TO postgres;
            public       postgres    false    249            �            1259    45683    ayar_efatura_vergi_kodu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_efatura_vergi_kodu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.ayar_efatura_vergi_kodu_id_seq;
       public       postgres    false    249    7            �           0    0    ayar_efatura_vergi_kodu_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.ayar_efatura_vergi_kodu_id_seq OWNED BY public.ayar_efatura_vergi_kodu.id;
            public       postgres    false    250            �           0    0 '   SEQUENCE ayar_efatura_vergi_kodu_id_seq    ACL     &  REVOKE ALL ON SEQUENCE public.ayar_efatura_vergi_kodu_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_efatura_vergi_kodu_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_vergi_kodu_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_efatura_vergi_kodu_id_seq TO PUBLIC;
            public       postgres    false    250            �            1259    45685    ayar_fatura_no_serisi    TABLE     �   CREATE TABLE public.ayar_fatura_no_serisi (
    id integer NOT NULL,
    fatura_seri_id integer NOT NULL,
    deger character varying(16) NOT NULL
);
 )   DROP TABLE public.ayar_fatura_no_serisi;
       public         postgres    false    7            �            1259    45688    ayar_fatura_no_serisi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_fatura_no_serisi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.ayar_fatura_no_serisi_id_seq;
       public       postgres    false    251    7            �           0    0    ayar_fatura_no_serisi_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.ayar_fatura_no_serisi_id_seq OWNED BY public.ayar_fatura_no_serisi.id;
            public       postgres    false    252            �           0    0 %   SEQUENCE ayar_fatura_no_serisi_id_seq    ACL       REVOKE ALL ON SEQUENCE public.ayar_fatura_no_serisi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_fatura_no_serisi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_fatura_no_serisi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_fatura_no_serisi_id_seq TO PUBLIC;
            public       postgres    false    252            �            1259    45690    ayar_firma_tipi    TABLE     �   CREATE TABLE public.ayar_firma_tipi (
    id integer NOT NULL,
    firma_turu_id integer NOT NULL,
    firma_tipi character varying(48) NOT NULL
);
 #   DROP TABLE public.ayar_firma_tipi;
       public         postgres    false    7            �           0    0    TABLE ayar_firma_tipi    ACL     �   REVOKE ALL ON TABLE public.ayar_firma_tipi FROM PUBLIC;
REVOKE ALL ON TABLE public.ayar_firma_tipi FROM postgres;
GRANT ALL ON TABLE public.ayar_firma_tipi TO postgres;
            public       postgres    false    253            �            1259    45693    ayar_firma_tipi_id_seq    SEQUENCE        CREATE SEQUENCE public.ayar_firma_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.ayar_firma_tipi_id_seq;
       public       postgres    false    7    253            �           0    0    ayar_firma_tipi_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.ayar_firma_tipi_id_seq OWNED BY public.ayar_firma_tipi.id;
            public       postgres    false    254            �            1259    45695    ayar_firma_turu    TABLE     i   CREATE TABLE public.ayar_firma_turu (
    id integer NOT NULL,
    tur character varying(32) NOT NULL
);
 #   DROP TABLE public.ayar_firma_turu;
       public         postgres    false    7            �           0    0    TABLE ayar_firma_turu    ACL     �   REVOKE ALL ON TABLE public.ayar_firma_turu FROM PUBLIC;
REVOKE ALL ON TABLE public.ayar_firma_turu FROM postgres;
GRANT ALL ON TABLE public.ayar_firma_turu TO postgres;
            public       postgres    false    255                        1259    45698    ayar_firma_turu_id_seq    SEQUENCE        CREATE SEQUENCE public.ayar_firma_turu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.ayar_firma_turu_id_seq;
       public       postgres    false    255    7            �           0    0    ayar_firma_turu_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.ayar_firma_turu_id_seq OWNED BY public.ayar_firma_turu.id;
            public       postgres    false    256                       1259    45700    ayar_fis_tipi    TABLE     i   CREATE TABLE public.ayar_fis_tipi (
    id integer NOT NULL,
    deger character varying(32) NOT NULL
);
 !   DROP TABLE public.ayar_fis_tipi;
       public         postgres    false    7            �           0    0    TABLE ayar_fis_tipi    COMMENT     �   COMMENT ON TABLE public.ayar_fis_tipi IS 'Muhasebe fişlerinin tip bilgisini tutar Örnek: MAHSUP, AÇILIŞ, KAPANIŞ, ÖDEME, TAHSİL';
            public       postgres    false    257                       1259    45703    ayar_fis_tipi_id_seq    SEQUENCE     }   CREATE SEQUENCE public.ayar_fis_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.ayar_fis_tipi_id_seq;
       public       postgres    false    257    7            �           0    0    ayar_fis_tipi_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.ayar_fis_tipi_id_seq OWNED BY public.ayar_fis_tipi.id;
            public       postgres    false    258            �           0    0    SEQUENCE ayar_fis_tipi_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.ayar_fis_tipi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_fis_tipi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_fis_tipi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_fis_tipi_id_seq TO PUBLIC;
            public       postgres    false    258                       1259    45705    ayar_genel_ayarlar    TABLE     �   CREATE TABLE public.ayar_genel_ayarlar (
    id integer NOT NULL,
    donem integer,
    unvan character varying(256),
    vergi_no character varying(10),
    tc_no character varying(11),
    firma_tipi character varying(32),
    diger_ayarlar json
);
 &   DROP TABLE public.ayar_genel_ayarlar;
       public         postgres    false    7            �           0    0    TABLE ayar_genel_ayarlar    ACL     �   REVOKE ALL ON TABLE public.ayar_genel_ayarlar FROM PUBLIC;
REVOKE ALL ON TABLE public.ayar_genel_ayarlar FROM postgres;
GRANT ALL ON TABLE public.ayar_genel_ayarlar TO postgres;
            public       postgres    false    259                       1259    45711    ayar_genel_ayarlar_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_genel_ayarlar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.ayar_genel_ayarlar_id_seq;
       public       postgres    false    7    259            �           0    0    ayar_genel_ayarlar_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.ayar_genel_ayarlar_id_seq OWNED BY public.ayar_genel_ayarlar.id;
            public       postgres    false    260            �           0    0 "   SEQUENCE ayar_genel_ayarlar_id_seq    ACL       REVOKE ALL ON SEQUENCE public.ayar_genel_ayarlar_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_genel_ayarlar_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_genel_ayarlar_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_genel_ayarlar_id_seq TO PUBLIC;
            public       postgres    false    260                       1259    45713    ayar_hane_sayisi    TABLE     |  CREATE TABLE public.ayar_hane_sayisi (
    id integer NOT NULL,
    hesap_bakiye integer DEFAULT 2,
    alis_miktar integer DEFAULT 2,
    alis_fiyat integer DEFAULT 2,
    alis_tutar integer DEFAULT 2,
    satis_miktar integer DEFAULT 2,
    satis_fiyat integer DEFAULT 2,
    satis_tutar integer DEFAULT 2,
    stok_miktar integer DEFAULT 2,
    stok_fiyat integer DEFAULT 2
);
 $   DROP TABLE public.ayar_hane_sayisi;
       public         postgres    false    7                       1259    45725    ayar_hane_sayisi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_hane_sayisi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.ayar_hane_sayisi_id_seq;
       public       postgres    false    7    261            �           0    0    ayar_hane_sayisi_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.ayar_hane_sayisi_id_seq OWNED BY public.ayar_hane_sayisi.id;
            public       postgres    false    262            �           0    0     SEQUENCE ayar_hane_sayisi_id_seq    ACL     
  REVOKE ALL ON SEQUENCE public.ayar_hane_sayisi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_hane_sayisi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_hane_sayisi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_hane_sayisi_id_seq TO PUBLIC;
            public       postgres    false    262                       1259    45727    ayar_hesap_tipi    TABLE     p   CREATE TABLE public.ayar_hesap_tipi (
    id integer NOT NULL,
    hesap_tipi character varying(16) NOT NULL
);
 #   DROP TABLE public.ayar_hesap_tipi;
       public         postgres    false    7                       1259    45730    ayar_hesap_tipi_id_seq    SEQUENCE        CREATE SEQUENCE public.ayar_hesap_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.ayar_hesap_tipi_id_seq;
       public       postgres    false    7    263            �           0    0    ayar_hesap_tipi_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.ayar_hesap_tipi_id_seq OWNED BY public.ayar_hesap_tipi.id;
            public       postgres    false    264            �           0    0    SEQUENCE ayar_hesap_tipi_id_seq    ACL       REVOKE ALL ON SEQUENCE public.ayar_hesap_tipi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_hesap_tipi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_hesap_tipi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_hesap_tipi_id_seq TO PUBLIC;
            public       postgres    false    264            	           1259    45732    ayar_irsaliye_fatura_no_serisi    TABLE     �   CREATE TABLE public.ayar_irsaliye_fatura_no_serisi (
    id integer NOT NULL,
    deger character varying(8),
    is_fatura boolean DEFAULT false NOT NULL,
    is_irsaliye boolean DEFAULT false NOT NULL
);
 2   DROP TABLE public.ayar_irsaliye_fatura_no_serisi;
       public         postgres    false    7            
           1259    45737 %   ayar_irsaliye_fatura_no_serisi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_irsaliye_fatura_no_serisi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.ayar_irsaliye_fatura_no_serisi_id_seq;
       public       postgres    false    265    7            �           0    0 %   ayar_irsaliye_fatura_no_serisi_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.ayar_irsaliye_fatura_no_serisi_id_seq OWNED BY public.ayar_irsaliye_fatura_no_serisi.id;
            public       postgres    false    266            �           0    0 .   SEQUENCE ayar_irsaliye_fatura_no_serisi_id_seq    ACL     B  REVOKE ALL ON SEQUENCE public.ayar_irsaliye_fatura_no_serisi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_irsaliye_fatura_no_serisi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_irsaliye_fatura_no_serisi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_irsaliye_fatura_no_serisi_id_seq TO PUBLIC;
            public       postgres    false    266                       1259    45739    ayar_irsaliye_no_serisi    TABLE     �   CREATE TABLE public.ayar_irsaliye_no_serisi (
    id integer NOT NULL,
    irsaliye_seri_id integer NOT NULL,
    deger character varying(16) NOT NULL
);
 +   DROP TABLE public.ayar_irsaliye_no_serisi;
       public         postgres    false    7                       1259    45742    ayar_irsaliye_no_serisi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_irsaliye_no_serisi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.ayar_irsaliye_no_serisi_id_seq;
       public       postgres    false    7    267                        0    0    ayar_irsaliye_no_serisi_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.ayar_irsaliye_no_serisi_id_seq OWNED BY public.ayar_irsaliye_no_serisi.id;
            public       postgres    false    268                       0    0 '   SEQUENCE ayar_irsaliye_no_serisi_id_seq    ACL     &  REVOKE ALL ON SEQUENCE public.ayar_irsaliye_no_serisi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_irsaliye_no_serisi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_irsaliye_no_serisi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_irsaliye_no_serisi_id_seq TO PUBLIC;
            public       postgres    false    268                       1259    45744    ayar_modul_tipi    TABLE     b   CREATE TABLE public.ayar_modul_tipi (
    id integer NOT NULL,
    deger character varying(16)
);
 #   DROP TABLE public.ayar_modul_tipi;
       public         postgres    false    7                       1259    45747    ayar_modul_tipi_id_seq    SEQUENCE        CREATE SEQUENCE public.ayar_modul_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.ayar_modul_tipi_id_seq;
       public       postgres    false    7    269                       0    0    ayar_modul_tipi_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.ayar_modul_tipi_id_seq OWNED BY public.ayar_modul_tipi.id;
            public       postgres    false    270                       0    0    SEQUENCE ayar_modul_tipi_id_seq    ACL       REVOKE ALL ON SEQUENCE public.ayar_modul_tipi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_modul_tipi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_modul_tipi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_modul_tipi_id_seq TO PUBLIC;
            public       postgres    false    270                       1259    45749    ayar_musteri_firma_turu    TABLE     s   CREATE TABLE public.ayar_musteri_firma_turu (
    id integer NOT NULL,
    deger character varying(64) NOT NULL
);
 +   DROP TABLE public.ayar_musteri_firma_turu;
       public         postgres    false    7                       1259    45752    ayar_musteri_firma_turu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_musteri_firma_turu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.ayar_musteri_firma_turu_id_seq;
       public       postgres    false    271    7                       0    0    ayar_musteri_firma_turu_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.ayar_musteri_firma_turu_id_seq OWNED BY public.ayar_musteri_firma_turu.id;
            public       postgres    false    272                       0    0 '   SEQUENCE ayar_musteri_firma_turu_id_seq    ACL     &  REVOKE ALL ON SEQUENCE public.ayar_musteri_firma_turu_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_musteri_firma_turu_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_musteri_firma_turu_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_musteri_firma_turu_id_seq TO PUBLIC;
            public       postgres    false    272                       1259    45754    ayar_odeme_baslangic_donemi    TABLE     �   CREATE TABLE public.ayar_odeme_baslangic_donemi (
    id integer NOT NULL,
    deger character varying(32) NOT NULL,
    aciklama character varying(64),
    is_active boolean DEFAULT true NOT NULL
);
 /   DROP TABLE public.ayar_odeme_baslangic_donemi;
       public         postgres    false    7                       1259    45758 "   ayar_odeme_baslangic_donemi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_odeme_baslangic_donemi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.ayar_odeme_baslangic_donemi_id_seq;
       public       postgres    false    273    7                       0    0 "   ayar_odeme_baslangic_donemi_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.ayar_odeme_baslangic_donemi_id_seq OWNED BY public.ayar_odeme_baslangic_donemi.id;
            public       postgres    false    274                       0    0 +   SEQUENCE ayar_odeme_baslangic_donemi_id_seq    ACL     6  REVOKE ALL ON SEQUENCE public.ayar_odeme_baslangic_donemi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_odeme_baslangic_donemi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_odeme_baslangic_donemi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_odeme_baslangic_donemi_id_seq TO PUBLIC;
            public       postgres    false    274                       1259    45760    ayar_odeme_sekli    TABLE       CREATE TABLE public.ayar_odeme_sekli (
    id integer NOT NULL,
    kod character varying(8),
    odeme_sekli character varying(96) NOT NULL,
    aciklama character varying(512),
    is_efatura boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT false NOT NULL
);
 $   DROP TABLE public.ayar_odeme_sekli;
       public         postgres    false    7                       1259    45768    ayar_odeme_sekli_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_odeme_sekli_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.ayar_odeme_sekli_id_seq;
       public       postgres    false    7    275                       0    0    ayar_odeme_sekli_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.ayar_odeme_sekli_id_seq OWNED BY public.ayar_odeme_sekli.id;
            public       postgres    false    276            	           0    0     SEQUENCE ayar_odeme_sekli_id_seq    ACL     
  REVOKE ALL ON SEQUENCE public.ayar_odeme_sekli_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_odeme_sekli_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_odeme_sekli_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_odeme_sekli_id_seq TO PUBLIC;
            public       postgres    false    276                       1259    45770    ayar_prs_askerlik_durumu    TABLE     ~   CREATE TABLE public.ayar_prs_askerlik_durumu (
    id integer NOT NULL,
    askerlik_durumu character varying(16) NOT NULL
);
 ,   DROP TABLE public.ayar_prs_askerlik_durumu;
       public         postgres    false    7                       1259    45773    ayar_prs_askerlik_durumu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_askerlik_durumu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.ayar_prs_askerlik_durumu_id_seq;
       public       postgres    false    7    277            
           0    0    ayar_prs_askerlik_durumu_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.ayar_prs_askerlik_durumu_id_seq OWNED BY public.ayar_prs_askerlik_durumu.id;
            public       postgres    false    278                       1259    45775    ayar_prs_ayrilma_nedeni    TABLE     |   CREATE TABLE public.ayar_prs_ayrilma_nedeni (
    id integer NOT NULL,
    ayrilma_nedeni character varying(32) NOT NULL
);
 +   DROP TABLE public.ayar_prs_ayrilma_nedeni;
       public         postgres    false    7                       1259    45778    ayar_prs_ayrilma_nedeni_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_ayrilma_nedeni_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.ayar_prs_ayrilma_nedeni_id_seq;
       public       postgres    false    7    279                       0    0    ayar_prs_ayrilma_nedeni_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.ayar_prs_ayrilma_nedeni_id_seq OWNED BY public.ayar_prs_ayrilma_nedeni.id;
            public       postgres    false    280                       1259    45780    ayar_prs_birim    TABLE     �   CREATE TABLE public.ayar_prs_birim (
    id integer NOT NULL,
    birim character varying(32) NOT NULL,
    bolum_id integer
);
 "   DROP TABLE public.ayar_prs_birim;
       public         postgres    false    7                       0    0    TABLE ayar_prs_birim    COMMENT     �   COMMENT ON TABLE public.ayar_prs_birim IS 'Personelin şirket içindeki bölüm içindeki birimi(Departman içindeki alt kol)';
            public       postgres    false    281                       1259    45783    ayar_prs_birim_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.ayar_prs_birim_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.ayar_prs_birim_id_seq;
       public       postgres    false    7    281                       0    0    ayar_prs_birim_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.ayar_prs_birim_id_seq OWNED BY public.ayar_prs_birim.id;
            public       postgres    false    282                       1259    45785    ayar_prs_bolum    TABLE     j   CREATE TABLE public.ayar_prs_bolum (
    id integer NOT NULL,
    bolum character varying(32) NOT NULL
);
 "   DROP TABLE public.ayar_prs_bolum;
       public         postgres    false    7                       0    0    TABLE ayar_prs_bolum    COMMENT     p   COMMENT ON TABLE public.ayar_prs_bolum IS 'Personelin şirket içindeki çalıştığı bölüme ait bilgiler';
            public       postgres    false    283                       1259    45788    ayar_prs_bolum_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.ayar_prs_bolum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.ayar_prs_bolum_id_seq;
       public       postgres    false    7    283                       0    0    ayar_prs_bolum_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.ayar_prs_bolum_id_seq OWNED BY public.ayar_prs_bolum.id;
            public       postgres    false    284                       1259    45790    ayar_prs_cinsiyet    TABLE     �   CREATE TABLE public.ayar_prs_cinsiyet (
    id integer NOT NULL,
    cinsiyet character varying(32) NOT NULL,
    is_man boolean DEFAULT false NOT NULL
);
 %   DROP TABLE public.ayar_prs_cinsiyet;
       public         postgres    false    7                       1259    45794    ayar_prs_cinsiyet_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_cinsiyet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.ayar_prs_cinsiyet_id_seq;
       public       postgres    false    285    7                       0    0    ayar_prs_cinsiyet_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.ayar_prs_cinsiyet_id_seq OWNED BY public.ayar_prs_cinsiyet.id;
            public       postgres    false    286            �           1259    47335    ayar_prs_egitim_seviyesi    TABLE     ~   CREATE TABLE public.ayar_prs_egitim_seviyesi (
    id integer NOT NULL,
    egitim_seviyesi character varying(32) NOT NULL
);
 ,   DROP TABLE public.ayar_prs_egitim_seviyesi;
       public         postgres    false    7            �           1259    47333    ayar_prs_egitim_seviyesi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_egitim_seviyesi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.ayar_prs_egitim_seviyesi_id_seq;
       public       postgres    false    7    438                       0    0    ayar_prs_egitim_seviyesi_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.ayar_prs_egitim_seviyesi_id_seq OWNED BY public.ayar_prs_egitim_seviyesi.id;
            public       postgres    false    437                       1259    45801    ayar_prs_ehliyet_tipi    TABLE     x   CREATE TABLE public.ayar_prs_ehliyet_tipi (
    id integer NOT NULL,
    ehliyet_tipi character varying(32) NOT NULL
);
 )   DROP TABLE public.ayar_prs_ehliyet_tipi;
       public         postgres    false    7                        1259    45804    ayar_prs_ehliyet_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_ehliyet_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.ayar_prs_ehliyet_tipi_id_seq;
       public       postgres    false    7    287                       0    0    ayar_prs_ehliyet_tipi_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.ayar_prs_ehliyet_tipi_id_seq OWNED BY public.ayar_prs_ehliyet_tipi.id;
            public       postgres    false    288            !           1259    45806    ayar_prs_gorev    TABLE     j   CREATE TABLE public.ayar_prs_gorev (
    id integer NOT NULL,
    gorev character varying(32) NOT NULL
);
 "   DROP TABLE public.ayar_prs_gorev;
       public         postgres    false    7                       0    0    TABLE ayar_prs_gorev    COMMENT     R   COMMENT ON TABLE public.ayar_prs_gorev IS 'Personelin şirket içindeki görevi';
            public       postgres    false    289            "           1259    45809    ayar_prs_gorev_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.ayar_prs_gorev_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.ayar_prs_gorev_id_seq;
       public       postgres    false    289    7                       0    0    ayar_prs_gorev_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.ayar_prs_gorev_id_seq OWNED BY public.ayar_prs_gorev.id;
            public       postgres    false    290            #           1259    45811    ayar_prs_izin_tipi    TABLE     r   CREATE TABLE public.ayar_prs_izin_tipi (
    id integer NOT NULL,
    izin_tipi character varying(32) NOT NULL
);
 &   DROP TABLE public.ayar_prs_izin_tipi;
       public         postgres    false    7            $           1259    45814    ayar_prs_izin_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_izin_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.ayar_prs_izin_tipi_id_seq;
       public       postgres    false    7    291                       0    0    ayar_prs_izin_tipi_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.ayar_prs_izin_tipi_id_seq OWNED BY public.ayar_prs_izin_tipi.id;
            public       postgres    false    292            %           1259    45816    ayar_prs_kan_grubu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_kan_grubu_id_seq
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.ayar_prs_kan_grubu_id_seq;
       public       postgres    false    7                       0    0 "   SEQUENCE ayar_prs_kan_grubu_id_seq    ACL       REVOKE ALL ON SEQUENCE public.ayar_prs_kan_grubu_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_prs_kan_grubu_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_prs_kan_grubu_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_prs_kan_grubu_id_seq TO PUBLIC;
            public       postgres    false    293            &           1259    45818    ayar_prs_medeni_durum    TABLE     �   CREATE TABLE public.ayar_prs_medeni_durum (
    id integer NOT NULL,
    medeni_durum character varying(32) NOT NULL,
    is_married boolean DEFAULT false NOT NULL
);
 )   DROP TABLE public.ayar_prs_medeni_durum;
       public         postgres    false    7            '           1259    45822    ayar_prs_medeni_durum_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_medeni_durum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.ayar_prs_medeni_durum_id_seq;
       public       postgres    false    294    7                       0    0    ayar_prs_medeni_durum_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.ayar_prs_medeni_durum_id_seq OWNED BY public.ayar_prs_medeni_durum.id;
            public       postgres    false    295            (           1259    45824    ayar_prs_mektup_tipi    TABLE     v   CREATE TABLE public.ayar_prs_mektup_tipi (
    id integer NOT NULL,
    mektup_tipi character varying(32) NOT NULL
);
 (   DROP TABLE public.ayar_prs_mektup_tipi;
       public         postgres    false    7            )           1259    45827    ayar_prs_mektup_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_mektup_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.ayar_prs_mektup_tipi_id_seq;
       public       postgres    false    296    7                       0    0    ayar_prs_mektup_tipi_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.ayar_prs_mektup_tipi_id_seq OWNED BY public.ayar_prs_mektup_tipi.id;
            public       postgres    false    297            *           1259    45829    ayar_prs_myk_tipi    TABLE     p   CREATE TABLE public.ayar_prs_myk_tipi (
    id integer NOT NULL,
    myk_tipi character varying(32) NOT NULL
);
 %   DROP TABLE public.ayar_prs_myk_tipi;
       public         postgres    false    7            +           1259    45832    ayar_prs_myk_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_myk_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.ayar_prs_myk_tipi_id_seq;
       public       postgres    false    298    7                       0    0    ayar_prs_myk_tipi_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.ayar_prs_myk_tipi_id_seq OWNED BY public.ayar_prs_myk_tipi.id;
            public       postgres    false    299            ,           1259    45834    ayar_prs_personel_tipi    TABLE     �   CREATE TABLE public.ayar_prs_personel_tipi (
    id integer NOT NULL,
    personel_tipi character varying(32) NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);
 *   DROP TABLE public.ayar_prs_personel_tipi;
       public         postgres    false    7                       0    0    TABLE ayar_prs_personel_tipi    COMMENT     ^   COMMENT ON TABLE public.ayar_prs_personel_tipi IS 'Personelin tipi (Beyaz Yaka - Mavi Yaka)';
            public       postgres    false    300            -           1259    45838    ayar_prs_personel_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_personel_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.ayar_prs_personel_tipi_id_seq;
       public       postgres    false    300    7                       0    0    ayar_prs_personel_tipi_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.ayar_prs_personel_tipi_id_seq OWNED BY public.ayar_prs_personel_tipi.id;
            public       postgres    false    301            .           1259    45840    ayar_prs_rapor_tipi    TABLE     t   CREATE TABLE public.ayar_prs_rapor_tipi (
    id integer NOT NULL,
    rapor_tipi character varying(32) NOT NULL
);
 '   DROP TABLE public.ayar_prs_rapor_tipi;
       public         postgres    false    7            /           1259    45843    ayar_prs_rapor_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_rapor_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.ayar_prs_rapor_tipi_id_seq;
       public       postgres    false    302    7                       0    0    ayar_prs_rapor_tipi_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.ayar_prs_rapor_tipi_id_seq OWNED BY public.ayar_prs_rapor_tipi.id;
            public       postgres    false    303            0           1259    45845    ayar_prs_src_tipi    TABLE     p   CREATE TABLE public.ayar_prs_src_tipi (
    id integer NOT NULL,
    src_tipi character varying(32) NOT NULL
);
 %   DROP TABLE public.ayar_prs_src_tipi;
       public         postgres    false    7            1           1259    45848    ayar_prs_src_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_src_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.ayar_prs_src_tipi_id_seq;
       public       postgres    false    7    304                       0    0    ayar_prs_src_tipi_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.ayar_prs_src_tipi_id_seq OWNED BY public.ayar_prs_src_tipi.id;
            public       postgres    false    305            2           1259    45850    ayar_prs_tatil_tipi    TABLE     �   CREATE TABLE public.ayar_prs_tatil_tipi (
    id integer NOT NULL,
    tatil_tipi character varying(32) NOT NULL,
    is_resmi_tatil boolean DEFAULT true NOT NULL
);
 '   DROP TABLE public.ayar_prs_tatil_tipi;
       public         postgres    false    7            3           1259    45854    ayar_prs_tatil_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_tatil_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.ayar_prs_tatil_tipi_id_seq;
       public       postgres    false    306    7                       0    0    ayar_prs_tatil_tipi_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.ayar_prs_tatil_tipi_id_seq OWNED BY public.ayar_prs_tatil_tipi.id;
            public       postgres    false    307            4           1259    45856    ayar_prs_yabanci_dil    TABLE     v   CREATE TABLE public.ayar_prs_yabanci_dil (
    id integer NOT NULL,
    yabanci_dil character varying(16) NOT NULL
);
 (   DROP TABLE public.ayar_prs_yabanci_dil;
       public         postgres    false    7            5           1259    45859    ayar_prs_yabanci_dil_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_yabanci_dil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.ayar_prs_yabanci_dil_id_seq;
       public       postgres    false    7    308                       0    0    ayar_prs_yabanci_dil_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.ayar_prs_yabanci_dil_id_seq OWNED BY public.ayar_prs_yabanci_dil.id;
            public       postgres    false    309            6           1259    45861    ayar_prs_yabanci_dil_seviyesi    TABLE     �   CREATE TABLE public.ayar_prs_yabanci_dil_seviyesi (
    id integer NOT NULL,
    yabanci_dil_seviyesi character varying(16) NOT NULL
);
 1   DROP TABLE public.ayar_prs_yabanci_dil_seviyesi;
       public         postgres    false    7            7           1259    45864 $   ayar_prs_yabanci_dil_seviyesi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_prs_yabanci_dil_seviyesi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.ayar_prs_yabanci_dil_seviyesi_id_seq;
       public       postgres    false    310    7                        0    0 $   ayar_prs_yabanci_dil_seviyesi_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.ayar_prs_yabanci_dil_seviyesi_id_seq OWNED BY public.ayar_prs_yabanci_dil_seviyesi.id;
            public       postgres    false    311            8           1259    45866    ayar_sabit_degisken    TABLE     o   CREATE TABLE public.ayar_sabit_degisken (
    id integer NOT NULL,
    deger character varying(16) NOT NULL
);
 '   DROP TABLE public.ayar_sabit_degisken;
       public         postgres    false    7            !           0    0    TABLE ayar_sabit_degisken    ACL     �   REVOKE ALL ON TABLE public.ayar_sabit_degisken FROM PUBLIC;
REVOKE ALL ON TABLE public.ayar_sabit_degisken FROM postgres;
GRANT ALL ON TABLE public.ayar_sabit_degisken TO postgres;
            public       postgres    false    312            9           1259    45869    ayar_sabit_degisken_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_sabit_degisken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.ayar_sabit_degisken_id_seq;
       public       postgres    false    312    7            "           0    0    ayar_sabit_degisken_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.ayar_sabit_degisken_id_seq OWNED BY public.ayar_sabit_degisken.id;
            public       postgres    false    313            #           0    0 #   SEQUENCE ayar_sabit_degisken_id_seq    ACL       REVOKE ALL ON SEQUENCE public.ayar_sabit_degisken_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_sabit_degisken_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_sabit_degisken_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_sabit_degisken_id_seq TO PUBLIC;
            public       postgres    false    313            :           1259    45871    ayar_sevkiyat_hazirlama_durumu    TABLE     z   CREATE TABLE public.ayar_sevkiyat_hazirlama_durumu (
    id integer NOT NULL,
    deger character varying(32) NOT NULL
);
 2   DROP TABLE public.ayar_sevkiyat_hazirlama_durumu;
       public         postgres    false    7            ;           1259    45874 %   ayar_sevkiyat_hazirlama_durumu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_sevkiyat_hazirlama_durumu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.ayar_sevkiyat_hazirlama_durumu_id_seq;
       public       postgres    false    314    7            $           0    0 %   ayar_sevkiyat_hazirlama_durumu_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.ayar_sevkiyat_hazirlama_durumu_id_seq OWNED BY public.ayar_sevkiyat_hazirlama_durumu.id;
            public       postgres    false    315            %           0    0 .   SEQUENCE ayar_sevkiyat_hazirlama_durumu_id_seq    ACL     B  REVOKE ALL ON SEQUENCE public.ayar_sevkiyat_hazirlama_durumu_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_sevkiyat_hazirlama_durumu_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_sevkiyat_hazirlama_durumu_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_sevkiyat_hazirlama_durumu_id_seq TO PUBLIC;
            public       postgres    false    315            �           1259    47416    ayar_stk_cins_ailesi    TABLE     o   CREATE TABLE public.ayar_stk_cins_ailesi (
    id integer NOT NULL,
    aile character varying(16) NOT NULL
);
 (   DROP TABLE public.ayar_stk_cins_ailesi;
       public         postgres    false    7            �           1259    47414    ayar_stk_cins_ailesi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_stk_cins_ailesi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.ayar_stk_cins_ailesi_id_seq;
       public       postgres    false    446    7            &           0    0    ayar_stk_cins_ailesi_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.ayar_stk_cins_ailesi_id_seq OWNED BY public.ayar_stk_cins_ailesi.id;
            public       postgres    false    445            �           1259    47498    ayar_stk_cins_ozelligi    TABLE     i  CREATE TABLE public.ayar_stk_cins_ozelligi (
    id integer NOT NULL,
    ayar_stk_cins_aile_id integer NOT NULL,
    cins character varying(32) NOT NULL,
    aciklama character varying(128),
    string1 character varying(24),
    string2 character varying(24),
    string3 character varying(24),
    string4 character varying(24),
    string5 character varying(24),
    string6 character varying(24),
    string7 character varying(24),
    string8 character varying(24),
    string9 character varying(24),
    string10 character varying(16),
    string11 character varying(16),
    string12 character varying(16)
);
 *   DROP TABLE public.ayar_stk_cins_ozelligi;
       public         postgres    false    7            �           1259    47496    ayar_stk_cins_ozelligi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_stk_cins_ozelligi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.ayar_stk_cins_ozelligi_id_seq;
       public       postgres    false    7    450            '           0    0    ayar_stk_cins_ozelligi_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.ayar_stk_cins_ozelligi_id_seq OWNED BY public.ayar_stk_cins_ozelligi.id;
            public       postgres    false    449            �           1259    47378    ayar_stk_hareket_ayari    TABLE     �   CREATE TABLE public.ayar_stk_hareket_ayari (
    id integer NOT NULL,
    giris_ayari character varying(16),
    cikis_ayari character varying(16)
);
 *   DROP TABLE public.ayar_stk_hareket_ayari;
       public         postgres    false    7            �           1259    47376    ayar_stk_hareket_ayari_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_stk_hareket_ayari_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.ayar_stk_hareket_ayari_id_seq;
       public       postgres    false    7    442            (           0    0    ayar_stk_hareket_ayari_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.ayar_stk_hareket_ayari_id_seq OWNED BY public.ayar_stk_hareket_ayari.id;
            public       postgres    false    441            �           1259    47364    ayar_stk_hareket_tipi    TABLE     �   CREATE TABLE public.ayar_stk_hareket_tipi (
    id integer NOT NULL,
    deger character varying(8) NOT NULL,
    is_input boolean DEFAULT false NOT NULL
);
 )   DROP TABLE public.ayar_stk_hareket_tipi;
       public         postgres    false    7            �           1259    47362    ayar_stk_hareket_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_stk_hareket_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.ayar_stk_hareket_tipi_id_seq;
       public       postgres    false    7    440            )           0    0    ayar_stk_hareket_tipi_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.ayar_stk_hareket_tipi_id_seq OWNED BY public.ayar_stk_hareket_tipi.id;
            public       postgres    false    439            �           1259    47530    ayar_stk_stok_grubu    TABLE     �  CREATE TABLE public.ayar_stk_stok_grubu (
    id integer NOT NULL,
    ayar_stk_stok_grubu_turu_id integer,
    grup character varying(32) NOT NULL,
    alis_hesabi character varying(16),
    alis_iade_hesabi character varying(16),
    satis_hesabi character varying(16),
    satis_iade_hesabi character varying(16),
    ihracat_hesabi character varying(16),
    hammadde_hesabi character varying(16),
    mamul_hesabi character varying(16),
    kdv_orani integer NOT NULL,
    is_iskonto_aktif boolean DEFAULT false NOT NULL,
    iskonto_satis double precision DEFAULT 0 NOT NULL,
    iskonto_mudur double precision DEFAULT 0 NOT NULL,
    is_satis_fiyatini_kullan boolean DEFAULT false NOT NULL,
    is_maliyet_analiz_farkli_db boolean DEFAULT false NOT NULL
);
 '   DROP TABLE public.ayar_stk_stok_grubu;
       public         postgres    false    7            �           1259    47528    ayar_stk_stok_grubu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_stk_stok_grubu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.ayar_stk_stok_grubu_id_seq;
       public       postgres    false    452    7            *           0    0    ayar_stk_stok_grubu_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.ayar_stk_stok_grubu_id_seq OWNED BY public.ayar_stk_stok_grubu.id;
            public       postgres    false    451            �           1259    47477    ayar_stk_stok_grubu_turu    TABLE     }   CREATE TABLE public.ayar_stk_stok_grubu_turu (
    id integer NOT NULL,
    stok_grubu_tur character varying(32) NOT NULL
);
 ,   DROP TABLE public.ayar_stk_stok_grubu_turu;
       public         postgres    false    7            �           1259    47475    ayar_stk_stok_grubu_turu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_stk_stok_grubu_turu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.ayar_stk_stok_grubu_turu_id_seq;
       public       postgres    false    448    7            +           0    0    ayar_stk_stok_grubu_turu_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.ayar_stk_stok_grubu_turu_id_seq OWNED BY public.ayar_stk_stok_grubu_turu.id;
            public       postgres    false    447            �           1259    47397    ayar_stk_stok_tipi    TABLE     �   CREATE TABLE public.ayar_stk_stok_tipi (
    id integer NOT NULL,
    tip character varying(16) NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    is_stok_hareketi_yap boolean DEFAULT false NOT NULL
);
 &   DROP TABLE public.ayar_stk_stok_tipi;
       public         postgres    false    7            ,           0    0    TABLE ayar_stk_stok_tipi    ACL     �   REVOKE ALL ON TABLE public.ayar_stk_stok_tipi FROM PUBLIC;
REVOKE ALL ON TABLE public.ayar_stk_stok_tipi FROM postgres;
GRANT ALL ON TABLE public.ayar_stk_stok_tipi TO postgres;
            public       postgres    false    444            �           1259    47395    ayar_stk_stok_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_stk_stok_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.ayar_stk_stok_tipi_id_seq;
       public       postgres    false    444    7            -           0    0    ayar_stk_stok_tipi_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.ayar_stk_stok_tipi_id_seq OWNED BY public.ayar_stk_stok_tipi.id;
            public       postgres    false    443            �           1259    47545    ayar_stk_urun_tipi    TABLE     l   CREATE TABLE public.ayar_stk_urun_tipi (
    id integer NOT NULL,
    tip character varying(16) NOT NULL
);
 &   DROP TABLE public.ayar_stk_urun_tipi;
       public         postgres    false    7            .           0    0    TABLE ayar_stk_urun_tipi    ACL     �   REVOKE ALL ON TABLE public.ayar_stk_urun_tipi FROM PUBLIC;
REVOKE ALL ON TABLE public.ayar_stk_urun_tipi FROM postgres;
GRANT ALL ON TABLE public.ayar_stk_urun_tipi TO postgres;
            public       postgres    false    454            �           1259    47543    ayar_stk_urun_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_stk_urun_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.ayar_stk_urun_tipi_id_seq;
       public       postgres    false    454    7            /           0    0    ayar_stk_urun_tipi_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.ayar_stk_urun_tipi_id_seq OWNED BY public.ayar_stk_urun_tipi.id;
            public       postgres    false    453            <           1259    45887    ayar_teklif_durum    TABLE     �   CREATE TABLE public.ayar_teklif_durum (
    id integer NOT NULL,
    deger character varying(32) NOT NULL,
    aciklama character varying(64),
    is_active boolean DEFAULT true NOT NULL
);
 %   DROP TABLE public.ayar_teklif_durum;
       public         postgres    false    7            =           1259    45891    ayar_teklif_durum_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_teklif_durum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.ayar_teklif_durum_id_seq;
       public       postgres    false    316    7            0           0    0    ayar_teklif_durum_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.ayar_teklif_durum_id_seq OWNED BY public.ayar_teklif_durum.id;
            public       postgres    false    317            1           0    0 !   SEQUENCE ayar_teklif_durum_id_seq    ACL       REVOKE ALL ON SEQUENCE public.ayar_teklif_durum_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_teklif_durum_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_teklif_durum_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_teklif_durum_id_seq TO PUBLIC;
            public       postgres    false    317            >           1259    45893    ayar_teklif_tipi    TABLE     �   CREATE TABLE public.ayar_teklif_tipi (
    id integer NOT NULL,
    deger character varying(32) NOT NULL,
    aciklama character varying(64),
    is_active boolean DEFAULT true NOT NULL
);
 $   DROP TABLE public.ayar_teklif_tipi;
       public         postgres    false    7            ?           1259    45897    ayar_teklif_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_teklif_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.ayar_teklif_tipi_id_seq;
       public       postgres    false    7    318            2           0    0    ayar_teklif_tipi_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.ayar_teklif_tipi_id_seq OWNED BY public.ayar_teklif_tipi.id;
            public       postgres    false    319            3           0    0     SEQUENCE ayar_teklif_tipi_id_seq    ACL     
  REVOKE ALL ON SEQUENCE public.ayar_teklif_tipi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_teklif_tipi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_teklif_tipi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_teklif_tipi_id_seq TO PUBLIC;
            public       postgres    false    319            @           1259    45899    ayar_vergi_orani    TABLE     =  CREATE TABLE public.ayar_vergi_orani (
    id integer NOT NULL,
    vergi_orani double precision NOT NULL,
    satis_vergi_hesap_kodu character varying(32),
    satis_iade_vergi_hesap_kodu character varying(32),
    alis_vergi_hesap_kodu character varying(32),
    alis_iade_vergi_hesap_kodu character varying(32)
);
 $   DROP TABLE public.ayar_vergi_orani;
       public         postgres    false    7            A           1259    45902    ayar_vergi_orani_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ayar_vergi_orani_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.ayar_vergi_orani_id_seq;
       public       postgres    false    320    7            4           0    0    ayar_vergi_orani_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.ayar_vergi_orani_id_seq OWNED BY public.ayar_vergi_orani.id;
            public       postgres    false    321            5           0    0     SEQUENCE ayar_vergi_orani_id_seq    ACL     
  REVOKE ALL ON SEQUENCE public.ayar_vergi_orani_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ayar_vergi_orani_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.ayar_vergi_orani_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.ayar_vergi_orani_id_seq TO PUBLIC;
            public       postgres    false    321            B           1259    45904    banka    TABLE     �   CREATE TABLE public.banka (
    id integer NOT NULL,
    adi character varying(64) NOT NULL,
    swift_kodu character varying(16),
    is_active boolean DEFAULT true NOT NULL
);
    DROP TABLE public.banka;
       public         postgres    false    7            C           1259    45908    banka_id_seq    SEQUENCE     u   CREATE SEQUENCE public.banka_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.banka_id_seq;
       public       postgres    false    7    322            6           0    0    banka_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.banka_id_seq OWNED BY public.banka.id;
            public       postgres    false    323            7           0    0    SEQUENCE banka_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.banka_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.banka_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.banka_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.banka_id_seq TO PUBLIC;
            public       postgres    false    323            D           1259    45910    banka_subesi    TABLE     �   CREATE TABLE public.banka_subesi (
    id integer NOT NULL,
    banka_id integer NOT NULL,
    sube_kodu integer NOT NULL,
    sube_adi character varying(64) NOT NULL,
    sube_il_id integer NOT NULL
);
     DROP TABLE public.banka_subesi;
       public         postgres    false    7            E           1259    45913    banka_subesi_id_seq    SEQUENCE     |   CREATE SEQUENCE public.banka_subesi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.banka_subesi_id_seq;
       public       postgres    false    7    324            8           0    0    banka_subesi_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.banka_subesi_id_seq OWNED BY public.banka_subesi.id;
            public       postgres    false    325            9           0    0    SEQUENCE banka_subesi_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.banka_subesi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.banka_subesi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.banka_subesi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.banka_subesi_id_seq TO PUBLIC;
            public       postgres    false    325            F           1259    45915    barkod_hazirlik_dosya_turu    TABLE     k   CREATE TABLE public.barkod_hazirlik_dosya_turu (
    id integer NOT NULL,
    tur character varying(32)
);
 .   DROP TABLE public.barkod_hazirlik_dosya_turu;
       public         postgres    false    7            G           1259    45918 !   barkod_hazirlik_dosya_turu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.barkod_hazirlik_dosya_turu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.barkod_hazirlik_dosya_turu_id_seq;
       public       postgres    false    326    7            :           0    0 !   barkod_hazirlik_dosya_turu_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.barkod_hazirlik_dosya_turu_id_seq OWNED BY public.barkod_hazirlik_dosya_turu.id;
            public       postgres    false    327            ;           0    0 *   SEQUENCE barkod_hazirlik_dosya_turu_id_seq    ACL     2  REVOKE ALL ON SEQUENCE public.barkod_hazirlik_dosya_turu_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.barkod_hazirlik_dosya_turu_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.barkod_hazirlik_dosya_turu_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.barkod_hazirlik_dosya_turu_id_seq TO PUBLIC;
            public       postgres    false    327            H           1259    45920    barkod_serino_turu    TABLE     �   CREATE TABLE public.barkod_serino_turu (
    id integer NOT NULL,
    tur character varying(4),
    aciklama character varying(32)
);
 &   DROP TABLE public.barkod_serino_turu;
       public         postgres    false    7            I           1259    45923    barkod_serino_turu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.barkod_serino_turu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.barkod_serino_turu_id_seq;
       public       postgres    false    328    7            <           0    0    barkod_serino_turu_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.barkod_serino_turu_id_seq OWNED BY public.barkod_serino_turu.id;
            public       postgres    false    329            =           0    0 "   SEQUENCE barkod_serino_turu_id_seq    ACL       REVOKE ALL ON SEQUENCE public.barkod_serino_turu_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.barkod_serino_turu_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.barkod_serino_turu_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.barkod_serino_turu_id_seq TO PUBLIC;
            public       postgres    false    329            J           1259    45925    barkod_tezgah    TABLE     �   CREATE TABLE public.barkod_tezgah (
    id integer NOT NULL,
    tezgah_adi character varying(32) NOT NULL,
    ambar_id integer NOT NULL
);
 !   DROP TABLE public.barkod_tezgah;
       public         postgres    false    7            K           1259    45928    barkod_tezgah_id_seq    SEQUENCE     }   CREATE SEQUENCE public.barkod_tezgah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.barkod_tezgah_id_seq;
       public       postgres    false    7    330            >           0    0    barkod_tezgah_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.barkod_tezgah_id_seq OWNED BY public.barkod_tezgah.id;
            public       postgres    false    331            ?           0    0    SEQUENCE barkod_tezgah_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.barkod_tezgah_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.barkod_tezgah_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.barkod_tezgah_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.barkod_tezgah_id_seq TO PUBLIC;
            public       postgres    false    331            L           1259    45930    bb_kayitlar    TABLE     �  CREATE TABLE public.bb_kayitlar (
    id integer NOT NULL,
    firma_adi character varying(96),
    tel1 character varying(24),
    tel2 character varying(24),
    tel3 character varying(24),
    fax character varying(24),
    email character varying(80),
    web character varying(48),
    yetkili1 character varying(64),
    yetkili1_tel character varying(24),
    yetkili1_email character varying(80),
    yetkili2 character varying(64),
    yetkili2_tel character varying(24),
    yetkili2_email character varying(80),
    merkez_adres character varying(160),
    merkez_semt character varying(32),
    merkez_il character varying(32),
    sube_adres character varying(160),
    sube_semt character varying(32),
    sube_il character varying(32),
    not1 character varying(384),
    not2 character varying(384),
    not3 character varying(384),
    firma_tipi character varying(32),
    calisma_durumu character varying(16),
    kac_yillik_firma character varying(10),
    vergi_numarasi character varying(24),
    vergi_dairesi character varying(48),
    yillik_asansor_sayisi smallint,
    ziyaret_edilmesin boolean DEFAULT false NOT NULL,
    calisma_durumu_aybey character varying(16),
    calisma_durumu_bulut character varying(16),
    calistigi_tedarikciler character varying(96),
    finans_durumu character varying(32),
    sevkiyat_yetkilisi character varying(48),
    sevkiyat_yetkilisi_tel character varying(24),
    fuar_id integer
);
    DROP TABLE public.bb_kayitlar;
       public         postgres    false    7            M           1259    45937    bb_kayitlar_id_seq    SEQUENCE     {   CREATE SEQUENCE public.bb_kayitlar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.bb_kayitlar_id_seq;
       public       postgres    false    332    7            @           0    0    bb_kayitlar_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.bb_kayitlar_id_seq OWNED BY public.bb_kayitlar.id;
            public       postgres    false    333            N           1259    45939    bolge    TABLE       CREATE TABLE public.bolge (
    id integer NOT NULL,
    bolge_adi character varying(24) NOT NULL,
    bolge_turu_id integer,
    hedef_ocak double precision DEFAULT 0 NOT NULL,
    hedef_subat double precision DEFAULT 0 NOT NULL,
    hedef_mart double precision DEFAULT 0 NOT NULL,
    hedef_nisan double precision DEFAULT 0 NOT NULL,
    hedef_mayis double precision DEFAULT 0 NOT NULL,
    hedef_haziran double precision DEFAULT 0 NOT NULL,
    hedef_temmuz double precision DEFAULT 0 NOT NULL,
    hedef_agustos double precision DEFAULT 0 NOT NULL,
    hedef_eylul double precision DEFAULT 0 NOT NULL,
    hedef_ekim double precision DEFAULT 0 NOT NULL,
    hedef_kasim double precision DEFAULT 0 NOT NULL,
    hedef_aralik double precision DEFAULT 0 NOT NULL,
    hedef_mamul_ocak double precision DEFAULT 0 NOT NULL,
    hedef_mamul_subat double precision DEFAULT 0 NOT NULL,
    hedef_mamul_mart double precision DEFAULT 0 NOT NULL,
    hedef_mamul_nisan double precision DEFAULT 0 NOT NULL,
    hedef_mamul_mayis double precision DEFAULT 0 NOT NULL,
    hedef_mamul_haziran double precision DEFAULT 0 NOT NULL,
    hedef_mamul_temmuz double precision DEFAULT 0 NOT NULL,
    hedef_mamul_agustos double precision DEFAULT 0 NOT NULL,
    hedef_mamul_eylul double precision DEFAULT 0 NOT NULL,
    hedef_mamul_ekim double precision DEFAULT 0 NOT NULL,
    hedef_mamul_kasim double precision DEFAULT 0 NOT NULL,
    hedef_mamul_aralik double precision DEFAULT 0 NOT NULL,
    gecen_ocak double precision DEFAULT 0 NOT NULL,
    gecen_subat double precision DEFAULT 0 NOT NULL,
    gecen_mart double precision DEFAULT 0 NOT NULL,
    gecen_nisan double precision DEFAULT 0 NOT NULL,
    gecen_mayis double precision DEFAULT 0 NOT NULL,
    gecen_haziran double precision DEFAULT 0 NOT NULL,
    gecen_temmuz double precision DEFAULT 0 NOT NULL,
    gecen_agustos double precision DEFAULT 0 NOT NULL,
    gecen_eylul double precision DEFAULT 0 NOT NULL,
    gecen_ekim double precision DEFAULT 0 NOT NULL,
    gecen_kasim double precision DEFAULT 0 NOT NULL,
    gecen_aralik double precision DEFAULT 0 NOT NULL,
    gecen_mamul_ocak double precision DEFAULT 0 NOT NULL,
    gecen_mamul_subat double precision DEFAULT 0 NOT NULL,
    gecen_mamul_mart double precision DEFAULT 0 NOT NULL,
    gecen_mamul_nisan double precision DEFAULT 0 NOT NULL,
    gecen_mamul_mayis double precision DEFAULT 0 NOT NULL,
    gecen_mamul_haziran double precision DEFAULT 0 NOT NULL,
    gecen_mamul_temmuz double precision DEFAULT 0 NOT NULL,
    gecen_mamul_agustos double precision DEFAULT 0 NOT NULL,
    gecen_mamul_eylul double precision DEFAULT 0 NOT NULL,
    gecen_mamul_ekim double precision DEFAULT 0 NOT NULL,
    gecen_mamul_kasim double precision DEFAULT 0 NOT NULL,
    gecen_mamul_aralik double precision DEFAULT 0 NOT NULL
);
    DROP TABLE public.bolge;
       public         postgres    false    7            O           1259    45990    bolge_id_seq    SEQUENCE     u   CREATE SEQUENCE public.bolge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.bolge_id_seq;
       public       postgres    false    7    334            A           0    0    bolge_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.bolge_id_seq OWNED BY public.bolge.id;
            public       postgres    false    335            P           1259    45992 
   bolge_turu    TABLE     d   CREATE TABLE public.bolge_turu (
    id integer NOT NULL,
    tur character varying(32) NOT NULL
);
    DROP TABLE public.bolge_turu;
       public         postgres    false    7            B           0    0    TABLE bolge_turu    ACL     �   REVOKE ALL ON TABLE public.bolge_turu FROM PUBLIC;
REVOKE ALL ON TABLE public.bolge_turu FROM postgres;
GRANT ALL ON TABLE public.bolge_turu TO postgres;
            public       postgres    false    336            Q           1259    45995    bolge_turu_id_seq    SEQUENCE     z   CREATE SEQUENCE public.bolge_turu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.bolge_turu_id_seq;
       public       postgres    false    7    336            C           0    0    bolge_turu_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.bolge_turu_id_seq OWNED BY public.bolge_turu.id;
            public       postgres    false    337            D           0    0    SEQUENCE bolge_turu_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.bolge_turu_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.bolge_turu_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.bolge_turu_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.bolge_turu_id_seq TO PUBLIC;
            public       postgres    false    337            R           1259    45997 
   doviz_kuru    TABLE     �   CREATE TABLE public.doviz_kuru (
    id integer NOT NULL,
    tarih date NOT NULL,
    para_birimi character varying(3) NOT NULL,
    kur numeric(10,4) NOT NULL
);
    DROP TABLE public.doviz_kuru;
       public         postgres    false    7            S           1259    46000    doviz_kuru_id_seq    SEQUENCE     z   CREATE SEQUENCE public.doviz_kuru_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.doviz_kuru_id_seq;
       public       postgres    false    338    7            E           0    0    doviz_kuru_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.doviz_kuru_id_seq OWNED BY public.doviz_kuru.id;
            public       postgres    false    339            F           0    0    SEQUENCE doviz_kuru_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.doviz_kuru_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.doviz_kuru_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.doviz_kuru_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.doviz_kuru_id_seq TO PUBLIC;
            public       postgres    false    339            T           1259    46002    hesap_grubu    TABLE     f   CREATE TABLE public.hesap_grubu (
    id integer NOT NULL,
    grup character varying(16) NOT NULL
);
    DROP TABLE public.hesap_grubu;
       public         postgres    false    7            G           0    0    TABLE hesap_grubu    ACL     �   REVOKE ALL ON TABLE public.hesap_grubu FROM PUBLIC;
REVOKE ALL ON TABLE public.hesap_grubu FROM postgres;
GRANT ALL ON TABLE public.hesap_grubu TO postgres;
            public       postgres    false    340            U           1259    46005    hesap_grubu_id_seq    SEQUENCE     {   CREATE SEQUENCE public.hesap_grubu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hesap_grubu_id_seq;
       public       postgres    false    340    7            H           0    0    hesap_grubu_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.hesap_grubu_id_seq OWNED BY public.hesap_grubu.id;
            public       postgres    false    341            I           0    0    SEQUENCE hesap_grubu_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.hesap_grubu_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.hesap_grubu_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.hesap_grubu_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.hesap_grubu_id_seq TO PUBLIC;
            public       postgres    false    341            V           1259    46007    hesap_karti    TABLE     �  CREATE TABLE public.hesap_karti (
    id integer NOT NULL,
    hesap_kodu character varying(32) NOT NULL,
    hesap_ismi character varying(128) NOT NULL,
    muhasebe_kodu character varying(32),
    hesap_tipi_id integer NOT NULL,
    hesap_grubu_id integer NOT NULL,
    bolge_id integer,
    musteri_temsilci_grubu_id integer,
    mukellef_tipi_id integer,
    musteri_temsilcisi_id integer,
    adres_id integer,
    mukellef_adi character varying(32),
    mukellef_ikinci_adi character varying(32),
    mukellef_soyadi character varying(32),
    vergi_dairesi character varying(64),
    vergi_no character varying(32),
    para_birimi character varying(3),
    iban character varying(64),
    iban_para character varying(3),
    nace_kodu character varying(32),
    is_efatura_hesabi boolean DEFAULT false NOT NULL,
    efatura_pk_name character varying(64),
    yetkili1 character varying(64),
    yetkili1_tel character varying(32),
    yetkili2 character varying(64),
    yetkili2_tel character varying(32),
    yetkili3 character varying(64),
    yetkili3_tel character varying(32),
    faks character varying(32),
    muhasebe_telefon character varying(32),
    muhasebe_eposta character varying(128),
    muhasebe_yetkili character varying(32),
    ozel_bilgi character varying(512),
    odeme_vade_gun_sayisi integer,
    is_acik_hesap boolean DEFAULT false NOT NULL,
    kredi_limiti double precision,
    hesap_iskonto double precision,
    kok_hesap_kodu character varying(3),
    ara_hesap_kodu character varying(3)
);
    DROP TABLE public.hesap_karti;
       public         postgres    false    7            W           1259    46015    hesap_karti_id_seq    SEQUENCE     {   CREATE SEQUENCE public.hesap_karti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hesap_karti_id_seq;
       public       postgres    false    7    342            J           0    0    hesap_karti_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.hesap_karti_id_seq OWNED BY public.hesap_karti.id;
            public       postgres    false    343            X           1259    46017    hesap_plani    TABLE     �   CREATE TABLE public.hesap_plani (
    id integer NOT NULL,
    tek_duzen_kodu character varying(16) NOT NULL,
    aciklama character varying(128),
    plan_kodu character varying(16),
    seviye_sayisi smallint
);
    DROP TABLE public.hesap_plani;
       public         postgres    false    7            Y           1259    46020    hesap_plani_id_seq    SEQUENCE     {   CREATE SEQUENCE public.hesap_plani_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hesap_plani_id_seq;
       public       postgres    false    7    344            K           0    0    hesap_plani_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.hesap_plani_id_seq OWNED BY public.hesap_plani.id;
            public       postgres    false    345            Z           1259    46022    medeni_durum    TABLE     h   CREATE TABLE public.medeni_durum (
    id integer NOT NULL,
    durum character varying(16) NOT NULL
);
     DROP TABLE public.medeni_durum;
       public         postgres    false    7            L           0    0    TABLE medeni_durum    COMMENT     F   COMMENT ON TABLE public.medeni_durum IS 'Medeni Durumu (Evli-Bekar)';
            public       postgres    false    346            [           1259    46025    medeni_durum_id_seq    SEQUENCE     |   CREATE SEQUENCE public.medeni_durum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.medeni_durum_id_seq;
       public       postgres    false    7    346            M           0    0    medeni_durum_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.medeni_durum_id_seq OWNED BY public.medeni_durum.id;
            public       postgres    false    347            N           0    0    SEQUENCE medeni_durum_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.medeni_durum_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.medeni_durum_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.medeni_durum_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.medeni_durum_id_seq TO PUBLIC;
            public       postgres    false    347            \           1259    46027    muhasebe_hesap_plani    TABLE       CREATE TABLE public.muhasebe_hesap_plani (
    id integer NOT NULL,
    tek_duzen_kodu character varying(3) NOT NULL,
    plan_kodu character varying(3),
    aciklama character varying(128) NOT NULL,
    seviye_sayisi smallint,
    is_active boolean DEFAULT true NOT NULL
);
 (   DROP TABLE public.muhasebe_hesap_plani;
       public         postgres    false    7            O           0    0    TABLE muhasebe_hesap_plani    ACL     �   REVOKE ALL ON TABLE public.muhasebe_hesap_plani FROM PUBLIC;
REVOKE ALL ON TABLE public.muhasebe_hesap_plani FROM postgres;
GRANT ALL ON TABLE public.muhasebe_hesap_plani TO postgres;
            public       postgres    false    348            ]           1259    46031    muhasebe_hesap_plani_id_seq    SEQUENCE     �   CREATE SEQUENCE public.muhasebe_hesap_plani_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.muhasebe_hesap_plani_id_seq;
       public       postgres    false    7    348            P           0    0    muhasebe_hesap_plani_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.muhasebe_hesap_plani_id_seq OWNED BY public.muhasebe_hesap_plani.id;
            public       postgres    false    349            Q           0    0 $   SEQUENCE muhasebe_hesap_plani_id_seq    ACL       REVOKE ALL ON SEQUENCE public.muhasebe_hesap_plani_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.muhasebe_hesap_plani_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.muhasebe_hesap_plani_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.muhasebe_hesap_plani_id_seq TO PUBLIC;
            public       postgres    false    349            ^           1259    46033    musteri_temsilci_grubu    TABLE     �  CREATE TABLE public.musteri_temsilci_grubu (
    id integer NOT NULL,
    temsilci_grup_adi character varying(32) NOT NULL,
    gecmis_ocak double precision DEFAULT 0 NOT NULL,
    gecmis_subat double precision DEFAULT 0 NOT NULL,
    gecmis_mart double precision DEFAULT 0 NOT NULL,
    gecmis_nisan double precision DEFAULT 0 NOT NULL,
    gecmis_mayis double precision DEFAULT 0 NOT NULL,
    gecmis_haziran double precision DEFAULT 0 NOT NULL,
    gecmis_temmuz double precision DEFAULT 0 NOT NULL,
    gecmis_agustos double precision DEFAULT 0 NOT NULL,
    gecmis_eylul double precision DEFAULT 0 NOT NULL,
    gecmis_ekim double precision DEFAULT 0 NOT NULL,
    gecmis_kasim double precision DEFAULT 0 NOT NULL,
    gecmis_aralik double precision DEFAULT 0 NOT NULL,
    hedef_ocak double precision DEFAULT 0 NOT NULL,
    hedef_subat double precision DEFAULT 0 NOT NULL,
    hedef_mart double precision DEFAULT 0 NOT NULL,
    hedef_nisan double precision DEFAULT 0 NOT NULL,
    hedef_mayis double precision DEFAULT 0 NOT NULL,
    hedef_haziran double precision DEFAULT 0 NOT NULL,
    hedef_temmuz double precision DEFAULT 0 NOT NULL,
    hedef_agustos double precision DEFAULT 0 NOT NULL,
    hedef_eylul double precision DEFAULT 0 NOT NULL,
    hedef_ekim double precision DEFAULT 0 NOT NULL,
    hedef_kasim double precision DEFAULT 0 NOT NULL,
    hedef_aralik double precision DEFAULT 0 NOT NULL
);
 *   DROP TABLE public.musteri_temsilci_grubu;
       public         postgres    false    7            _           1259    46060    musteri_temsilci_grubu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.musteri_temsilci_grubu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.musteri_temsilci_grubu_id_seq;
       public       postgres    false    7    350            R           0    0    musteri_temsilci_grubu_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.musteri_temsilci_grubu_id_seq OWNED BY public.musteri_temsilci_grubu.id;
            public       postgres    false    351            `           1259    46062    olcu_birimi    TABLE     �   CREATE TABLE public.olcu_birimi (
    id integer NOT NULL,
    birim character varying(16) NOT NULL,
    efatura_birim character varying(3),
    birim_aciklama character varying(64),
    is_float_tip boolean DEFAULT false NOT NULL
);
    DROP TABLE public.olcu_birimi;
       public         postgres    false    7            a           1259    46066    olcu_birimi_id_seq    SEQUENCE     {   CREATE SEQUENCE public.olcu_birimi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.olcu_birimi_id_seq;
       public       postgres    false    352    7            S           0    0    olcu_birimi_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.olcu_birimi_id_seq OWNED BY public.olcu_birimi.id;
            public       postgres    false    353            T           0    0    SEQUENCE olcu_birimi_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.olcu_birimi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.olcu_birimi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.olcu_birimi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.olcu_birimi_id_seq TO PUBLIC;
            public       postgres    false    353            b           1259    46068    para_birimi    TABLE     �   CREATE TABLE public.para_birimi (
    id integer NOT NULL,
    kod character varying(3) NOT NULL,
    sembol character varying(3) NOT NULL,
    aciklama character varying(128),
    is_varsayilan boolean DEFAULT false NOT NULL
);
    DROP TABLE public.para_birimi;
       public         postgres    false    7            U           0    0    TABLE para_birimi    ACL     �   REVOKE ALL ON TABLE public.para_birimi FROM PUBLIC;
REVOKE ALL ON TABLE public.para_birimi FROM postgres;
GRANT ALL ON TABLE public.para_birimi TO postgres;
            public       postgres    false    354            c           1259    46072    para_birimi_id_seq    SEQUENCE     {   CREATE SEQUENCE public.para_birimi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.para_birimi_id_seq;
       public       postgres    false    354    7            V           0    0    para_birimi_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.para_birimi_id_seq OWNED BY public.para_birimi.id;
            public       postgres    false    355            W           0    0    SEQUENCE para_birimi_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.para_birimi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.para_birimi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.para_birimi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.para_birimi_id_seq TO PUBLIC;
            public       postgres    false    355            d           1259    46074    personel_ayrilma_nedeni_tipi    TABLE     m   CREATE TABLE public.personel_ayrilma_nedeni_tipi (
    id integer NOT NULL,
    tip character varying(32)
);
 0   DROP TABLE public.personel_ayrilma_nedeni_tipi;
       public         postgres    false    7            X           0    0 "   TABLE personel_ayrilma_nedeni_tipi    ACL     �   REVOKE ALL ON TABLE public.personel_ayrilma_nedeni_tipi FROM PUBLIC;
REVOKE ALL ON TABLE public.personel_ayrilma_nedeni_tipi FROM postgres;
GRANT ALL ON TABLE public.personel_ayrilma_nedeni_tipi TO postgres;
            public       postgres    false    356            e           1259    46077 #   personel_ayrilma_nedeni_tipi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personel_ayrilma_nedeni_tipi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.personel_ayrilma_nedeni_tipi_id_seq;
       public       postgres    false    7    356            Y           0    0 #   personel_ayrilma_nedeni_tipi_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.personel_ayrilma_nedeni_tipi_id_seq OWNED BY public.personel_ayrilma_nedeni_tipi.id;
            public       postgres    false    357            Z           0    0 ,   SEQUENCE personel_ayrilma_nedeni_tipi_id_seq    ACL     :  REVOKE ALL ON SEQUENCE public.personel_ayrilma_nedeni_tipi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.personel_ayrilma_nedeni_tipi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.personel_ayrilma_nedeni_tipi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.personel_ayrilma_nedeni_tipi_id_seq TO PUBLIC;
            public       postgres    false    357            f           1259    46079    personel_calisma_gecmisi    TABLE     Z  CREATE TABLE public.personel_calisma_gecmisi (
    id integer NOT NULL,
    personel_id integer,
    personel_birim character varying(32),
    personel_gorev character varying(32),
    ise_giris_tarihi date NOT NULL,
    isten_cikis_tarihi date,
    ayrilma_nedeni_tipi character varying(32),
    ayrilma_nedeni_aciklama character varying(80)
);
 ,   DROP TABLE public.personel_calisma_gecmisi;
       public         postgres    false    7            [           0    0    TABLE personel_calisma_gecmisi    ACL     �   REVOKE ALL ON TABLE public.personel_calisma_gecmisi FROM PUBLIC;
REVOKE ALL ON TABLE public.personel_calisma_gecmisi FROM postgres;
GRANT ALL ON TABLE public.personel_calisma_gecmisi TO postgres;
            public       postgres    false    358            g           1259    46082    personel_calisma_gecmisi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personel_calisma_gecmisi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.personel_calisma_gecmisi_id_seq;
       public       postgres    false    358    7            \           0    0    personel_calisma_gecmisi_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.personel_calisma_gecmisi_id_seq OWNED BY public.personel_calisma_gecmisi.id;
            public       postgres    false    359            ]           0    0 (   SEQUENCE personel_calisma_gecmisi_id_seq    ACL     *  REVOKE ALL ON SEQUENCE public.personel_calisma_gecmisi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.personel_calisma_gecmisi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.personel_calisma_gecmisi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.personel_calisma_gecmisi_id_seq TO PUBLIC;
            public       postgres    false    359            h           1259    46084    personel_dil_bilgisi    TABLE     �   CREATE TABLE public.personel_dil_bilgisi (
    id integer NOT NULL,
    dil_id integer,
    okuma_seviyesi_id integer,
    yazma_seviyesi_id integer,
    konusma_seviyesi_id integer,
    personel_id integer
);
 (   DROP TABLE public.personel_dil_bilgisi;
       public         postgres    false    7            i           1259    46087    personel_dil_bilgisi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personel_dil_bilgisi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.personel_dil_bilgisi_id_seq;
       public       postgres    false    7    360            ^           0    0    personel_dil_bilgisi_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.personel_dil_bilgisi_id_seq OWNED BY public.personel_dil_bilgisi.id;
            public       postgres    false    361            _           0    0 $   SEQUENCE personel_dil_bilgisi_id_seq    ACL       REVOKE ALL ON SEQUENCE public.personel_dil_bilgisi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.personel_dil_bilgisi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.personel_dil_bilgisi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.personel_dil_bilgisi_id_seq TO PUBLIC;
            public       postgres    false    361            j           1259    46089    personel_karti    TABLE     1  CREATE TABLE public.personel_karti (
    id integer NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    personel_ad character varying(32) NOT NULL,
    personel_soyad character varying(32) NOT NULL,
    telefon1 character varying(24),
    telefon2 character varying(24),
    personel_tipi_id integer NOT NULL,
    bolum_id integer,
    birim_id integer NOT NULL,
    gorev_id integer NOT NULL,
    mail_adresi character varying(64),
    dogum_tarihi date NOT NULL,
    kan_grubu character varying(8),
    cinsiyet_id integer NOT NULL,
    askerlik_durum_id integer,
    medeni_durum_id integer NOT NULL,
    cocuk_sayisi integer DEFAULT 0,
    yakin_ad_soyad character varying(48),
    yakin_telefon character varying(24),
    ayakkabi_no integer,
    elbise_bedeni character varying(8),
    genel_not character varying(256),
    servis_id integer,
    personel_gecmisi_id integer,
    ozel_not character varying(256),
    brut_maas numeric DEFAULT 0 NOT NULL,
    ikramiye_sayisi integer,
    ikramiye_miktar numeric,
    tc_kimlik_no text,
    adres_id integer
);
 "   DROP TABLE public.personel_karti;
       public         postgres    false    7            k           1259    46098    personel_karti_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.personel_karti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.personel_karti_id_seq;
       public       postgres    false    362    7            `           0    0    personel_karti_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.personel_karti_id_seq OWNED BY public.personel_karti.id;
            public       postgres    false    363            l           1259    46100    personel_pdks_kart    TABLE     �   CREATE TABLE public.personel_pdks_kart (
    id integer NOT NULL,
    kart_id character varying(8),
    personel_no integer NOT NULL,
    kart_no integer NOT NULL,
    is_active boolean
);
 &   DROP TABLE public.personel_pdks_kart;
       public         postgres    false    7            m           1259    46103    personel_pdks_kart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personel_pdks_kart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.personel_pdks_kart_id_seq;
       public       postgres    false    7    364            a           0    0    personel_pdks_kart_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.personel_pdks_kart_id_seq OWNED BY public.personel_pdks_kart.id;
            public       postgres    false    365            n           1259    46105    personel_tasima_servis    TABLE     �   CREATE TABLE public.personel_tasima_servis (
    id integer NOT NULL,
    servis_no smallint NOT NULL,
    servis_adi character varying(32) NOT NULL,
    rota character varying[]
);
 *   DROP TABLE public.personel_tasima_servis;
       public         postgres    false    7            b           0    0    TABLE personel_tasima_servis    ACL     �   REVOKE ALL ON TABLE public.personel_tasima_servis FROM PUBLIC;
REVOKE ALL ON TABLE public.personel_tasima_servis FROM postgres;
GRANT ALL ON TABLE public.personel_tasima_servis TO postgres;
            public       postgres    false    366            o           1259    46111    personel_tasima_servis_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personel_tasima_servis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personel_tasima_servis_id_seq;
       public       postgres    false    366    7            c           0    0    personel_tasima_servis_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personel_tasima_servis_id_seq OWNED BY public.personel_tasima_servis.id;
            public       postgres    false    367            d           0    0 &   SEQUENCE personel_tasima_servis_id_seq    ACL     "  REVOKE ALL ON SEQUENCE public.personel_tasima_servis_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.personel_tasima_servis_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.personel_tasima_servis_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.personel_tasima_servis_id_seq TO PUBLIC;
            public       postgres    false    367            p           1259    46113    quality_form_mail_reciever    TABLE     }   CREATE TABLE public.quality_form_mail_reciever (
    id integer NOT NULL,
    mail_adresi character varying(128) NOT NULL
);
 .   DROP TABLE public.quality_form_mail_reciever;
       public         postgres    false    7            q           1259    46116 !   quality_form_mail_reciever_id_seq    SEQUENCE     �   CREATE SEQUENCE public.quality_form_mail_reciever_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.quality_form_mail_reciever_id_seq;
       public       postgres    false    368    7            e           0    0 !   quality_form_mail_reciever_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.quality_form_mail_reciever_id_seq OWNED BY public.quality_form_mail_reciever.id;
            public       postgres    false    369            f           0    0 *   SEQUENCE quality_form_mail_reciever_id_seq    ACL     2  REVOKE ALL ON SEQUENCE public.quality_form_mail_reciever_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.quality_form_mail_reciever_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.quality_form_mail_reciever_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.quality_form_mail_reciever_id_seq TO PUBLIC;
            public       postgres    false    369            r           1259    46118    recete    TABLE       CREATE TABLE public.recete (
    id integer NOT NULL,
    mamul_stok_kodu character varying(32) NOT NULL,
    ornek_uretim_miktari double precision NOT NULL,
    fire_orani double precision,
    aciklama character varying(128),
    recete_adi character varying(128) NOT NULL
);
    DROP TABLE public.recete;
       public         postgres    false    7            g           0    0    TABLE recete    ACL     �   REVOKE ALL ON TABLE public.recete FROM PUBLIC;
REVOKE ALL ON TABLE public.recete FROM postgres;
GRANT ALL ON TABLE public.recete TO postgres;
            public       postgres    false    370            s           1259    46121    recete_hammadde    TABLE     �   CREATE TABLE public.recete_hammadde (
    id integer NOT NULL,
    header_id integer NOT NULL,
    stok_kodu character varying(32) NOT NULL,
    miktar double precision NOT NULL,
    fire_orani double precision,
    recete_id integer
);
 #   DROP TABLE public.recete_hammadde;
       public         postgres    false    7            h           0    0    TABLE recete_hammadde    ACL     �   REVOKE ALL ON TABLE public.recete_hammadde FROM PUBLIC;
REVOKE ALL ON TABLE public.recete_hammadde FROM postgres;
GRANT ALL ON TABLE public.recete_hammadde TO postgres;
            public       postgres    false    371            t           1259    46124    recete_hammadde_id_seq    SEQUENCE        CREATE SEQUENCE public.recete_hammadde_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.recete_hammadde_id_seq;
       public       postgres    false    7    371            i           0    0    recete_hammadde_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.recete_hammadde_id_seq OWNED BY public.recete_hammadde.id;
            public       postgres    false    372            j           0    0    SEQUENCE recete_hammadde_id_seq    ACL       REVOKE ALL ON SEQUENCE public.recete_hammadde_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.recete_hammadde_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.recete_hammadde_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.recete_hammadde_id_seq TO PUBLIC;
            public       postgres    false    372            u           1259    46126    recete_id_seq    SEQUENCE     v   CREATE SEQUENCE public.recete_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.recete_id_seq;
       public       postgres    false    370    7            k           0    0    recete_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.recete_id_seq OWNED BY public.recete.id;
            public       postgres    false    373            l           0    0    SEQUENCE recete_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.recete_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.recete_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.recete_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.recete_id_seq TO PUBLIC;
            public       postgres    false    373            v           1259    46128    satis_fatura    TABLE     �   CREATE TABLE public.satis_fatura (
    id integer NOT NULL,
    fatura_no character varying(16),
    fatura_tarihi timestamp without time zone,
    teklif_id integer,
    siparis_id integer,
    irsaliye_id integer
);
     DROP TABLE public.satis_fatura;
       public         postgres    false    7            m           0    0    TABLE satis_fatura    ACL     �   REVOKE ALL ON TABLE public.satis_fatura FROM PUBLIC;
REVOKE ALL ON TABLE public.satis_fatura FROM postgres;
GRANT ALL ON TABLE public.satis_fatura TO postgres;
            public       postgres    false    374            w           1259    46131    satis_fatura_detay    TABLE     �   CREATE TABLE public.satis_fatura_detay (
    id integer NOT NULL,
    header_id integer,
    teklif_detay_id integer,
    siparis_detay_id integer,
    irsaliye_detay_id integer
);
 &   DROP TABLE public.satis_fatura_detay;
       public         postgres    false    7            n           0    0    TABLE satis_fatura_detay    ACL     �   REVOKE ALL ON TABLE public.satis_fatura_detay FROM PUBLIC;
REVOKE ALL ON TABLE public.satis_fatura_detay FROM postgres;
GRANT ALL ON TABLE public.satis_fatura_detay TO postgres;
            public       postgres    false    375            x           1259    46134    satis_fatura_detay_id_seq    SEQUENCE     �   CREATE SEQUENCE public.satis_fatura_detay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.satis_fatura_detay_id_seq;
       public       postgres    false    375    7            o           0    0    satis_fatura_detay_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.satis_fatura_detay_id_seq OWNED BY public.satis_fatura_detay.id;
            public       postgres    false    376            p           0    0 "   SEQUENCE satis_fatura_detay_id_seq    ACL       REVOKE ALL ON SEQUENCE public.satis_fatura_detay_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.satis_fatura_detay_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.satis_fatura_detay_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.satis_fatura_detay_id_seq TO PUBLIC;
            public       postgres    false    376            y           1259    46136    satis_fatura_id_seq    SEQUENCE     |   CREATE SEQUENCE public.satis_fatura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.satis_fatura_id_seq;
       public       postgres    false    7    374            q           0    0    satis_fatura_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.satis_fatura_id_seq OWNED BY public.satis_fatura.id;
            public       postgres    false    377            r           0    0    SEQUENCE satis_fatura_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.satis_fatura_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.satis_fatura_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.satis_fatura_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.satis_fatura_id_seq TO PUBLIC;
            public       postgres    false    377            z           1259    46138    satis_irsaliye    TABLE     �   CREATE TABLE public.satis_irsaliye (
    id integer NOT NULL,
    irsaliye_no character varying(16),
    irsaliye_tarihi timestamp without time zone,
    teklif_id integer,
    siparis_id integer,
    fatura_id integer
);
 "   DROP TABLE public.satis_irsaliye;
       public         postgres    false    7            s           0    0    TABLE satis_irsaliye    ACL     �   REVOKE ALL ON TABLE public.satis_irsaliye FROM PUBLIC;
REVOKE ALL ON TABLE public.satis_irsaliye FROM postgres;
GRANT ALL ON TABLE public.satis_irsaliye TO postgres;
            public       postgres    false    378            {           1259    46141    satis_irsaliye_detay    TABLE     �   CREATE TABLE public.satis_irsaliye_detay (
    id integer NOT NULL,
    header_id integer,
    teklif_detay_id integer,
    siparis_detay_id integer,
    fatura_detay_id integer
);
 (   DROP TABLE public.satis_irsaliye_detay;
       public         postgres    false    7            t           0    0    TABLE satis_irsaliye_detay    ACL     �   REVOKE ALL ON TABLE public.satis_irsaliye_detay FROM PUBLIC;
REVOKE ALL ON TABLE public.satis_irsaliye_detay FROM postgres;
GRANT ALL ON TABLE public.satis_irsaliye_detay TO postgres;
            public       postgres    false    379            |           1259    46144    satis_irsaliye_detay_id_seq    SEQUENCE     �   CREATE SEQUENCE public.satis_irsaliye_detay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.satis_irsaliye_detay_id_seq;
       public       postgres    false    7    379            u           0    0    satis_irsaliye_detay_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.satis_irsaliye_detay_id_seq OWNED BY public.satis_irsaliye_detay.id;
            public       postgres    false    380            v           0    0 $   SEQUENCE satis_irsaliye_detay_id_seq    ACL       REVOKE ALL ON SEQUENCE public.satis_irsaliye_detay_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.satis_irsaliye_detay_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.satis_irsaliye_detay_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.satis_irsaliye_detay_id_seq TO PUBLIC;
            public       postgres    false    380            }           1259    46146    satis_irsaliye_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.satis_irsaliye_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.satis_irsaliye_id_seq;
       public       postgres    false    378    7            w           0    0    satis_irsaliye_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.satis_irsaliye_id_seq OWNED BY public.satis_irsaliye.id;
            public       postgres    false    381            x           0    0    SEQUENCE satis_irsaliye_id_seq    ACL       REVOKE ALL ON SEQUENCE public.satis_irsaliye_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.satis_irsaliye_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.satis_irsaliye_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.satis_irsaliye_id_seq TO PUBLIC;
            public       postgres    false    381            ~           1259    46148    satis_siparis    TABLE     �   CREATE TABLE public.satis_siparis (
    id integer NOT NULL,
    siparis_no character varying(16),
    siparis_tarihi timestamp without time zone,
    teklif_id integer,
    irsaliye_id integer,
    fatura_id integer
);
 !   DROP TABLE public.satis_siparis;
       public         postgres    false    7            y           0    0    TABLE satis_siparis    ACL     �   REVOKE ALL ON TABLE public.satis_siparis FROM PUBLIC;
REVOKE ALL ON TABLE public.satis_siparis FROM postgres;
GRANT ALL ON TABLE public.satis_siparis TO postgres;
            public       postgres    false    382                       1259    46151    satis_siparis_detay    TABLE     �   CREATE TABLE public.satis_siparis_detay (
    id integer NOT NULL,
    header_id integer,
    teklif_detay_id integer,
    irsaliye_detay_id integer,
    fatura_detay_id integer
);
 '   DROP TABLE public.satis_siparis_detay;
       public         postgres    false    7            z           0    0    TABLE satis_siparis_detay    ACL     �   REVOKE ALL ON TABLE public.satis_siparis_detay FROM PUBLIC;
REVOKE ALL ON TABLE public.satis_siparis_detay FROM postgres;
GRANT ALL ON TABLE public.satis_siparis_detay TO postgres;
            public       postgres    false    383            �           1259    46154    satis_siparis_detay_id_seq    SEQUENCE     �   CREATE SEQUENCE public.satis_siparis_detay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.satis_siparis_detay_id_seq;
       public       postgres    false    383    7            {           0    0    satis_siparis_detay_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.satis_siparis_detay_id_seq OWNED BY public.satis_siparis_detay.id;
            public       postgres    false    384            |           0    0 #   SEQUENCE satis_siparis_detay_id_seq    ACL       REVOKE ALL ON SEQUENCE public.satis_siparis_detay_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.satis_siparis_detay_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.satis_siparis_detay_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.satis_siparis_detay_id_seq TO PUBLIC;
            public       postgres    false    384            �           1259    46156    satis_siparis_id_seq    SEQUENCE     }   CREATE SEQUENCE public.satis_siparis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.satis_siparis_id_seq;
       public       postgres    false    7    382            }           0    0    satis_siparis_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.satis_siparis_id_seq OWNED BY public.satis_siparis.id;
            public       postgres    false    385            ~           0    0    SEQUENCE satis_siparis_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.satis_siparis_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.satis_siparis_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.satis_siparis_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.satis_siparis_id_seq TO PUBLIC;
            public       postgres    false    385            �           1259    46158    satis_teklif    TABLE     �  CREATE TABLE public.satis_teklif (
    id integer NOT NULL,
    siparis_id integer,
    irsaliye_id integer,
    fatura_id integer,
    is_siparislesti boolean NOT NULL,
    is_taslak boolean DEFAULT false NOT NULL,
    is_efatura boolean DEFAULT false NOT NULL,
    tutar double precision DEFAULT 0 NOT NULL,
    iskonto_tutar double precision DEFAULT 0 NOT NULL,
    iskonto_ara_toplam double precision DEFAULT 0 NOT NULL,
    genel_iskonto_tutar double precision DEFAULT 0 NOT NULL,
    ara_toplam double precision DEFAULT 0 NOT NULL,
    kdv_tutar double precision DEFAULT 0 NOT NULL,
    genel_toplam double precision DEFAULT 0 NOT NULL,
    islem_tipi_id integer,
    teklif_no character varying(16),
    teklif_tarihi date,
    teslim_tarihi date,
    gecerlilik_tarihi date,
    musteri_kodu character varying(16),
    musteri_adi character varying(128),
    posta_kodu character varying(16),
    vergi_dairesi character varying(32),
    vergi_no character varying(32),
    musteri_temsilcisi_id integer,
    teklif_tipi_id integer,
    muhattap_ad character varying(32),
    muhattap_soyad character varying(32),
    odeme_vadesi character varying(32),
    referans character varying(128),
    teslimat_suresi character varying(32),
    teklif_durum_id integer,
    sevk_tarihi date,
    vade_gun_sayisi integer,
    fatura_sevk_tarihi character varying(64),
    para_birimi character varying(3) NOT NULL,
    dolar_kur double precision DEFAULT 1,
    euro_kur double precision DEFAULT 1,
    odeme_baslangic_donemi_id integer,
    teslim_sarti_id integer,
    gonderim_sekli_id integer,
    gonderim_sekli_detay character varying(128),
    odeme_sekli_id integer,
    aciklama character varying(128),
    proforma_no integer,
    arayan_kisi_id integer,
    arama_tarihi date,
    sonraki_aksiyon_tarihi date,
    aksiyon_notu character varying(128),
    tevkifat_kodu character varying(3),
    tevkifat_pay integer,
    tevkifat_payda integer,
    ihrac_kayit_kodu character varying(3)
);
     DROP TABLE public.satis_teklif;
       public         postgres    false    7                       0    0    TABLE satis_teklif    ACL     �   REVOKE ALL ON TABLE public.satis_teklif FROM PUBLIC;
REVOKE ALL ON TABLE public.satis_teklif FROM postgres;
GRANT ALL ON TABLE public.satis_teklif TO postgres;
            public       postgres    false    386            �           1259    46175    satis_teklif_detay    TABLE     �  CREATE TABLE public.satis_teklif_detay (
    id integer NOT NULL,
    header_id integer,
    siparis_detay_id integer,
    irsaliye_detay_id integer,
    fatura_detay_id integer,
    stok_kodu character varying(32),
    stok_aciklama character varying(128),
    aciklama character varying(128),
    referans character varying(128),
    miktar double precision NOT NULL,
    olcu_birimi character varying(8),
    iskonto_orani double precision DEFAULT 0,
    kdv_orani integer DEFAULT 0,
    fiyat double precision DEFAULT 0,
    net_fiyat double precision DEFAULT 0 NOT NULL,
    tutar double precision DEFAULT 0 NOT NULL,
    iskonto_tutar double precision DEFAULT 0 NOT NULL,
    net_tutar double precision DEFAULT 0 NOT NULL,
    kdv_tutar double precision DEFAULT 0 NOT NULL,
    toplam_tutar double precision DEFAULT 0 NOT NULL,
    vade_gun double precision DEFAULT 0,
    is_ana_urun boolean DEFAULT false NOT NULL,
    ana_urun_id integer,
    referans_ana_urun_id integer,
    transfer_hesap_kodu character varying(16),
    kdv_transfer_hesap_kodu character varying(16),
    vergi_kodu character varying(4),
    vergi_muafiyet_kodu character varying(4),
    diger_vergi_kodu character varying(4),
    gtip_no bigint
);
 &   DROP TABLE public.satis_teklif_detay;
       public         postgres    false    7            �           1259    46192    satis_teklif_detay_id_seq    SEQUENCE     �   CREATE SEQUENCE public.satis_teklif_detay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.satis_teklif_detay_id_seq;
       public       postgres    false    387    7            �           0    0    satis_teklif_detay_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.satis_teklif_detay_id_seq OWNED BY public.satis_teklif_detay.id;
            public       postgres    false    388            �           1259    46194    satis_teklif_id_seq    SEQUENCE     |   CREATE SEQUENCE public.satis_teklif_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.satis_teklif_id_seq;
       public       postgres    false    386    7            �           0    0    satis_teklif_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.satis_teklif_id_seq OWNED BY public.satis_teklif.id;
            public       postgres    false    389            �           1259    46222    stok_hareketi    TABLE     �  CREATE TABLE public.stok_hareketi (
    id integer NOT NULL,
    stok_kodu character varying(32) NOT NULL,
    miktar double precision NOT NULL,
    tutar double precision NOT NULL,
    giris_cikis_tip_id integer NOT NULL,
    alan_ambar character varying(32),
    veren_ambar character varying(32),
    tarih timestamp without time zone NOT NULL,
    is_donem_basi_hareket boolean DEFAULT false NOT NULL
);
 !   DROP TABLE public.stok_hareketi;
       public         postgres    false    7            �           1259    46226    stok_hareketi_id_seq    SEQUENCE     }   CREATE SEQUENCE public.stok_hareketi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.stok_hareketi_id_seq;
       public       postgres    false    7    390            �           0    0    stok_hareketi_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.stok_hareketi_id_seq OWNED BY public.stok_hareketi.id;
            public       postgres    false    391            �           0    0    SEQUENCE stok_hareketi_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.stok_hareketi_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.stok_hareketi_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.stok_hareketi_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.stok_hareketi_id_seq TO PUBLIC;
            public       postgres    false    391            �           1259    46228 
   stok_karti    TABLE     !	  CREATE TABLE public.stok_karti (
    id integer NOT NULL,
    stok_kodu character varying(32) NOT NULL,
    stok_adi character varying(128) NOT NULL,
    stok_grubu_id integer NOT NULL,
    olcu_birimi_id integer NOT NULL,
    urun_tipi_id integer NOT NULL,
    alis_iskonto numeric(5,2),
    satis_iskonto numeric(5,2),
    yetkili_iskonto numeric(5,2),
    stok_tipi_id integer NOT NULL,
    ham_alis_fiyat numeric(18,6) DEFAULT 0 NOT NULL,
    ham_alis_para_birim character varying(3) DEFAULT public.get_default_para_birimi() NOT NULL,
    alis_fiyat numeric(18,6) NOT NULL,
    alis_para_birim character varying(3) DEFAULT public.get_default_para_birimi() NOT NULL,
    satis_fiyat numeric(18,6) NOT NULL,
    satis_para_birim character varying(3) DEFAULT public.get_default_para_birimi() NOT NULL,
    ihrac_fiyat numeric(18,6) DEFAULT 0 NOT NULL,
    ihrac_para_birim character varying(3) DEFAULT public.get_default_para_birimi() NOT NULL,
    ortalama_maliyet numeric(18,6) DEFAULT 0,
    varsayilan_recete_id integer,
    en double precision,
    boy double precision,
    yukseklik double precision,
    mensei_id integer,
    gtip_no character varying(16),
    diib_urun_tanimi character varying(64),
    en_az_stok_seviyesi double precision,
    tanim character varying(384),
    ozel_kod character varying(16),
    marka character varying(32),
    agirlik double precision,
    kapasite double precision,
    cins_id integer,
    string_degisken1 character varying(32),
    string_degisken2 character varying(32),
    string_degisken3 character varying(32),
    string_degisken4 character varying(32),
    string_degisken5 character varying(32),
    string_degisken6 character varying(32),
    integer_degisken1 integer,
    integer_degisken2 integer,
    integer_degisken3 integer,
    double_degisken1 double precision,
    double_degisken2 double precision,
    double_degisken3 double precision,
    is_satilabilir boolean DEFAULT true NOT NULL,
    is_otomatik_uretim_urunu boolean DEFAULT false NOT NULL,
    lot_parti_miktari double precision,
    paket_miktari integer,
    seri_no_turu character varying(4),
    is_harici_seri_no_icerir boolean DEFAULT false NOT NULL,
    harici_serino_stok_kodu_id integer,
    tasiyici_paket_id integer,
    onceki_donem_cikan_miktar double precision,
    temin_suresi integer
);
    DROP TABLE public.stok_karti;
       public         postgres    false    512    512    512    512    7            �           1259    46245    stok_karti_id_seq    SEQUENCE     z   CREATE SEQUENCE public.stok_karti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.stok_karti_id_seq;
       public       postgres    false    392    7            �           0    0    stok_karti_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.stok_karti_id_seq OWNED BY public.stok_karti.id;
            public       postgres    false    393            �           1259    46254    sys_application_settings    TABLE     Z  CREATE TABLE public.sys_application_settings (
    id integer NOT NULL,
    logo bytea,
    company_name character varying(128) DEFAULT 'THUNDERSOFT A.Ş.'::character varying NOT NULL,
    phone1 character varying(24) NOT NULL,
    phone2 character varying(24),
    phone3 character varying(24),
    phone4 character varying(24),
    phone5 character varying(24),
    fax1 character varying(24),
    fax2 character varying(24),
    mersis_no character varying(16),
    web_site character varying(48) DEFAULT 'www.website.com'::character varying,
    email character varying(80) DEFAULT 'mail@mailsite.com'::character varying,
    tax_administration character varying(32),
    tax_no character varying(16),
    taxpayer_type_id integer,
    trade_register_number character varying(24),
    country_id integer,
    city_id integer,
    town character varying(32),
    district character varying(40),
    road character varying(40),
    street character varying(40),
    post_code character varying(7),
    building_name character varying(40),
    door_no character varying(6),
    period integer DEFAULT 2018 NOT NULL,
    app_main_lang character varying(16),
    form_color integer,
    mail_host_name character varying(32),
    mail_host_user character varying(32),
    mail_host_pass character varying(16),
    mail_host_smtp_port integer,
    grid_color_1 integer DEFAULT 13171168 NOT NULL,
    grid_color_2 integer DEFAULT 7467153 NOT NULL,
    grid_color_active integer DEFAULT 14605509 NOT NULL,
    crypt_key character varying(16) DEFAULT 12345 NOT NULL,
    is_use_quality_form_number boolean DEFAULT false NOT NULL
);
 ,   DROP TABLE public.sys_application_settings;
       public         postgres    false    7            �           1259    46269    sys_application_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_application_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.sys_application_settings_id_seq;
       public       postgres    false    394    7            �           0    0    sys_application_settings_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.sys_application_settings_id_seq OWNED BY public.sys_application_settings.id;
            public       postgres    false    395            �           1259    46271    sys_application_settings_other    TABLE     �  CREATE TABLE public.sys_application_settings_other (
    id integer NOT NULL,
    is_edefter_aktif boolean DEFAULT false NOT NULL,
    mail_sender_address character varying(32),
    mail_sender_username character varying(32),
    mail_sender_password character varying(16),
    mail_sender_port integer,
    varsayilan_satis_cari_kod character varying(16),
    varsayilan_alis_cari_kod character varying(16),
    is_bolum_ambarda_uretim_yap boolean DEFAULT false NOT NULL,
    is_uretim_muhasebe_kaydi_olustursun boolean DEFAULT true NOT NULL,
    is_stok_satimda_negatife_dusebilir boolean DEFAULT false NOT NULL,
    is_mal_satis_sayilarini_goster boolean DEFAULT false NOT NULL,
    is_pcb_uretim boolean DEFAULT false NOT NULL,
    is_proforma_no_goster boolean DEFAULT false NOT NULL,
    is_satis_takip boolean DEFAULT false NOT NULL,
    is_hammadde_girise_gore_sirala boolean DEFAULT false NOT NULL,
    is_uretim_entegrasyon_hammadde_kullanim_hesabi_iscilikle boolean DEFAULT false NOT NULL,
    is_tahsilat_listesi_virmanli boolean DEFAULT false NOT NULL,
    is_ortalama_vade_0_ise_sevkiyata_izin_verme boolean DEFAULT false NOT NULL,
    is_sipariste_teslim_tarihi_yazdir boolean DEFAULT false NOT NULL,
    is_teklif_ayrintilarini_goster boolean DEFAULT false NOT NULL,
    is_fatura_irsaliye_no_0_ile_baslasin boolean DEFAULT false NOT NULL,
    is_excel_ekli_irsaliye_yazdirma boolean DEFAULT false NOT NULL,
    is_ambarlararasi_transfer_numara_otomatik_gelsin boolean DEFAULT false NOT NULL,
    is_ambarlararasi_transfer_onayli_calissin boolean DEFAULT false NOT NULL,
    is_alis_teklif_alis_sipariste_ham_alis_fiyatini_kullan boolean DEFAULT false NOT NULL,
    is_tahsilat_listesine_120_bulut_hesabini_dahil_etme boolean DEFAULT false NOT NULL,
    is_satis_listesi_varsayilan_filtre_mamul_hammadde boolean DEFAULT false NOT NULL,
    is_recete_maliyet_analizi_baska_db_kullanarak_yap boolean DEFAULT false NOT NULL,
    is_efatura_aktif boolean DEFAULT false NOT NULL,
    is_stok_transfer_fiyati_kullanici_degistirebilir boolean DEFAULT false NOT NULL,
    is_hesaplar_rapolarda_cikmasin boolean DEFAULT false NOT NULL,
    is_siparisi_baska_programa_otomatik_kayit_yap boolean DEFAULT false NOT NULL,
    is_active_uretim_takip boolean DEFAULT false NOT NULL,
    is_pano_programina_otomatik_kayit boolean DEFAULT false NOT NULL,
    is_nakit_akista_farkli_db_kullan boolean DEFAULT false NOT NULL,
    is_ihrac_fiyati_yerine_satis_fiyatini_kullan boolean DEFAULT false NOT NULL,
    is_statik_iskonto_orani_kullan boolean DEFAULT false NOT NULL,
    is_eirsaliye_aktif boolean DEFAULT false NOT NULL,
    is_stok_recete_adi_birlikte_guncellensin boolean DEFAULT false NOT NULL,
    is_kur_bilgisini_1_olarak_kullan boolean DEFAULT false NOT NULL,
    is_genel_kdv_orani_kullan boolean DEFAULT false NOT NULL,
    xslt_sablon_adi character varying(32),
    genel_iskonto_gecerlilik_tarihi date,
    en_fazla_fatura_satir_sayisi integer DEFAULT 0 NOT NULL,
    en_fazla_e_fatura_satir_sayisi integer DEFAULT 0 NOT NULL,
    en_fazla_irsaliye_satir_sayisi integer DEFAULT 0 NOT NULL,
    en_fazla_e_irsaliye_satir_sayisi integer DEFAULT 0 NOT NULL,
    siparis_kopyalanacak_kaynak_cari_kod character varying(16),
    siparis_kopyalanacak_hedef_cari_kod character varying(16),
    maliyet_analizi_iskonto_orani double precision,
    genel_kdv_orani double precision DEFAULT 18 NOT NULL,
    path_teklif_hesaplama_conf character varying(255),
    path_proforma_file character varying(255),
    path_mal_stok_seviyesi_eord_rapor character varying(255),
    path_update character varying(255),
    path_stok_karti_resim character varying(255),
    path_proforma_pdf_kayit character varying(255)
);
 2   DROP TABLE public.sys_application_settings_other;
       public         postgres    false    7            �           1259    46317 %   sys_application_settings_other_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_application_settings_other_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.sys_application_settings_other_id_seq;
       public       postgres    false    396    7            �           0    0 %   sys_application_settings_other_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.sys_application_settings_other_id_seq OWNED BY public.sys_application_settings_other.id;
            public       postgres    false    397            �           0    0 .   SEQUENCE sys_application_settings_other_id_seq    ACL     B  REVOKE ALL ON SEQUENCE public.sys_application_settings_other_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.sys_application_settings_other_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.sys_application_settings_other_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sys_application_settings_other_id_seq TO PUBLIC;
            public       postgres    false    397            �           1259    46319    sys_city    TABLE     �   CREATE TABLE public.sys_city (
    id integer NOT NULL,
    city_name character varying(32) NOT NULL,
    car_plate_code integer,
    country_id integer
);
    DROP TABLE public.sys_city;
       public         postgres    false    7            �           0    0    TABLE sys_city    ACL     �   REVOKE ALL ON TABLE public.sys_city FROM PUBLIC;
REVOKE ALL ON TABLE public.sys_city FROM postgres;
GRANT ALL ON TABLE public.sys_city TO postgres;
            public       postgres    false    398            �           1259    46322    sys_city_id_seq    SEQUENCE     x   CREATE SEQUENCE public.sys_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sys_city_id_seq;
       public       postgres    false    398    7            �           0    0    sys_city_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sys_city_id_seq OWNED BY public.sys_city.id;
            public       postgres    false    399            �           1259    46324    sys_country    TABLE       CREATE TABLE public.sys_country (
    id integer NOT NULL,
    country_code character varying(2) NOT NULL,
    country_name character varying(128) NOT NULL,
    iso_year integer,
    iso_cctld_code character varying(3),
    is_eu_member boolean DEFAULT false NOT NULL
);
    DROP TABLE public.sys_country;
       public         postgres    false    7            �           0    0    TABLE sys_country    ACL     �   REVOKE ALL ON TABLE public.sys_country FROM PUBLIC;
REVOKE ALL ON TABLE public.sys_country FROM postgres;
GRANT ALL ON TABLE public.sys_country TO postgres;
            public       postgres    false    400            �           1259    46328    sys_country_id_seq    SEQUENCE     {   CREATE SEQUENCE public.sys_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.sys_country_id_seq;
       public       postgres    false    7    400            �           0    0    sys_country_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.sys_country_id_seq OWNED BY public.sys_country.id;
            public       postgres    false    401            �           1259    46330    sys_grid_col_color    TABLE     U  CREATE TABLE public.sys_grid_col_color (
    id integer NOT NULL,
    table_name character varying NOT NULL,
    column_name character varying NOT NULL,
    min_value double precision DEFAULT 0 NOT NULL,
    min_color integer DEFAULT 0 NOT NULL,
    max_value double precision DEFAULT 0 NOT NULL,
    max_color integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public.sys_grid_col_color;
       public         postgres    false    7            �           0    0    TABLE sys_grid_col_color    ACL     �   REVOKE ALL ON TABLE public.sys_grid_col_color FROM PUBLIC;
REVOKE ALL ON TABLE public.sys_grid_col_color FROM postgres;
GRANT ALL ON TABLE public.sys_grid_col_color TO postgres;
            public       postgres    false    402            �           1259    46340    sys_grid_col_color_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_grid_col_color_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.sys_grid_col_color_id_seq;
       public       postgres    false    7    402            �           0    0    sys_grid_col_color_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.sys_grid_col_color_id_seq OWNED BY public.sys_grid_col_color.id;
            public       postgres    false    403            �           0    0 "   SEQUENCE sys_grid_col_color_id_seq    ACL       REVOKE ALL ON SEQUENCE public.sys_grid_col_color_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.sys_grid_col_color_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.sys_grid_col_color_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sys_grid_col_color_id_seq TO PUBLIC;
            public       postgres    false    403            �           1259    46342    sys_grid_col_percent    TABLE     |  CREATE TABLE public.sys_grid_col_percent (
    id integer NOT NULL,
    table_name character varying,
    column_name character varying,
    max_value double precision DEFAULT 0 NOT NULL,
    color_bar integer DEFAULT 0 NOT NULL,
    color_bar_back integer DEFAULT 0 NOT NULL,
    color_bar_text integer DEFAULT 0 NOT NULL,
    color_bar_text_active integer DEFAULT 0 NOT NULL
);
 (   DROP TABLE public.sys_grid_col_percent;
       public         postgres    false    7            �           0    0    TABLE sys_grid_col_percent    ACL     �   REVOKE ALL ON TABLE public.sys_grid_col_percent FROM PUBLIC;
REVOKE ALL ON TABLE public.sys_grid_col_percent FROM postgres;
GRANT ALL ON TABLE public.sys_grid_col_percent TO postgres;
            public       postgres    false    404            �           1259    46353    sys_grid_col_percent_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_grid_col_percent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.sys_grid_col_percent_id_seq;
       public       postgres    false    7    404            �           0    0    sys_grid_col_percent_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.sys_grid_col_percent_id_seq OWNED BY public.sys_grid_col_percent.id;
            public       postgres    false    405            �           0    0 $   SEQUENCE sys_grid_col_percent_id_seq    ACL       REVOKE ALL ON SEQUENCE public.sys_grid_col_percent_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.sys_grid_col_percent_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.sys_grid_col_percent_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sys_grid_col_percent_id_seq TO PUBLIC;
            public       postgres    false    405            �           1259    46355    sys_grid_col_width    TABLE     �   CREATE TABLE public.sys_grid_col_width (
    id integer NOT NULL,
    table_name character varying NOT NULL,
    column_name character varying NOT NULL,
    column_width integer DEFAULT 0 NOT NULL,
    sequence_no integer DEFAULT 1 NOT NULL
);
 &   DROP TABLE public.sys_grid_col_width;
       public         postgres    false    7            �           0    0    TABLE sys_grid_col_width    ACL     �   REVOKE ALL ON TABLE public.sys_grid_col_width FROM PUBLIC;
REVOKE ALL ON TABLE public.sys_grid_col_width FROM postgres;
GRANT ALL ON TABLE public.sys_grid_col_width TO postgres;
            public       postgres    false    406            �           1259    46363    sys_grid_col_width_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_grid_col_width_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.sys_grid_col_width_id_seq;
       public       postgres    false    406    7            �           0    0    sys_grid_col_width_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.sys_grid_col_width_id_seq OWNED BY public.sys_grid_col_width.id;
            public       postgres    false    407            �           0    0 "   SEQUENCE sys_grid_col_width_id_seq    ACL       REVOKE ALL ON SEQUENCE public.sys_grid_col_width_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.sys_grid_col_width_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.sys_grid_col_width_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sys_grid_col_width_id_seq TO PUBLIC;
            public       postgres    false    407            �           1259    46365    sys_grid_default_order_filter    TABLE     �   CREATE TABLE public.sys_grid_default_order_filter (
    id integer NOT NULL,
    key character varying(32),
    value character varying,
    is_order boolean DEFAULT false NOT NULL
);
 1   DROP TABLE public.sys_grid_default_order_filter;
       public         postgres    false    7            �           1259    46372 $   sys_grid_default_order_filter_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_grid_default_order_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.sys_grid_default_order_filter_id_seq;
       public       postgres    false    408    7            �           0    0 $   sys_grid_default_order_filter_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.sys_grid_default_order_filter_id_seq OWNED BY public.sys_grid_default_order_filter.id;
            public       postgres    false    409            �           0    0 -   SEQUENCE sys_grid_default_order_filter_id_seq    ACL     >  REVOKE ALL ON SEQUENCE public.sys_grid_default_order_filter_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.sys_grid_default_order_filter_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.sys_grid_default_order_filter_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sys_grid_default_order_filter_id_seq TO PUBLIC;
            public       postgres    false    409            �           1259    46374    sys_lang    TABLE     ^   CREATE TABLE public.sys_lang (
    id integer NOT NULL,
    language character varying(16)
);
    DROP TABLE public.sys_lang;
       public         postgres    false    7            �           0    0    TABLE sys_lang    ACL     �   REVOKE ALL ON TABLE public.sys_lang FROM PUBLIC;
REVOKE ALL ON TABLE public.sys_lang FROM postgres;
GRANT ALL ON TABLE public.sys_lang TO postgres;
            public       postgres    false    410            �           1259    46377    sys_lang_data_content    TABLE     �   CREATE TABLE public.sys_lang_data_content (
    id integer NOT NULL,
    lang character varying(16) NOT NULL,
    table_name character varying NOT NULL,
    column_name character varying NOT NULL,
    row_id integer NOT NULL,
    val text
);
 )   DROP TABLE public.sys_lang_data_content;
       public         postgres    false    7            �           1259    46383    sys_lang_data_content_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_lang_data_content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.sys_lang_data_content_id_seq;
       public       postgres    false    7    411            �           0    0    sys_lang_data_content_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.sys_lang_data_content_id_seq OWNED BY public.sys_lang_data_content.id;
            public       postgres    false    412            �           0    0 %   SEQUENCE sys_lang_data_content_id_seq    ACL       REVOKE ALL ON SEQUENCE public.sys_lang_data_content_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.sys_lang_data_content_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.sys_lang_data_content_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sys_lang_data_content_id_seq TO PUBLIC;
            public       postgres    false    412            �           1259    46385    sys_lang_gui_content    TABLE     Y  CREATE TABLE public.sys_lang_gui_content (
    id integer NOT NULL,
    lang character varying(16) NOT NULL,
    code character varying(64) NOT NULL,
    val text,
    is_factory_setting boolean DEFAULT false NOT NULL,
    content_type character varying(32) NOT NULL,
    table_name character varying(64),
    form_name character varying(64)
);
 (   DROP TABLE public.sys_lang_gui_content;
       public         postgres    false    7            �           1259    46392    sys_lang_gui_content_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_lang_gui_content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.sys_lang_gui_content_id_seq;
       public       postgres    false    413    7            �           0    0    sys_lang_gui_content_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.sys_lang_gui_content_id_seq OWNED BY public.sys_lang_gui_content.id;
            public       postgres    false    414            �           0    0 $   SEQUENCE sys_lang_gui_content_id_seq    ACL       REVOKE ALL ON SEQUENCE public.sys_lang_gui_content_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.sys_lang_gui_content_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.sys_lang_gui_content_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sys_lang_gui_content_id_seq TO PUBLIC;
            public       postgres    false    414            �           1259    46394    sys_lang_id_seq    SEQUENCE     x   CREATE SEQUENCE public.sys_lang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sys_lang_id_seq;
       public       postgres    false    410    7            �           0    0    sys_lang_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sys_lang_id_seq OWNED BY public.sys_lang.id;
            public       postgres    false    415            �           0    0    SEQUENCE sys_lang_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.sys_lang_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.sys_lang_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.sys_lang_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sys_lang_id_seq TO PUBLIC;
            public       postgres    false    415            �           1259    46396    sys_multi_lang_data_table_list    TABLE     �   CREATE TABLE public.sys_multi_lang_data_table_list (
    id integer NOT NULL,
    table_name character varying DEFAULT 128 NOT NULL
);
 2   DROP TABLE public.sys_multi_lang_data_table_list;
       public         postgres    false    7            �           1259    46403 %   sys_multi_lang_data_table_list_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_multi_lang_data_table_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.sys_multi_lang_data_table_list_id_seq;
       public       postgres    false    416    7            �           0    0 %   sys_multi_lang_data_table_list_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.sys_multi_lang_data_table_list_id_seq OWNED BY public.sys_multi_lang_data_table_list.id;
            public       postgres    false    417            �           0    0 .   SEQUENCE sys_multi_lang_data_table_list_id_seq    ACL     B  REVOKE ALL ON SEQUENCE public.sys_multi_lang_data_table_list_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.sys_multi_lang_data_table_list_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.sys_multi_lang_data_table_list_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sys_multi_lang_data_table_list_id_seq TO PUBLIC;
            public       postgres    false    417            �           1259    46405    sys_permission_source    TABLE     �   CREATE TABLE public.sys_permission_source (
    id integer NOT NULL,
    source_code character varying(16),
    source_name character varying(64),
    source_group_id integer
);
 )   DROP TABLE public.sys_permission_source;
       public         postgres    false    7            �           0    0    TABLE sys_permission_source    ACL     �   REVOKE ALL ON TABLE public.sys_permission_source FROM PUBLIC;
REVOKE ALL ON TABLE public.sys_permission_source FROM postgres;
GRANT ALL ON TABLE public.sys_permission_source TO postgres;
            public       postgres    false    418            �           1259    46408    sys_permission_source_group    TABLE     u   CREATE TABLE public.sys_permission_source_group (
    id integer NOT NULL,
    source_group character varying(64)
);
 /   DROP TABLE public.sys_permission_source_group;
       public         postgres    false    7            �           0    0 !   TABLE sys_permission_source_group    ACL     �   REVOKE ALL ON TABLE public.sys_permission_source_group FROM PUBLIC;
REVOKE ALL ON TABLE public.sys_permission_source_group FROM postgres;
GRANT ALL ON TABLE public.sys_permission_source_group TO postgres;
            public       postgres    false    419            �           1259    46411 "   sys_permission_source_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_permission_source_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.sys_permission_source_group_id_seq;
       public       postgres    false    7    419            �           0    0 "   sys_permission_source_group_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.sys_permission_source_group_id_seq OWNED BY public.sys_permission_source_group.id;
            public       postgres    false    420            �           0    0 +   SEQUENCE sys_permission_source_group_id_seq    ACL     6  REVOKE ALL ON SEQUENCE public.sys_permission_source_group_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.sys_permission_source_group_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.sys_permission_source_group_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sys_permission_source_group_id_seq TO PUBLIC;
            public       postgres    false    420            �           1259    46413    sys_permission_source_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_permission_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.sys_permission_source_id_seq;
       public       postgres    false    418    7            �           0    0    sys_permission_source_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.sys_permission_source_id_seq OWNED BY public.sys_permission_source.id;
            public       postgres    false    421            �           0    0 %   SEQUENCE sys_permission_source_id_seq    ACL       REVOKE ALL ON SEQUENCE public.sys_permission_source_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.sys_permission_source_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.sys_permission_source_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sys_permission_source_id_seq TO PUBLIC;
            public       postgres    false    421            �           1259    46415    sys_quality_form_number    TABLE     �   CREATE TABLE public.sys_quality_form_number (
    id integer NOT NULL,
    table_name character varying NOT NULL,
    form_no character varying(16) NOT NULL,
    is_input_form boolean
);
 +   DROP TABLE public.sys_quality_form_number;
       public         postgres    false    7            �           1259    46421    sys_quality_form_number_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_quality_form_number_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.sys_quality_form_number_id_seq;
       public       postgres    false    7    422            �           0    0    sys_quality_form_number_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.sys_quality_form_number_id_seq OWNED BY public.sys_quality_form_number.id;
            public       postgres    false    423            �           0    0 '   SEQUENCE sys_quality_form_number_id_seq    ACL     &  REVOKE ALL ON SEQUENCE public.sys_quality_form_number_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.sys_quality_form_number_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.sys_quality_form_number_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sys_quality_form_number_id_seq TO PUBLIC;
            public       postgres    false    423            �           1259    46423    sys_taxpayer_type    TABLE     �   CREATE TABLE public.sys_taxpayer_type (
    id integer NOT NULL,
    taxpayer_type character varying(32) NOT NULL,
    is_default boolean DEFAULT false NOT NULL
);
 %   DROP TABLE public.sys_taxpayer_type;
       public         postgres    false    7            �           1259    46427    sys_taxpayer_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_taxpayer_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.sys_taxpayer_type_id_seq;
       public       postgres    false    7    424            �           0    0    sys_taxpayer_type_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.sys_taxpayer_type_id_seq OWNED BY public.sys_taxpayer_type.id;
            public       postgres    false    425            �           1259    46429    sys_user    TABLE     �  CREATE TABLE public.sys_user (
    id integer NOT NULL,
    user_name character varying(32) NOT NULL,
    user_password text NOT NULL,
    is_active_user boolean DEFAULT false NOT NULL,
    is_online boolean DEFAULT false NOT NULL,
    is_admin boolean DEFAULT false NOT NULL,
    is_super_user boolean DEFAULT false NOT NULL,
    ip_address character varying(32) DEFAULT '127.0.0.1'::character varying NOT NULL,
    mac_address character varying(32),
    email_address character varying(64),
    app_version text,
    personel_bilgisi_id integer NOT NULL,
    invoice_no_serie character varying(1),
    dispatch_no_serie character varying(1),
    default_qrcode_size integer DEFAULT '-1'::integer NOT NULL
);
    DROP TABLE public.sys_user;
       public         postgres    false    7            �           1259    46441    sys_user_access_right    TABLE     �  CREATE TABLE public.sys_user_access_right (
    id integer NOT NULL,
    source_code character varying(8) NOT NULL,
    is_read boolean DEFAULT false NOT NULL,
    is_add_record boolean DEFAULT false NOT NULL,
    is_update boolean DEFAULT false NOT NULL,
    is_delete boolean DEFAULT false NOT NULL,
    is_special boolean DEFAULT false NOT NULL,
    user_name character varying(32) NOT NULL
);
 )   DROP TABLE public.sys_user_access_right;
       public         postgres    false    7            �           1259    46449    sys_user_access_right_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_user_access_right_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.sys_user_access_right_id_seq;
       public       postgres    false    7    427            �           0    0    sys_user_access_right_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.sys_user_access_right_id_seq OWNED BY public.sys_user_access_right.id;
            public       postgres    false    428            �           0    0 %   SEQUENCE sys_user_access_right_id_seq    ACL       REVOKE ALL ON SEQUENCE public.sys_user_access_right_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.sys_user_access_right_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.sys_user_access_right_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sys_user_access_right_id_seq TO PUBLIC;
            public       postgres    false    428            �           1259    46451    sys_user_id_seq    SEQUENCE     x   CREATE SEQUENCE public.sys_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sys_user_id_seq;
       public       postgres    false    426    7            �           0    0    sys_user_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sys_user_id_seq OWNED BY public.sys_user.id;
            public       postgres    false    429            �           0    0    SEQUENCE sys_user_id_seq    ACL     �   REVOKE ALL ON SEQUENCE public.sys_user_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.sys_user_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.sys_user_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sys_user_id_seq TO PUBLIC;
            public       postgres    false    429            �           1259    46453    sys_user_mac_address_exception    TABLE     �   CREATE TABLE public.sys_user_mac_address_exception (
    id integer NOT NULL,
    user_name character varying(32) NOT NULL,
    ip_address character varying(32) NOT NULL
);
 2   DROP TABLE public.sys_user_mac_address_exception;
       public         postgres    false    7            �           1259    46456 %   sys_user_mac_address_exception_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_user_mac_address_exception_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.sys_user_mac_address_exception_id_seq;
       public       postgres    false    7    430            �           0    0 %   sys_user_mac_address_exception_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.sys_user_mac_address_exception_id_seq OWNED BY public.sys_user_mac_address_exception.id;
            public       postgres    false    431            �           0    0 .   SEQUENCE sys_user_mac_address_exception_id_seq    ACL     B  REVOKE ALL ON SEQUENCE public.sys_user_mac_address_exception_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.sys_user_mac_address_exception_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.sys_user_mac_address_exception_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sys_user_mac_address_exception_id_seq TO PUBLIC;
            public       postgres    false    431            �           1259    46458    sys_view_tables    VIEW     5  CREATE VIEW public.sys_view_tables AS
 SELECT initcap(replace((tables.table_name)::text, '_'::text, ' '::text)) AS table_name,
    (tables.table_type)::text AS table_type
   FROM information_schema.tables
  WHERE ((tables.table_schema)::text = 'public'::text)
  ORDER BY tables.table_type, tables.table_name;
 "   DROP VIEW public.sys_view_tables;
       public       postgres    false    7            �           1259    46462    sys_view_columns    VIEW     F  CREATE VIEW public.sys_view_columns AS
 SELECT initcap(replace((columns.table_name)::text, '_'::text, ' '::text)) AS table_name,
    initcap(replace((columns.column_name)::text, '_'::text, ' '::text)) AS column_name,
    columns.is_nullable,
    (columns.data_type)::text AS data_type,
    (columns.character_maximum_length)::integer AS character_maximum_length,
    (columns.ordinal_position)::integer AS ordinal_position,
    columns.table_name AS orj_table_name,
    columns.column_name AS orj_column_name,
    vt.table_type,
    columns.numeric_precision,
    columns.numeric_scale
   FROM (information_schema.columns
     JOIN public.sys_view_tables vt ON ((( SELECT lower(replace(vt.table_name, ' '::text, '_'::text)) AS lower) = (columns.table_name)::text)))
  ORDER BY vt.table_type, columns.table_name, columns.ordinal_position;
 #   DROP VIEW public.sys_view_columns;
       public       postgres    false    432    432    7            �           1259    46467    sys_view_databases    VIEW     6  CREATE VIEW public.sys_view_databases AS
 SELECT pg_database.datname AS database_name,
    pg_shdescription.description AS aciklama
   FROM (pg_shdescription
     JOIN pg_database ON ((pg_shdescription.objoid = pg_database.oid)))
  WHERE ((1 = 1) AND (pg_shdescription.description = 'THS ERP Systems'::text));
 %   DROP VIEW public.sys_view_databases;
       public       postgres    false    7            �           1259    46471    urun_kabul_red_nedeni    TABLE     q   CREATE TABLE public.urun_kabul_red_nedeni (
    id integer NOT NULL,
    deger character varying(64) NOT NULL
);
 )   DROP TABLE public.urun_kabul_red_nedeni;
       public         postgres    false    7            �           0    0    TABLE urun_kabul_red_nedeni    ACL     �   REVOKE ALL ON TABLE public.urun_kabul_red_nedeni FROM PUBLIC;
REVOKE ALL ON TABLE public.urun_kabul_red_nedeni FROM postgres;
GRANT ALL ON TABLE public.urun_kabul_red_nedeni TO postgres;
            public       postgres    false    435            �           1259    46474    urun_kabul_red_nedeni_id_seq    SEQUENCE     �   CREATE SEQUENCE public.urun_kabul_red_nedeni_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.urun_kabul_red_nedeni_id_seq;
       public       postgres    false    435    7            �           0    0    urun_kabul_red_nedeni_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.urun_kabul_red_nedeni_id_seq OWNED BY public.urun_kabul_red_nedeni.id;
            public       postgres    false    436            �           0    0 %   SEQUENCE urun_kabul_red_nedeni_id_seq    ACL       REVOKE ALL ON SEQUENCE public.urun_kabul_red_nedeni_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.urun_kabul_red_nedeni_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.urun_kabul_red_nedeni_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.urun_kabul_red_nedeni_id_seq TO PUBLIC;
            public       postgres    false    436            \           2604    46476    id    DEFAULT     d   ALTER TABLE ONLY public.adres ALTER COLUMN id SET DEFAULT nextval('public.adres_id_seq'::regclass);
 7   ALTER TABLE public.adres ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    182    181            d           2604    46477    id    DEFAULT     p   ALTER TABLE ONLY public.alis_teklif ALTER COLUMN id SET DEFAULT nextval('public.alis_teklif_id_seq'::regclass);
 =   ALTER TABLE public.alis_teklif ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    186    183            e           2604    46478    id    DEFAULT     |   ALTER TABLE ONLY public.alis_teklif_detay ALTER COLUMN id SET DEFAULT nextval('public.alis_teklif_detay_id_seq'::regclass);
 C   ALTER TABLE public.alis_teklif_detay ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    185    184            i           2604    46479    id    DEFAULT     d   ALTER TABLE ONLY public.ambar ALTER COLUMN id SET DEFAULT nextval('public.ambar_id_seq'::regclass);
 7   ALTER TABLE public.ambar ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    188    187            j           2604    46480    id    DEFAULT     j   ALTER TABLE ONLY public.arc_arac ALTER COLUMN id SET DEFAULT nextval('public.arc_arac_id_seq'::regclass);
 :   ALTER TABLE public.arc_arac ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    190    189            l           2604    46481    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_barkod_hazirlik_dosya_turu ALTER COLUMN id SET DEFAULT nextval('public.ayar_barkod_hazirlik_dosya_turu_id_seq'::regclass);
 Q   ALTER TABLE public.ayar_barkod_hazirlik_dosya_turu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    192    191            m           2604    46482    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_barkod_serino_turu ALTER COLUMN id SET DEFAULT nextval('public.ayar_barkod_serino_turu_id_seq'::regclass);
 I   ALTER TABLE public.ayar_barkod_serino_turu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    194    193            n           2604    46483    id    DEFAULT     ~   ALTER TABLE ONLY public.ayar_barkod_tezgah ALTER COLUMN id SET DEFAULT nextval('public.ayar_barkod_tezgah_id_seq'::regclass);
 D   ALTER TABLE public.ayar_barkod_tezgah ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    195            o           2604    46484    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_barkod_urun_turu ALTER COLUMN id SET DEFAULT nextval('public.ayar_barkod_urun_turu_id_seq'::regclass);
 G   ALTER TABLE public.ayar_barkod_urun_turu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    197            p           2604    46485    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_bb_calisma_durumu ALTER COLUMN id SET DEFAULT nextval('public.ayar_bb_calisma_durumu_id_seq'::regclass);
 H   ALTER TABLE public.ayar_bb_calisma_durumu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    199            q           2604    46486    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_bb_finans_durumu ALTER COLUMN id SET DEFAULT nextval('public.ayar_bb_finans_durumu_id_seq'::regclass);
 G   ALTER TABLE public.ayar_bb_finans_durumu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    201            r           2604    46487    id    DEFAULT     ~   ALTER TABLE ONLY public.ayar_bb_firma_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_bb_firma_tipi_id_seq'::regclass);
 D   ALTER TABLE public.ayar_bb_firma_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    203            s           2604    46488    id    DEFAULT     z   ALTER TABLE ONLY public.ayar_bordro_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_bordro_tipi_id_seq'::regclass);
 B   ALTER TABLE public.ayar_bordro_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    206    205            t           2604    46489    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_cek_senet_cash_edici_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_cek_senet_cash_edici_tipi_id_seq'::regclass);
 P   ALTER TABLE public.ayar_cek_senet_cash_edici_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    208    207            u           2604    46490    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_cek_senet_tahsil_odeme_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_cek_senet_tahsil_odeme_tipi_id_seq'::regclass);
 R   ALTER TABLE public.ayar_cek_senet_tahsil_odeme_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    210    209            v           2604    46491    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_cek_senet_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_cek_senet_tipi_id_seq'::regclass);
 E   ALTER TABLE public.ayar_cek_senet_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    211            �           2604    46492    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_diger_database_bilgisi ALTER COLUMN id SET DEFAULT nextval('public.ayar_diger_database_bilgisi_id_seq'::regclass);
 M   ALTER TABLE public.ayar_diger_database_bilgisi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    214    213            �           2604    46493    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_edefter_donem_raporu ALTER COLUMN id SET DEFAULT nextval('public.ayar_edefter_donem_raporu_id_seq'::regclass);
 K   ALTER TABLE public.ayar_edefter_donem_raporu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    216    215            �           2604    46494    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_alici_bilgisi ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_alici_bilgisi_id_seq'::regclass);
 L   ALTER TABLE public.ayar_efatura_alici_bilgisi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    218    217            �           2604    46495    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_evrak_cinsi ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_evrak_cinsi_id_seq'::regclass);
 J   ALTER TABLE public.ayar_efatura_evrak_cinsi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    220    219            �           2604    46496    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_evrak_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_evrak_tipi_id_seq'::regclass);
 I   ALTER TABLE public.ayar_efatura_evrak_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    224    221            �           2604    46497    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_evrak_tipi_cinsi ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_evrak_tipi_cinsi_id_seq'::regclass);
 O   ALTER TABLE public.ayar_efatura_evrak_tipi_cinsi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    223    222            �           2604    46498    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_fatura_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_fatura_tipi_id_seq'::regclass);
 J   ALTER TABLE public.ayar_efatura_fatura_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    226    225            �           2604    46499    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_gonderici_bilgisi ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_gonderici_bilgisi_id_seq'::regclass);
 P   ALTER TABLE public.ayar_efatura_gonderici_bilgisi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    228    227            �           2604    46500    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_gonderim_sekli ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_gonderim_sekli_id_seq'::regclass);
 M   ALTER TABLE public.ayar_efatura_gonderim_sekli ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    230    229            �           2604    46501    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_ihrac_kayitli_fatura_sebebi ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_ihrac_kayitli_fatura_sebebi_id_seq'::regclass);
 Z   ALTER TABLE public.ayar_efatura_ihrac_kayitli_fatura_sebebi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    232    231            �           2604    46502    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_iletisim_kanali ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_iletisim_kanali_id_seq'::regclass);
 N   ALTER TABLE public.ayar_efatura_iletisim_kanali ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    234    233            �           2604    46503    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_istisna_kodu ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_istisna_kodu_id_seq'::regclass);
 K   ALTER TABLE public.ayar_efatura_istisna_kodu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    236    235            �           2604    47564    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_kimlik_semasi ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_kimlik_semasi_id_seq'::regclass);
 L   ALTER TABLE public.ayar_efatura_kimlik_semasi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    456    455    456            �           2604    46505    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_odeme_sekli ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_odeme_sekli_id_seq'::regclass);
 J   ALTER TABLE public.ayar_efatura_odeme_sekli ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    238    237            �           2604    46506    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_paket_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_paket_tipi_id_seq'::regclass);
 I   ALTER TABLE public.ayar_efatura_paket_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    240    239            �           2604    46507    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_response_code ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_response_code_id_seq'::regclass);
 L   ALTER TABLE public.ayar_efatura_response_code ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    242    241            �           2604    46508    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_senaryo_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_senaryo_tipi_id_seq'::regclass);
 K   ALTER TABLE public.ayar_efatura_senaryo_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    244    243            �           2604    46509    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_teslim_sarti ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_teslim_sarti_id_seq'::regclass);
 K   ALTER TABLE public.ayar_efatura_teslim_sarti ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    246    245            �           2604    46510    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_tevkifat_kodu ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_tevkifat_kodu_id_seq'::regclass);
 L   ALTER TABLE public.ayar_efatura_tevkifat_kodu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    248    247            �           2604    46511    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_efatura_vergi_kodu ALTER COLUMN id SET DEFAULT nextval('public.ayar_efatura_vergi_kodu_id_seq'::regclass);
 I   ALTER TABLE public.ayar_efatura_vergi_kodu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    250    249            �           2604    46512    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_fatura_no_serisi ALTER COLUMN id SET DEFAULT nextval('public.ayar_fatura_no_serisi_id_seq'::regclass);
 G   ALTER TABLE public.ayar_fatura_no_serisi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    252    251            �           2604    46513    id    DEFAULT     x   ALTER TABLE ONLY public.ayar_firma_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_firma_tipi_id_seq'::regclass);
 A   ALTER TABLE public.ayar_firma_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    254    253            �           2604    46514    id    DEFAULT     x   ALTER TABLE ONLY public.ayar_firma_turu ALTER COLUMN id SET DEFAULT nextval('public.ayar_firma_turu_id_seq'::regclass);
 A   ALTER TABLE public.ayar_firma_turu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    256    255            �           2604    46515    id    DEFAULT     t   ALTER TABLE ONLY public.ayar_fis_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_fis_tipi_id_seq'::regclass);
 ?   ALTER TABLE public.ayar_fis_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    258    257            �           2604    46516    id    DEFAULT     ~   ALTER TABLE ONLY public.ayar_genel_ayarlar ALTER COLUMN id SET DEFAULT nextval('public.ayar_genel_ayarlar_id_seq'::regclass);
 D   ALTER TABLE public.ayar_genel_ayarlar ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    260    259            �           2604    46517    id    DEFAULT     z   ALTER TABLE ONLY public.ayar_hane_sayisi ALTER COLUMN id SET DEFAULT nextval('public.ayar_hane_sayisi_id_seq'::regclass);
 B   ALTER TABLE public.ayar_hane_sayisi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    262    261            �           2604    46518    id    DEFAULT     x   ALTER TABLE ONLY public.ayar_hesap_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_hesap_tipi_id_seq'::regclass);
 A   ALTER TABLE public.ayar_hesap_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    264    263            �           2604    46519    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_irsaliye_fatura_no_serisi ALTER COLUMN id SET DEFAULT nextval('public.ayar_irsaliye_fatura_no_serisi_id_seq'::regclass);
 P   ALTER TABLE public.ayar_irsaliye_fatura_no_serisi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    266    265            �           2604    46520    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_irsaliye_no_serisi ALTER COLUMN id SET DEFAULT nextval('public.ayar_irsaliye_no_serisi_id_seq'::regclass);
 I   ALTER TABLE public.ayar_irsaliye_no_serisi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    268    267            �           2604    46521    id    DEFAULT     x   ALTER TABLE ONLY public.ayar_modul_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_modul_tipi_id_seq'::regclass);
 A   ALTER TABLE public.ayar_modul_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    270    269            �           2604    46522    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_musteri_firma_turu ALTER COLUMN id SET DEFAULT nextval('public.ayar_musteri_firma_turu_id_seq'::regclass);
 I   ALTER TABLE public.ayar_musteri_firma_turu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    272    271            �           2604    46523    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_odeme_baslangic_donemi ALTER COLUMN id SET DEFAULT nextval('public.ayar_odeme_baslangic_donemi_id_seq'::regclass);
 M   ALTER TABLE public.ayar_odeme_baslangic_donemi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    274    273            �           2604    46524    id    DEFAULT     z   ALTER TABLE ONLY public.ayar_odeme_sekli ALTER COLUMN id SET DEFAULT nextval('public.ayar_odeme_sekli_id_seq'::regclass);
 B   ALTER TABLE public.ayar_odeme_sekli ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    276    275            �           2604    46525    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_prs_askerlik_durumu ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_askerlik_durumu_id_seq'::regclass);
 J   ALTER TABLE public.ayar_prs_askerlik_durumu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    278    277            �           2604    46526    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_prs_ayrilma_nedeni ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_ayrilma_nedeni_id_seq'::regclass);
 I   ALTER TABLE public.ayar_prs_ayrilma_nedeni ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    280    279            �           2604    46527    id    DEFAULT     v   ALTER TABLE ONLY public.ayar_prs_birim ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_birim_id_seq'::regclass);
 @   ALTER TABLE public.ayar_prs_birim ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    282    281            �           2604    46528    id    DEFAULT     v   ALTER TABLE ONLY public.ayar_prs_bolum ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_bolum_id_seq'::regclass);
 @   ALTER TABLE public.ayar_prs_bolum ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    284    283            �           2604    46529    id    DEFAULT     |   ALTER TABLE ONLY public.ayar_prs_cinsiyet ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_cinsiyet_id_seq'::regclass);
 C   ALTER TABLE public.ayar_prs_cinsiyet ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    286    285            �           2604    47338    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_prs_egitim_seviyesi ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_egitim_seviyesi_id_seq'::regclass);
 J   ALTER TABLE public.ayar_prs_egitim_seviyesi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    438    437    438            �           2604    46531    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_prs_ehliyet_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_ehliyet_tipi_id_seq'::regclass);
 G   ALTER TABLE public.ayar_prs_ehliyet_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    288    287            �           2604    46532    id    DEFAULT     v   ALTER TABLE ONLY public.ayar_prs_gorev ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_gorev_id_seq'::regclass);
 @   ALTER TABLE public.ayar_prs_gorev ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    290    289            �           2604    46533    id    DEFAULT     ~   ALTER TABLE ONLY public.ayar_prs_izin_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_izin_tipi_id_seq'::regclass);
 D   ALTER TABLE public.ayar_prs_izin_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    292    291            �           2604    46534    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_prs_medeni_durum ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_medeni_durum_id_seq'::regclass);
 G   ALTER TABLE public.ayar_prs_medeni_durum ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    295    294            �           2604    46535    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_prs_mektup_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_mektup_tipi_id_seq'::regclass);
 F   ALTER TABLE public.ayar_prs_mektup_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    297    296            �           2604    46536    id    DEFAULT     |   ALTER TABLE ONLY public.ayar_prs_myk_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_myk_tipi_id_seq'::regclass);
 C   ALTER TABLE public.ayar_prs_myk_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    299    298            �           2604    46537    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_prs_personel_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_personel_tipi_id_seq'::regclass);
 H   ALTER TABLE public.ayar_prs_personel_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    301    300            �           2604    46538    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_prs_rapor_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_rapor_tipi_id_seq'::regclass);
 E   ALTER TABLE public.ayar_prs_rapor_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    303    302            �           2604    46539    id    DEFAULT     |   ALTER TABLE ONLY public.ayar_prs_src_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_src_tipi_id_seq'::regclass);
 C   ALTER TABLE public.ayar_prs_src_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    305    304            �           2604    46540    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_prs_tatil_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_tatil_tipi_id_seq'::regclass);
 E   ALTER TABLE public.ayar_prs_tatil_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    307    306            �           2604    46541    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_prs_yabanci_dil ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_yabanci_dil_id_seq'::regclass);
 F   ALTER TABLE public.ayar_prs_yabanci_dil ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    309    308            �           2604    46542    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_prs_yabanci_dil_seviyesi ALTER COLUMN id SET DEFAULT nextval('public.ayar_prs_yabanci_dil_seviyesi_id_seq'::regclass);
 O   ALTER TABLE public.ayar_prs_yabanci_dil_seviyesi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    311    310            �           2604    46543    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_sabit_degisken ALTER COLUMN id SET DEFAULT nextval('public.ayar_sabit_degisken_id_seq'::regclass);
 E   ALTER TABLE public.ayar_sabit_degisken ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    313    312            �           2604    46544    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_sevkiyat_hazirlama_durumu ALTER COLUMN id SET DEFAULT nextval('public.ayar_sevkiyat_hazirlama_durumu_id_seq'::regclass);
 P   ALTER TABLE public.ayar_sevkiyat_hazirlama_durumu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    315    314            �           2604    47419    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_stk_cins_ailesi ALTER COLUMN id SET DEFAULT nextval('public.ayar_stk_cins_ailesi_id_seq'::regclass);
 F   ALTER TABLE public.ayar_stk_cins_ailesi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    446    445    446            �           2604    47501    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_stk_cins_ozelligi ALTER COLUMN id SET DEFAULT nextval('public.ayar_stk_cins_ozelligi_id_seq'::regclass);
 H   ALTER TABLE public.ayar_stk_cins_ozelligi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    449    450    450            �           2604    47381    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_stk_hareket_ayari ALTER COLUMN id SET DEFAULT nextval('public.ayar_stk_hareket_ayari_id_seq'::regclass);
 H   ALTER TABLE public.ayar_stk_hareket_ayari ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    442    441    442            �           2604    47367    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_stk_hareket_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_stk_hareket_tipi_id_seq'::regclass);
 G   ALTER TABLE public.ayar_stk_hareket_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    440    439    440            �           2604    47533    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_stk_stok_grubu ALTER COLUMN id SET DEFAULT nextval('public.ayar_stk_stok_grubu_id_seq'::regclass);
 E   ALTER TABLE public.ayar_stk_stok_grubu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    451    452    452            �           2604    47480    id    DEFAULT     �   ALTER TABLE ONLY public.ayar_stk_stok_grubu_turu ALTER COLUMN id SET DEFAULT nextval('public.ayar_stk_stok_grubu_turu_id_seq'::regclass);
 J   ALTER TABLE public.ayar_stk_stok_grubu_turu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    448    447    448            �           2604    47400    id    DEFAULT     ~   ALTER TABLE ONLY public.ayar_stk_stok_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_stk_stok_tipi_id_seq'::regclass);
 D   ALTER TABLE public.ayar_stk_stok_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    444    443    444            �           2604    47548    id    DEFAULT     ~   ALTER TABLE ONLY public.ayar_stk_urun_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_stk_urun_tipi_id_seq'::regclass);
 D   ALTER TABLE public.ayar_stk_urun_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    454    453    454            �           2604    46547    id    DEFAULT     |   ALTER TABLE ONLY public.ayar_teklif_durum ALTER COLUMN id SET DEFAULT nextval('public.ayar_teklif_durum_id_seq'::regclass);
 C   ALTER TABLE public.ayar_teklif_durum ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    317    316            �           2604    46548    id    DEFAULT     z   ALTER TABLE ONLY public.ayar_teklif_tipi ALTER COLUMN id SET DEFAULT nextval('public.ayar_teklif_tipi_id_seq'::regclass);
 B   ALTER TABLE public.ayar_teklif_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    319    318            �           2604    46549    id    DEFAULT     z   ALTER TABLE ONLY public.ayar_vergi_orani ALTER COLUMN id SET DEFAULT nextval('public.ayar_vergi_orani_id_seq'::regclass);
 B   ALTER TABLE public.ayar_vergi_orani ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    321    320            �           2604    46550    id    DEFAULT     d   ALTER TABLE ONLY public.banka ALTER COLUMN id SET DEFAULT nextval('public.banka_id_seq'::regclass);
 7   ALTER TABLE public.banka ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    323    322            �           2604    46551    id    DEFAULT     r   ALTER TABLE ONLY public.banka_subesi ALTER COLUMN id SET DEFAULT nextval('public.banka_subesi_id_seq'::regclass);
 >   ALTER TABLE public.banka_subesi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    325    324            �           2604    46552    id    DEFAULT     �   ALTER TABLE ONLY public.barkod_hazirlik_dosya_turu ALTER COLUMN id SET DEFAULT nextval('public.barkod_hazirlik_dosya_turu_id_seq'::regclass);
 L   ALTER TABLE public.barkod_hazirlik_dosya_turu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    327    326            �           2604    46553    id    DEFAULT     ~   ALTER TABLE ONLY public.barkod_serino_turu ALTER COLUMN id SET DEFAULT nextval('public.barkod_serino_turu_id_seq'::regclass);
 D   ALTER TABLE public.barkod_serino_turu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    329    328            �           2604    46554    id    DEFAULT     t   ALTER TABLE ONLY public.barkod_tezgah ALTER COLUMN id SET DEFAULT nextval('public.barkod_tezgah_id_seq'::regclass);
 ?   ALTER TABLE public.barkod_tezgah ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    331    330            �           2604    46555    id    DEFAULT     p   ALTER TABLE ONLY public.bb_kayitlar ALTER COLUMN id SET DEFAULT nextval('public.bb_kayitlar_id_seq'::regclass);
 =   ALTER TABLE public.bb_kayitlar ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    333    332            
           2604    46556    id    DEFAULT     d   ALTER TABLE ONLY public.bolge ALTER COLUMN id SET DEFAULT nextval('public.bolge_id_seq'::regclass);
 7   ALTER TABLE public.bolge ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    335    334                       2604    46557    id    DEFAULT     n   ALTER TABLE ONLY public.bolge_turu ALTER COLUMN id SET DEFAULT nextval('public.bolge_turu_id_seq'::regclass);
 <   ALTER TABLE public.bolge_turu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    337    336                       2604    46558    id    DEFAULT     n   ALTER TABLE ONLY public.doviz_kuru ALTER COLUMN id SET DEFAULT nextval('public.doviz_kuru_id_seq'::regclass);
 <   ALTER TABLE public.doviz_kuru ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    339    338                       2604    46559    id    DEFAULT     p   ALTER TABLE ONLY public.hesap_grubu ALTER COLUMN id SET DEFAULT nextval('public.hesap_grubu_id_seq'::regclass);
 =   ALTER TABLE public.hesap_grubu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    341    340                       2604    46560    id    DEFAULT     p   ALTER TABLE ONLY public.hesap_karti ALTER COLUMN id SET DEFAULT nextval('public.hesap_karti_id_seq'::regclass);
 =   ALTER TABLE public.hesap_karti ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    343    342                       2604    46561    id    DEFAULT     p   ALTER TABLE ONLY public.hesap_plani ALTER COLUMN id SET DEFAULT nextval('public.hesap_plani_id_seq'::regclass);
 =   ALTER TABLE public.hesap_plani ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    345    344                       2604    46562    id    DEFAULT     r   ALTER TABLE ONLY public.medeni_durum ALTER COLUMN id SET DEFAULT nextval('public.medeni_durum_id_seq'::regclass);
 >   ALTER TABLE public.medeni_durum ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    347    346                       2604    46563    id    DEFAULT     �   ALTER TABLE ONLY public.muhasebe_hesap_plani ALTER COLUMN id SET DEFAULT nextval('public.muhasebe_hesap_plani_id_seq'::regclass);
 F   ALTER TABLE public.muhasebe_hesap_plani ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    349    348            -           2604    46564    id    DEFAULT     �   ALTER TABLE ONLY public.musteri_temsilci_grubu ALTER COLUMN id SET DEFAULT nextval('public.musteri_temsilci_grubu_id_seq'::regclass);
 H   ALTER TABLE public.musteri_temsilci_grubu ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    351    350            .           2604    46565    id    DEFAULT     p   ALTER TABLE ONLY public.olcu_birimi ALTER COLUMN id SET DEFAULT nextval('public.olcu_birimi_id_seq'::regclass);
 =   ALTER TABLE public.olcu_birimi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    353    352            0           2604    46566    id    DEFAULT     p   ALTER TABLE ONLY public.para_birimi ALTER COLUMN id SET DEFAULT nextval('public.para_birimi_id_seq'::regclass);
 =   ALTER TABLE public.para_birimi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    355    354            2           2604    46567    id    DEFAULT     �   ALTER TABLE ONLY public.personel_ayrilma_nedeni_tipi ALTER COLUMN id SET DEFAULT nextval('public.personel_ayrilma_nedeni_tipi_id_seq'::regclass);
 N   ALTER TABLE public.personel_ayrilma_nedeni_tipi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    357    356            3           2604    46568    id    DEFAULT     �   ALTER TABLE ONLY public.personel_calisma_gecmisi ALTER COLUMN id SET DEFAULT nextval('public.personel_calisma_gecmisi_id_seq'::regclass);
 J   ALTER TABLE public.personel_calisma_gecmisi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    359    358            4           2604    46569    id    DEFAULT     �   ALTER TABLE ONLY public.personel_dil_bilgisi ALTER COLUMN id SET DEFAULT nextval('public.personel_dil_bilgisi_id_seq'::regclass);
 F   ALTER TABLE public.personel_dil_bilgisi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    361    360            8           2604    46570    id    DEFAULT     v   ALTER TABLE ONLY public.personel_karti ALTER COLUMN id SET DEFAULT nextval('public.personel_karti_id_seq'::regclass);
 @   ALTER TABLE public.personel_karti ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    363    362            9           2604    46571    id    DEFAULT     ~   ALTER TABLE ONLY public.personel_pdks_kart ALTER COLUMN id SET DEFAULT nextval('public.personel_pdks_kart_id_seq'::regclass);
 D   ALTER TABLE public.personel_pdks_kart ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    365    364            :           2604    46572    id    DEFAULT     �   ALTER TABLE ONLY public.personel_tasima_servis ALTER COLUMN id SET DEFAULT nextval('public.personel_tasima_servis_id_seq'::regclass);
 H   ALTER TABLE public.personel_tasima_servis ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    367    366            ;           2604    46573    id    DEFAULT     �   ALTER TABLE ONLY public.quality_form_mail_reciever ALTER COLUMN id SET DEFAULT nextval('public.quality_form_mail_reciever_id_seq'::regclass);
 L   ALTER TABLE public.quality_form_mail_reciever ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    369    368            <           2604    46574    id    DEFAULT     f   ALTER TABLE ONLY public.recete ALTER COLUMN id SET DEFAULT nextval('public.recete_id_seq'::regclass);
 8   ALTER TABLE public.recete ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    373    370            =           2604    46575    id    DEFAULT     x   ALTER TABLE ONLY public.recete_hammadde ALTER COLUMN id SET DEFAULT nextval('public.recete_hammadde_id_seq'::regclass);
 A   ALTER TABLE public.recete_hammadde ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    372    371            >           2604    46576    id    DEFAULT     r   ALTER TABLE ONLY public.satis_fatura ALTER COLUMN id SET DEFAULT nextval('public.satis_fatura_id_seq'::regclass);
 >   ALTER TABLE public.satis_fatura ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    377    374            ?           2604    46577    id    DEFAULT     ~   ALTER TABLE ONLY public.satis_fatura_detay ALTER COLUMN id SET DEFAULT nextval('public.satis_fatura_detay_id_seq'::regclass);
 D   ALTER TABLE public.satis_fatura_detay ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    376    375            @           2604    46578    id    DEFAULT     v   ALTER TABLE ONLY public.satis_irsaliye ALTER COLUMN id SET DEFAULT nextval('public.satis_irsaliye_id_seq'::regclass);
 @   ALTER TABLE public.satis_irsaliye ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    381    378            A           2604    46579    id    DEFAULT     �   ALTER TABLE ONLY public.satis_irsaliye_detay ALTER COLUMN id SET DEFAULT nextval('public.satis_irsaliye_detay_id_seq'::regclass);
 F   ALTER TABLE public.satis_irsaliye_detay ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    380    379            B           2604    46580    id    DEFAULT     t   ALTER TABLE ONLY public.satis_siparis ALTER COLUMN id SET DEFAULT nextval('public.satis_siparis_id_seq'::regclass);
 ?   ALTER TABLE public.satis_siparis ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    385    382            C           2604    46581    id    DEFAULT     �   ALTER TABLE ONLY public.satis_siparis_detay ALTER COLUMN id SET DEFAULT nextval('public.satis_siparis_detay_id_seq'::regclass);
 E   ALTER TABLE public.satis_siparis_detay ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    384    383            O           2604    46582    id    DEFAULT     r   ALTER TABLE ONLY public.satis_teklif ALTER COLUMN id SET DEFAULT nextval('public.satis_teklif_id_seq'::regclass);
 >   ALTER TABLE public.satis_teklif ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    389    386            [           2604    46583    id    DEFAULT     ~   ALTER TABLE ONLY public.satis_teklif_detay ALTER COLUMN id SET DEFAULT nextval('public.satis_teklif_detay_id_seq'::regclass);
 D   ALTER TABLE public.satis_teklif_detay ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    388    387            \           2604    46588    id    DEFAULT     t   ALTER TABLE ONLY public.stok_hareketi ALTER COLUMN id SET DEFAULT nextval('public.stok_hareketi_id_seq'::regclass);
 ?   ALTER TABLE public.stok_hareketi ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    391    390            h           2604    46589    id    DEFAULT     n   ALTER TABLE ONLY public.stok_karti ALTER COLUMN id SET DEFAULT nextval('public.stok_karti_id_seq'::regclass);
 <   ALTER TABLE public.stok_karti ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    393    392            r           2604    46591    id    DEFAULT     �   ALTER TABLE ONLY public.sys_application_settings ALTER COLUMN id SET DEFAULT nextval('public.sys_application_settings_id_seq'::regclass);
 J   ALTER TABLE public.sys_application_settings ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    395    394            �           2604    46592    id    DEFAULT     �   ALTER TABLE ONLY public.sys_application_settings_other ALTER COLUMN id SET DEFAULT nextval('public.sys_application_settings_other_id_seq'::regclass);
 P   ALTER TABLE public.sys_application_settings_other ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    397    396            �           2604    46593    id    DEFAULT     j   ALTER TABLE ONLY public.sys_city ALTER COLUMN id SET DEFAULT nextval('public.sys_city_id_seq'::regclass);
 :   ALTER TABLE public.sys_city ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    399    398            �           2604    46594    id    DEFAULT     p   ALTER TABLE ONLY public.sys_country ALTER COLUMN id SET DEFAULT nextval('public.sys_country_id_seq'::regclass);
 =   ALTER TABLE public.sys_country ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    401    400            �           2604    46595    id    DEFAULT     ~   ALTER TABLE ONLY public.sys_grid_col_color ALTER COLUMN id SET DEFAULT nextval('public.sys_grid_col_color_id_seq'::regclass);
 D   ALTER TABLE public.sys_grid_col_color ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    403    402            �           2604    46596    id    DEFAULT     �   ALTER TABLE ONLY public.sys_grid_col_percent ALTER COLUMN id SET DEFAULT nextval('public.sys_grid_col_percent_id_seq'::regclass);
 F   ALTER TABLE public.sys_grid_col_percent ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    405    404            �           2604    46597    id    DEFAULT     ~   ALTER TABLE ONLY public.sys_grid_col_width ALTER COLUMN id SET DEFAULT nextval('public.sys_grid_col_width_id_seq'::regclass);
 D   ALTER TABLE public.sys_grid_col_width ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    407    406            �           2604    46598    id    DEFAULT     �   ALTER TABLE ONLY public.sys_grid_default_order_filter ALTER COLUMN id SET DEFAULT nextval('public.sys_grid_default_order_filter_id_seq'::regclass);
 O   ALTER TABLE public.sys_grid_default_order_filter ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    409    408            �           2604    46599    id    DEFAULT     j   ALTER TABLE ONLY public.sys_lang ALTER COLUMN id SET DEFAULT nextval('public.sys_lang_id_seq'::regclass);
 :   ALTER TABLE public.sys_lang ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    415    410            �           2604    46600    id    DEFAULT     �   ALTER TABLE ONLY public.sys_lang_data_content ALTER COLUMN id SET DEFAULT nextval('public.sys_lang_data_content_id_seq'::regclass);
 G   ALTER TABLE public.sys_lang_data_content ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    412    411            �           2604    46601    id    DEFAULT     �   ALTER TABLE ONLY public.sys_lang_gui_content ALTER COLUMN id SET DEFAULT nextval('public.sys_lang_gui_content_id_seq'::regclass);
 F   ALTER TABLE public.sys_lang_gui_content ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    414    413            �           2604    46602    id    DEFAULT     �   ALTER TABLE ONLY public.sys_multi_lang_data_table_list ALTER COLUMN id SET DEFAULT nextval('public.sys_multi_lang_data_table_list_id_seq'::regclass);
 P   ALTER TABLE public.sys_multi_lang_data_table_list ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    417    416            �           2604    46603    id    DEFAULT     �   ALTER TABLE ONLY public.sys_permission_source ALTER COLUMN id SET DEFAULT nextval('public.sys_permission_source_id_seq'::regclass);
 G   ALTER TABLE public.sys_permission_source ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    421    418            �           2604    46604    id    DEFAULT     �   ALTER TABLE ONLY public.sys_permission_source_group ALTER COLUMN id SET DEFAULT nextval('public.sys_permission_source_group_id_seq'::regclass);
 M   ALTER TABLE public.sys_permission_source_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    420    419            �           2604    46605    id    DEFAULT     �   ALTER TABLE ONLY public.sys_quality_form_number ALTER COLUMN id SET DEFAULT nextval('public.sys_quality_form_number_id_seq'::regclass);
 I   ALTER TABLE public.sys_quality_form_number ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    423    422            �           2604    46606    id    DEFAULT     |   ALTER TABLE ONLY public.sys_taxpayer_type ALTER COLUMN id SET DEFAULT nextval('public.sys_taxpayer_type_id_seq'::regclass);
 C   ALTER TABLE public.sys_taxpayer_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    425    424            �           2604    46607    id    DEFAULT     j   ALTER TABLE ONLY public.sys_user ALTER COLUMN id SET DEFAULT nextval('public.sys_user_id_seq'::regclass);
 :   ALTER TABLE public.sys_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    429    426            �           2604    46608    id    DEFAULT     �   ALTER TABLE ONLY public.sys_user_access_right ALTER COLUMN id SET DEFAULT nextval('public.sys_user_access_right_id_seq'::regclass);
 G   ALTER TABLE public.sys_user_access_right ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    428    427            �           2604    46609    id    DEFAULT     �   ALTER TABLE ONLY public.sys_user_mac_address_exception ALTER COLUMN id SET DEFAULT nextval('public.sys_user_mac_address_exception_id_seq'::regclass);
 P   ALTER TABLE public.sys_user_mac_address_exception ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    431    430            �           2604    46610    id    DEFAULT     �   ALTER TABLE ONLY public.urun_kabul_red_nedeni ALTER COLUMN id SET DEFAULT nextval('public.urun_kabul_red_nedeni_id_seq'::regclass);
 G   ALTER TABLE public.urun_kabul_red_nedeni ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    436    435            |          0    45450    adres 
   TABLE DATA               �   COPY public.adres (id, ulke_id, sehir_id, ilce, mahalle, cadde, sokak, bina, kapi_no, posta_kutusu, posta_kodu, web_sitesi, eposta_adresi) FROM stdin;
    public       postgres    false    181   Y�      �           0    0    adres_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.adres_id_seq', 56, true);
            public       postgres    false    182            ~          0    45458    alis_teklif 
   TABLE DATA               �  COPY public.alis_teklif (id, teklif_no, teklif_tarihi, cari_kod, firma, vergi_dairesi, vergi_no, aciklama, referans, teslim_tarihi, son_gecerlilik_tarihi, para_birimi, odeme_baslangic_donemi, toplam_tutar, toplam_iskonto_tutar, toplam_kdv_tutar, genel_toplam, musteri_temsilcisi_id, ulke, sehir, adres, posta_kodu, yurtici_ihracat, ortalama_opsiyon, fatura_tipi, tevkifat_kodu, ihrac_kayit_kodu, tevkifat_pay, tevkifat_payda, genel_iskonto_orani, genel_iskonto_tutar, is_e_fatura, siparislesti) FROM stdin;
    public       postgres    false    183   ��                0    45471    alis_teklif_detay 
   TABLE DATA               :   COPY public.alis_teklif_detay (id, header_id) FROM stdin;
    public       postgres    false    184   ϛ      �           0    0    alis_teklif_detay_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.alis_teklif_detay_id_seq', 1, false);
            public       postgres    false    185            �           0    0    alis_teklif_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.alis_teklif_id_seq', 6, true);
            public       postgres    false    186            �          0    45478    ambar 
   TABLE DATA               �   COPY public.ambar (id, ambar_adi, is_varsayilan_hammadde_ambari, is_varsayilan_uretim_ambari, is_varsayilan_satis_ambari) FROM stdin;
    public       postgres    false    187   �      �           0    0    ambar_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.ambar_id_seq', 2, true);
            public       postgres    false    188            �          0    45486    arc_arac 
   TABLE DATA               �   COPY public.arc_arac (id, marka, model, plaka, renk, gelis_tarihi, gelis_km, gelis_yeri, aciklama, is_active, aktif_km, aktif_konum) FROM stdin;
    public       postgres    false    189   $�      �           0    0    arc_arac_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.arc_arac_id_seq', 1, true);
            public       postgres    false    190            �          0    45492    ayar_barkod_hazirlik_dosya_turu 
   TABLE DATA               B   COPY public.ayar_barkod_hazirlik_dosya_turu (id, tur) FROM stdin;
    public       postgres    false    191   ��      �           0    0 &   ayar_barkod_hazirlik_dosya_turu_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.ayar_barkod_hazirlik_dosya_turu_id_seq', 3, true);
            public       postgres    false    192            �          0    45497    ayar_barkod_serino_turu 
   TABLE DATA               D   COPY public.ayar_barkod_serino_turu (id, tur, aciklama) FROM stdin;
    public       postgres    false    193   ߜ      �           0    0    ayar_barkod_serino_turu_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.ayar_barkod_serino_turu_id_seq', 3, true);
            public       postgres    false    194            �          0    45502    ayar_barkod_tezgah 
   TABLE DATA               F   COPY public.ayar_barkod_tezgah (id, tezgah_adi, ambar_id) FROM stdin;
    public       postgres    false    195   �      �           0    0    ayar_barkod_tezgah_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.ayar_barkod_tezgah_id_seq', 1, true);
            public       postgres    false    196            �          0    45507    ayar_barkod_urun_turu 
   TABLE DATA               8   COPY public.ayar_barkod_urun_turu (id, tur) FROM stdin;
    public       postgres    false    197   :�      �           0    0    ayar_barkod_urun_turu_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.ayar_barkod_urun_turu_id_seq', 2, true);
            public       postgres    false    198            �          0    45512    ayar_bb_calisma_durumu 
   TABLE DATA               D   COPY public.ayar_bb_calisma_durumu (id, calisma_durumu) FROM stdin;
    public       postgres    false    199   k�      �           0    0    ayar_bb_calisma_durumu_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.ayar_bb_calisma_durumu_id_seq', 1, false);
            public       postgres    false    200            �          0    45517    ayar_bb_finans_durumu 
   TABLE DATA               B   COPY public.ayar_bb_finans_durumu (id, finans_durumu) FROM stdin;
    public       postgres    false    201   ��      �           0    0    ayar_bb_finans_durumu_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.ayar_bb_finans_durumu_id_seq', 1, false);
            public       postgres    false    202            �          0    45522    ayar_bb_firma_tipi 
   TABLE DATA               <   COPY public.ayar_bb_firma_tipi (id, firma_tipi) FROM stdin;
    public       postgres    false    203   ��      �           0    0    ayar_bb_firma_tipi_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.ayar_bb_firma_tipi_id_seq', 1, false);
            public       postgres    false    204            �          0    45527    ayar_bordro_tipi 
   TABLE DATA               5   COPY public.ayar_bordro_tipi (id, deger) FROM stdin;
    public       postgres    false    205         �           0    0    ayar_bordro_tipi_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.ayar_bordro_tipi_id_seq', 1, false);
            public       postgres    false    206            �          0    45532    ayar_cek_senet_cash_edici_tipi 
   TABLE DATA               C   COPY public.ayar_cek_senet_cash_edici_tipi (id, deger) FROM stdin;
    public       postgres    false    207   ߝ      �           0    0 %   ayar_cek_senet_cash_edici_tipi_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.ayar_cek_senet_cash_edici_tipi_id_seq', 1, false);
            public       postgres    false    208            �          0    45537     ayar_cek_senet_tahsil_odeme_tipi 
   TABLE DATA               E   COPY public.ayar_cek_senet_tahsil_odeme_tipi (id, deger) FROM stdin;
    public       postgres    false    209   ��      �           0    0 '   ayar_cek_senet_tahsil_odeme_tipi_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.ayar_cek_senet_tahsil_odeme_tipi_id_seq', 1, false);
            public       postgres    false    210            �          0    45542    ayar_cek_senet_tipi 
   TABLE DATA               8   COPY public.ayar_cek_senet_tipi (id, deger) FROM stdin;
    public       postgres    false    211   �      �           0    0    ayar_cek_senet_tipi_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.ayar_cek_senet_tipi_id_seq', 1, false);
            public       postgres    false    212            �          0    45547    ayar_diger_database_bilgisi 
   TABLE DATA               1  COPY public.ayar_diger_database_bilgisi (id, db_name, host_name, db_user, db_pass, db_port, firma_adi, is_aybey_teklif_hesapla, is_bulut_teklif_hesapla, is_maliyet_analiz, is_siparis_kopyala, is_otomatik_doviz_kaydet, is_staff_personel_bilgisi, is_uretim_takip, is_pano_uretim, is_nakit_akis) FROM stdin;
    public       postgres    false    213   6�      �           0    0 "   ayar_diger_database_bilgisi_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.ayar_diger_database_bilgisi_id_seq', 1, false);
            public       postgres    false    214            �          0    45561    ayar_edefter_donem_raporu 
   TABLE DATA               �   COPY public.ayar_edefter_donem_raporu (id, rapor_baslangic_donemi, rapor_bitis_donemi, rapor_alma_tarihi, yevmiye_no_baslangic, yevmiye_no_bitis) FROM stdin;
    public       postgres    false    215   S�      �           0    0     ayar_edefter_donem_raporu_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.ayar_edefter_donem_raporu_id_seq', 1, false);
            public       postgres    false    216            �          0    45566    ayar_efatura_alici_bilgisi 
   TABLE DATA               �   COPY public.ayar_efatura_alici_bilgisi (id, alias, title, type_, first_creation_time, alias_creation_time, register_time, identifier) FROM stdin;
    public       postgres    false    217   p�      �           0    0 !   ayar_efatura_alici_bilgisi_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.ayar_efatura_alici_bilgisi_id_seq', 1, false);
            public       postgres    false    218            �          0    45574    ayar_efatura_evrak_cinsi 
   TABLE DATA               C   COPY public.ayar_efatura_evrak_cinsi (id, evrak_cinsi) FROM stdin;
    public       postgres    false    219   ��      �           0    0    ayar_efatura_evrak_cinsi_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.ayar_efatura_evrak_cinsi_id_seq', 1, false);
            public       postgres    false    220            �          0    45579    ayar_efatura_evrak_tipi 
   TABLE DATA               A   COPY public.ayar_efatura_evrak_tipi (id, evrak_tipi) FROM stdin;
    public       postgres    false    221   ��      �          0    45582    ayar_efatura_evrak_tipi_cinsi 
   TABLE DATA               Z   COPY public.ayar_efatura_evrak_tipi_cinsi (id, evrak_tipi_id, evrak_cinsi_id) FROM stdin;
    public       postgres    false    222   Ǟ      �           0    0 $   ayar_efatura_evrak_tipi_cinsi_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.ayar_efatura_evrak_tipi_cinsi_id_seq', 1, false);
            public       postgres    false    223            �           0    0    ayar_efatura_evrak_tipi_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.ayar_efatura_evrak_tipi_id_seq', 1, false);
            public       postgres    false    224            �          0    45589    ayar_efatura_fatura_tipi 
   TABLE DATA               ;   COPY public.ayar_efatura_fatura_tipi (id, tip) FROM stdin;
    public       postgres    false    225   �      �           0    0    ayar_efatura_fatura_tipi_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.ayar_efatura_fatura_tipi_id_seq', 7, true);
            public       postgres    false    226            �          0    45594    ayar_efatura_gonderici_bilgisi 
   TABLE DATA               �   COPY public.ayar_efatura_gonderici_bilgisi (id, alias, title, type_, first_creation_time, alias_creation_time, register_time, identifier) FROM stdin;
    public       postgres    false    227   =�      �           0    0 %   ayar_efatura_gonderici_bilgisi_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.ayar_efatura_gonderici_bilgisi_id_seq', 1, false);
            public       postgres    false    228            �          0    45602    ayar_efatura_gonderim_sekli 
   TABLE DATA               \   COPY public.ayar_efatura_gonderim_sekli (id, kod, kod_adi, aciklama, is_active) FROM stdin;
    public       postgres    false    229   Z�      �           0    0 "   ayar_efatura_gonderim_sekli_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.ayar_efatura_gonderim_sekli_id_seq', 1, false);
            public       postgres    false    230            �          0    45611 (   ayar_efatura_ihrac_kayitli_fatura_sebebi 
   TABLE DATA               U   COPY public.ayar_efatura_ihrac_kayitli_fatura_sebebi (id, kod, aciklama) FROM stdin;
    public       postgres    false    231   w�      �           0    0 /   ayar_efatura_ihrac_kayitli_fatura_sebebi_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.ayar_efatura_ihrac_kayitli_fatura_sebebi_id_seq', 1, false);
            public       postgres    false    232            �          0    45616    ayar_efatura_iletisim_kanali 
   TABLE DATA               I   COPY public.ayar_efatura_iletisim_kanali (id, kod, aciklama) FROM stdin;
    public       postgres    false    233   ��      �           0    0 #   ayar_efatura_iletisim_kanali_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.ayar_efatura_iletisim_kanali_id_seq', 92, true);
            public       postgres    false    234            �          0    45624    ayar_efatura_istisna_kodu 
   TABLE DATA               e   COPY public.ayar_efatura_istisna_kodu (id, kod, aciklama, is_tam_istisna, fatura_tip_id) FROM stdin;
    public       postgres    false    235   g�      �           0    0     ayar_efatura_istisna_kodu_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.ayar_efatura_istisna_kodu_id_seq', 65, true);
            public       postgres    false    236            �          0    47561    ayar_efatura_kimlik_semasi 
   TABLE DATA               T   COPY public.ayar_efatura_kimlik_semasi (id, deger, aciklama, is_active) FROM stdin;
    public       postgres    false    456   =�      �           0    0 !   ayar_efatura_kimlik_semasi_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.ayar_efatura_kimlik_semasi_id_seq', 2, true);
            public       postgres    false    455            �          0    45638    ayar_efatura_odeme_sekli 
   TABLE DATA               i   COPY public.ayar_efatura_odeme_sekli (id, kod, odeme_sekli, aciklama, is_efatura, is_active) FROM stdin;
    public       postgres    false    237   ��      �           0    0    ayar_efatura_odeme_sekli_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.ayar_efatura_odeme_sekli_id_seq', 1, false);
            public       postgres    false    238            �          0    45648    ayar_efatura_paket_tipi 
   TABLE DATA               Z   COPY public.ayar_efatura_paket_tipi (id, kod, paket_adi, aciklama, is_active) FROM stdin;
    public       postgres    false    239   ��      �           0    0    ayar_efatura_paket_tipi_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.ayar_efatura_paket_tipi_id_seq', 1, false);
            public       postgres    false    240            �          0    45657    ayar_efatura_response_code 
   TABLE DATA               ?   COPY public.ayar_efatura_response_code (id, deger) FROM stdin;
    public       postgres    false    241   ʰ      �           0    0 !   ayar_efatura_response_code_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.ayar_efatura_response_code_id_seq', 3, true);
            public       postgres    false    242            �          0    45662    ayar_efatura_senaryo_tipi 
   TABLE DATA               F   COPY public.ayar_efatura_senaryo_tipi (id, tip, aciklama) FROM stdin;
    public       postgres    false    243   ��      �           0    0     ayar_efatura_senaryo_tipi_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.ayar_efatura_senaryo_tipi_id_seq', 5, true);
            public       postgres    false    244            �          0    45667    ayar_efatura_teslim_sarti 
   TABLE DATA               ]   COPY public.ayar_efatura_teslim_sarti (id, kod, aciklama, is_efatura, is_active) FROM stdin;
    public       postgres    false    245   ��      �           0    0     ayar_efatura_teslim_sarti_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.ayar_efatura_teslim_sarti_id_seq', 1, false);
            public       postgres    false    246            �          0    45674    ayar_efatura_tevkifat_kodu 
   TABLE DATA               V   COPY public.ayar_efatura_tevkifat_kodu (id, kodu, adi, orani, pay, payda) FROM stdin;
    public       postgres    false    247   ��      �           0    0 !   ayar_efatura_tevkifat_kodu_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.ayar_efatura_tevkifat_kodu_id_seq', 1, false);
            public       postgres    false    248            �          0    45679    ayar_efatura_vergi_kodu 
   TABLE DATA               T   COPY public.ayar_efatura_vergi_kodu (id, kodu, adi, kisaltma, tevkifat) FROM stdin;
    public       postgres    false    249   F�      �           0    0    ayar_efatura_vergi_kodu_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.ayar_efatura_vergi_kodu_id_seq', 27, true);
            public       postgres    false    250            �          0    45685    ayar_fatura_no_serisi 
   TABLE DATA               J   COPY public.ayar_fatura_no_serisi (id, fatura_seri_id, deger) FROM stdin;
    public       postgres    false    251   �      �           0    0    ayar_fatura_no_serisi_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.ayar_fatura_no_serisi_id_seq', 1, false);
            public       postgres    false    252            �          0    45690    ayar_firma_tipi 
   TABLE DATA               H   COPY public.ayar_firma_tipi (id, firma_turu_id, firma_tipi) FROM stdin;
    public       postgres    false    253   �      �           0    0    ayar_firma_tipi_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ayar_firma_tipi_id_seq', 6, true);
            public       postgres    false    254            �          0    45695    ayar_firma_turu 
   TABLE DATA               2   COPY public.ayar_firma_turu (id, tur) FROM stdin;
    public       postgres    false    255   r�      �           0    0    ayar_firma_turu_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ayar_firma_turu_id_seq', 3, true);
            public       postgres    false    256            �          0    45700    ayar_fis_tipi 
   TABLE DATA               2   COPY public.ayar_fis_tipi (id, deger) FROM stdin;
    public       postgres    false    257   ��      �           0    0    ayar_fis_tipi_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.ayar_fis_tipi_id_seq', 1, false);
            public       postgres    false    258            �          0    45705    ayar_genel_ayarlar 
   TABLE DATA               j   COPY public.ayar_genel_ayarlar (id, donem, unvan, vergi_no, tc_no, firma_tipi, diger_ayarlar) FROM stdin;
    public       postgres    false    259   ��      �           0    0    ayar_genel_ayarlar_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.ayar_genel_ayarlar_id_seq', 1, true);
            public       postgres    false    260            �          0    45713    ayar_hane_sayisi 
   TABLE DATA               �   COPY public.ayar_hane_sayisi (id, hesap_bakiye, alis_miktar, alis_fiyat, alis_tutar, satis_miktar, satis_fiyat, satis_tutar, stok_miktar, stok_fiyat) FROM stdin;
    public       postgres    false    261   -�      �           0    0    ayar_hane_sayisi_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.ayar_hane_sayisi_id_seq', 1, true);
            public       postgres    false    262            �          0    45727    ayar_hesap_tipi 
   TABLE DATA               9   COPY public.ayar_hesap_tipi (id, hesap_tipi) FROM stdin;
    public       postgres    false    263   Y�      �           0    0    ayar_hesap_tipi_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ayar_hesap_tipi_id_seq', 3, true);
            public       postgres    false    264            �          0    45732    ayar_irsaliye_fatura_no_serisi 
   TABLE DATA               [   COPY public.ayar_irsaliye_fatura_no_serisi (id, deger, is_fatura, is_irsaliye) FROM stdin;
    public       postgres    false    265   ��      �           0    0 %   ayar_irsaliye_fatura_no_serisi_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.ayar_irsaliye_fatura_no_serisi_id_seq', 1, false);
            public       postgres    false    266            �          0    45739    ayar_irsaliye_no_serisi 
   TABLE DATA               N   COPY public.ayar_irsaliye_no_serisi (id, irsaliye_seri_id, deger) FROM stdin;
    public       postgres    false    267   ��      �           0    0    ayar_irsaliye_no_serisi_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.ayar_irsaliye_no_serisi_id_seq', 1, false);
            public       postgres    false    268            �          0    45744    ayar_modul_tipi 
   TABLE DATA               4   COPY public.ayar_modul_tipi (id, deger) FROM stdin;
    public       postgres    false    269   º      �           0    0    ayar_modul_tipi_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ayar_modul_tipi_id_seq', 4, true);
            public       postgres    false    270            �          0    45749    ayar_musteri_firma_turu 
   TABLE DATA               <   COPY public.ayar_musteri_firma_turu (id, deger) FROM stdin;
    public       postgres    false    271   �      �           0    0    ayar_musteri_firma_turu_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.ayar_musteri_firma_turu_id_seq', 1, false);
            public       postgres    false    272            �          0    45754    ayar_odeme_baslangic_donemi 
   TABLE DATA               U   COPY public.ayar_odeme_baslangic_donemi (id, deger, aciklama, is_active) FROM stdin;
    public       postgres    false    273   )�      �           0    0 "   ayar_odeme_baslangic_donemi_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.ayar_odeme_baslangic_donemi_id_seq', 8, true);
            public       postgres    false    274            �          0    45760    ayar_odeme_sekli 
   TABLE DATA               a   COPY public.ayar_odeme_sekli (id, kod, odeme_sekli, aciklama, is_efatura, is_active) FROM stdin;
    public       postgres    false    275   ��      �           0    0    ayar_odeme_sekli_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.ayar_odeme_sekli_id_seq', 1, false);
            public       postgres    false    276            �          0    45770    ayar_prs_askerlik_durumu 
   TABLE DATA               G   COPY public.ayar_prs_askerlik_durumu (id, askerlik_durumu) FROM stdin;
    public       postgres    false    277   ��      �           0    0    ayar_prs_askerlik_durumu_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.ayar_prs_askerlik_durumu_id_seq', 4, true);
            public       postgres    false    278            �          0    45775    ayar_prs_ayrilma_nedeni 
   TABLE DATA               E   COPY public.ayar_prs_ayrilma_nedeni (id, ayrilma_nedeni) FROM stdin;
    public       postgres    false    279   ��      �           0    0    ayar_prs_ayrilma_nedeni_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.ayar_prs_ayrilma_nedeni_id_seq', 4, true);
            public       postgres    false    280            �          0    45780    ayar_prs_birim 
   TABLE DATA               =   COPY public.ayar_prs_birim (id, birim, bolum_id) FROM stdin;
    public       postgres    false    281   l�      �           0    0    ayar_prs_birim_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ayar_prs_birim_id_seq', 21, true);
            public       postgres    false    282            �          0    45785    ayar_prs_bolum 
   TABLE DATA               3   COPY public.ayar_prs_bolum (id, bolum) FROM stdin;
    public       postgres    false    283   �      �           0    0    ayar_prs_bolum_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ayar_prs_bolum_id_seq', 27, true);
            public       postgres    false    284            �          0    45790    ayar_prs_cinsiyet 
   TABLE DATA               A   COPY public.ayar_prs_cinsiyet (id, cinsiyet, is_man) FROM stdin;
    public       postgres    false    285   ��      �           0    0    ayar_prs_cinsiyet_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.ayar_prs_cinsiyet_id_seq', 2, true);
            public       postgres    false    286            z          0    47335    ayar_prs_egitim_seviyesi 
   TABLE DATA               G   COPY public.ayar_prs_egitim_seviyesi (id, egitim_seviyesi) FROM stdin;
    public       postgres    false    438   ˽      �           0    0    ayar_prs_egitim_seviyesi_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.ayar_prs_egitim_seviyesi_id_seq', 7, true);
            public       postgres    false    437            �          0    45801    ayar_prs_ehliyet_tipi 
   TABLE DATA               A   COPY public.ayar_prs_ehliyet_tipi (id, ehliyet_tipi) FROM stdin;
    public       postgres    false    287   (�      �           0    0    ayar_prs_ehliyet_tipi_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.ayar_prs_ehliyet_tipi_id_seq', 17, true);
            public       postgres    false    288            �          0    45806    ayar_prs_gorev 
   TABLE DATA               3   COPY public.ayar_prs_gorev (id, gorev) FROM stdin;
    public       postgres    false    289   ��      �           0    0    ayar_prs_gorev_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.ayar_prs_gorev_id_seq', 9, true);
            public       postgres    false    290            �          0    45811    ayar_prs_izin_tipi 
   TABLE DATA               ;   COPY public.ayar_prs_izin_tipi (id, izin_tipi) FROM stdin;
    public       postgres    false    291   Ѿ      �           0    0    ayar_prs_izin_tipi_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.ayar_prs_izin_tipi_id_seq', 2, true);
            public       postgres    false    292            �           0    0    ayar_prs_kan_grubu_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.ayar_prs_kan_grubu_id_seq', 8, false);
            public       postgres    false    293            �          0    45818    ayar_prs_medeni_durum 
   TABLE DATA               M   COPY public.ayar_prs_medeni_durum (id, medeni_durum, is_married) FROM stdin;
    public       postgres    false    294   �      �           0    0    ayar_prs_medeni_durum_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.ayar_prs_medeni_durum_id_seq', 2, true);
            public       postgres    false    295            �          0    45824    ayar_prs_mektup_tipi 
   TABLE DATA               ?   COPY public.ayar_prs_mektup_tipi (id, mektup_tipi) FROM stdin;
    public       postgres    false    296   2�      �           0    0    ayar_prs_mektup_tipi_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.ayar_prs_mektup_tipi_id_seq', 2, true);
            public       postgres    false    297            �          0    45829    ayar_prs_myk_tipi 
   TABLE DATA               9   COPY public.ayar_prs_myk_tipi (id, myk_tipi) FROM stdin;
    public       postgres    false    298   a�      �           0    0    ayar_prs_myk_tipi_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.ayar_prs_myk_tipi_id_seq', 2, true);
            public       postgres    false    299            �          0    45834    ayar_prs_personel_tipi 
   TABLE DATA               N   COPY public.ayar_prs_personel_tipi (id, personel_tipi, is_active) FROM stdin;
    public       postgres    false    300   ��      �           0    0    ayar_prs_personel_tipi_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.ayar_prs_personel_tipi_id_seq', 2, true);
            public       postgres    false    301            �          0    45840    ayar_prs_rapor_tipi 
   TABLE DATA               =   COPY public.ayar_prs_rapor_tipi (id, rapor_tipi) FROM stdin;
    public       postgres    false    302   ѿ      �           0    0    ayar_prs_rapor_tipi_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.ayar_prs_rapor_tipi_id_seq', 3, true);
            public       postgres    false    303            �          0    45845    ayar_prs_src_tipi 
   TABLE DATA               9   COPY public.ayar_prs_src_tipi (id, src_tipi) FROM stdin;
    public       postgres    false    304   �      �           0    0    ayar_prs_src_tipi_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.ayar_prs_src_tipi_id_seq', 4, true);
            public       postgres    false    305            �          0    45850    ayar_prs_tatil_tipi 
   TABLE DATA               M   COPY public.ayar_prs_tatil_tipi (id, tatil_tipi, is_resmi_tatil) FROM stdin;
    public       postgres    false    306   M�      �           0    0    ayar_prs_tatil_tipi_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.ayar_prs_tatil_tipi_id_seq', 8, true);
            public       postgres    false    307            �          0    45856    ayar_prs_yabanci_dil 
   TABLE DATA               ?   COPY public.ayar_prs_yabanci_dil (id, yabanci_dil) FROM stdin;
    public       postgres    false    308   ��      �           0    0    ayar_prs_yabanci_dil_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.ayar_prs_yabanci_dil_id_seq', 3, true);
            public       postgres    false    309            �          0    45861    ayar_prs_yabanci_dil_seviyesi 
   TABLE DATA               Q   COPY public.ayar_prs_yabanci_dil_seviyesi (id, yabanci_dil_seviyesi) FROM stdin;
    public       postgres    false    310   �      �           0    0 $   ayar_prs_yabanci_dil_seviyesi_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.ayar_prs_yabanci_dil_seviyesi_id_seq', 4, true);
            public       postgres    false    311            �          0    45866    ayar_sabit_degisken 
   TABLE DATA               8   COPY public.ayar_sabit_degisken (id, deger) FROM stdin;
    public       postgres    false    312   U�      �           0    0    ayar_sabit_degisken_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.ayar_sabit_degisken_id_seq', 2, true);
            public       postgres    false    313                      0    45871    ayar_sevkiyat_hazirlama_durumu 
   TABLE DATA               C   COPY public.ayar_sevkiyat_hazirlama_durumu (id, deger) FROM stdin;
    public       postgres    false    314   ��      �           0    0 %   ayar_sevkiyat_hazirlama_durumu_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.ayar_sevkiyat_hazirlama_durumu_id_seq', 1, false);
            public       postgres    false    315            �          0    47416    ayar_stk_cins_ailesi 
   TABLE DATA               8   COPY public.ayar_stk_cins_ailesi (id, aile) FROM stdin;
    public       postgres    false    446   ��      �           0    0    ayar_stk_cins_ailesi_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.ayar_stk_cins_ailesi_id_seq', 1, true);
            public       postgres    false    445            �          0    47498    ayar_stk_cins_ozelligi 
   TABLE DATA               �   COPY public.ayar_stk_cins_ozelligi (id, ayar_stk_cins_aile_id, cins, aciklama, string1, string2, string3, string4, string5, string6, string7, string8, string9, string10, string11, string12) FROM stdin;
    public       postgres    false    450   ��      �           0    0    ayar_stk_cins_ozelligi_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.ayar_stk_cins_ozelligi_id_seq', 2, true);
            public       postgres    false    449            ~          0    47378    ayar_stk_hareket_ayari 
   TABLE DATA               N   COPY public.ayar_stk_hareket_ayari (id, giris_ayari, cikis_ayari) FROM stdin;
    public       postgres    false    442   [�      �           0    0    ayar_stk_hareket_ayari_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.ayar_stk_hareket_ayari_id_seq', 1, true);
            public       postgres    false    441            |          0    47364    ayar_stk_hareket_tipi 
   TABLE DATA               D   COPY public.ayar_stk_hareket_tipi (id, deger, is_input) FROM stdin;
    public       postgres    false    440   ��      �           0    0    ayar_stk_hareket_tipi_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.ayar_stk_hareket_tipi_id_seq', 2, true);
            public       postgres    false    439            �          0    47530    ayar_stk_stok_grubu 
   TABLE DATA               5  COPY public.ayar_stk_stok_grubu (id, ayar_stk_stok_grubu_turu_id, grup, alis_hesabi, alis_iade_hesabi, satis_hesabi, satis_iade_hesabi, ihracat_hesabi, hammadde_hesabi, mamul_hesabi, kdv_orani, is_iskonto_aktif, iskonto_satis, iskonto_mudur, is_satis_fiyatini_kullan, is_maliyet_analiz_farkli_db) FROM stdin;
    public       postgres    false    452   ��      �           0    0    ayar_stk_stok_grubu_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.ayar_stk_stok_grubu_id_seq', 1, false);
            public       postgres    false    451            �          0    47477    ayar_stk_stok_grubu_turu 
   TABLE DATA               F   COPY public.ayar_stk_stok_grubu_turu (id, stok_grubu_tur) FROM stdin;
    public       postgres    false    448   ��      �           0    0    ayar_stk_stok_grubu_turu_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.ayar_stk_stok_grubu_turu_id_seq', 1, true);
            public       postgres    false    447            �          0    47397    ayar_stk_stok_tipi 
   TABLE DATA               W   COPY public.ayar_stk_stok_tipi (id, tip, is_default, is_stok_hareketi_yap) FROM stdin;
    public       postgres    false    444   	�      �           0    0    ayar_stk_stok_tipi_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.ayar_stk_stok_tipi_id_seq', 3, true);
            public       postgres    false    443            �          0    47545    ayar_stk_urun_tipi 
   TABLE DATA               5   COPY public.ayar_stk_urun_tipi (id, tip) FROM stdin;
    public       postgres    false    454   M�      �           0    0    ayar_stk_urun_tipi_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.ayar_stk_urun_tipi_id_seq', 3, true);
            public       postgres    false    453                      0    45887    ayar_teklif_durum 
   TABLE DATA               K   COPY public.ayar_teklif_durum (id, deger, aciklama, is_active) FROM stdin;
    public       postgres    false    316   ��                  0    0    ayar_teklif_durum_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.ayar_teklif_durum_id_seq', 11, true);
            public       postgres    false    317                      0    45893    ayar_teklif_tipi 
   TABLE DATA               J   COPY public.ayar_teklif_tipi (id, deger, aciklama, is_active) FROM stdin;
    public       postgres    false    318   ��                 0    0    ayar_teklif_tipi_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.ayar_teklif_tipi_id_seq', 2, true);
            public       postgres    false    319                      0    45899    ayar_vergi_orani 
   TABLE DATA               �   COPY public.ayar_vergi_orani (id, vergi_orani, satis_vergi_hesap_kodu, satis_iade_vergi_hesap_kodu, alis_vergi_hesap_kodu, alis_iade_vergi_hesap_kodu) FROM stdin;
    public       postgres    false    320   &�                 0    0    ayar_vergi_orani_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.ayar_vergi_orani_id_seq', 9, true);
            public       postgres    false    321            	          0    45904    banka 
   TABLE DATA               ?   COPY public.banka (id, adi, swift_kodu, is_active) FROM stdin;
    public       postgres    false    322   U�                 0    0    banka_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.banka_id_seq', 1, true);
            public       postgres    false    323                      0    45910    banka_subesi 
   TABLE DATA               U   COPY public.banka_subesi (id, banka_id, sube_kodu, sube_adi, sube_il_id) FROM stdin;
    public       postgres    false    324   ��                 0    0    banka_subesi_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.banka_subesi_id_seq', 3, true);
            public       postgres    false    325                      0    45915    barkod_hazirlik_dosya_turu 
   TABLE DATA               =   COPY public.barkod_hazirlik_dosya_turu (id, tur) FROM stdin;
    public       postgres    false    326   ��                 0    0 !   barkod_hazirlik_dosya_turu_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.barkod_hazirlik_dosya_turu_id_seq', 1, false);
            public       postgres    false    327                      0    45920    barkod_serino_turu 
   TABLE DATA               ?   COPY public.barkod_serino_turu (id, tur, aciklama) FROM stdin;
    public       postgres    false    328   ��                 0    0    barkod_serino_turu_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.barkod_serino_turu_id_seq', 1, false);
            public       postgres    false    329                      0    45925    barkod_tezgah 
   TABLE DATA               A   COPY public.barkod_tezgah (id, tezgah_adi, ambar_id) FROM stdin;
    public       postgres    false    330   ��                 0    0    barkod_tezgah_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.barkod_tezgah_id_seq', 1, false);
            public       postgres    false    331                      0    45930    bb_kayitlar 
   TABLE DATA               �  COPY public.bb_kayitlar (id, firma_adi, tel1, tel2, tel3, fax, email, web, yetkili1, yetkili1_tel, yetkili1_email, yetkili2, yetkili2_tel, yetkili2_email, merkez_adres, merkez_semt, merkez_il, sube_adres, sube_semt, sube_il, not1, not2, not3, firma_tipi, calisma_durumu, kac_yillik_firma, vergi_numarasi, vergi_dairesi, yillik_asansor_sayisi, ziyaret_edilmesin, calisma_durumu_aybey, calisma_durumu_bulut, calistigi_tedarikciler, finans_durumu, sevkiyat_yetkilisi, sevkiyat_yetkilisi_tel, fuar_id) FROM stdin;
    public       postgres    false    332   �                 0    0    bb_kayitlar_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.bb_kayitlar_id_seq', 1, false);
            public       postgres    false    333                      0    45939    bolge 
   TABLE DATA               I  COPY public.bolge (id, bolge_adi, bolge_turu_id, hedef_ocak, hedef_subat, hedef_mart, hedef_nisan, hedef_mayis, hedef_haziran, hedef_temmuz, hedef_agustos, hedef_eylul, hedef_ekim, hedef_kasim, hedef_aralik, hedef_mamul_ocak, hedef_mamul_subat, hedef_mamul_mart, hedef_mamul_nisan, hedef_mamul_mayis, hedef_mamul_haziran, hedef_mamul_temmuz, hedef_mamul_agustos, hedef_mamul_eylul, hedef_mamul_ekim, hedef_mamul_kasim, hedef_mamul_aralik, gecen_ocak, gecen_subat, gecen_mart, gecen_nisan, gecen_mayis, gecen_haziran, gecen_temmuz, gecen_agustos, gecen_eylul, gecen_ekim, gecen_kasim, gecen_aralik, gecen_mamul_ocak, gecen_mamul_subat, gecen_mamul_mart, gecen_mamul_nisan, gecen_mamul_mayis, gecen_mamul_haziran, gecen_mamul_temmuz, gecen_mamul_agustos, gecen_mamul_eylul, gecen_mamul_ekim, gecen_mamul_kasim, gecen_mamul_aralik) FROM stdin;
    public       postgres    false    334   6�      	           0    0    bolge_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.bolge_id_seq', 2, true);
            public       postgres    false    335                      0    45992 
   bolge_turu 
   TABLE DATA               -   COPY public.bolge_turu (id, tur) FROM stdin;
    public       postgres    false    336   i�      
           0    0    bolge_turu_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.bolge_turu_id_seq', 2, true);
            public       postgres    false    337                      0    45997 
   doviz_kuru 
   TABLE DATA               A   COPY public.doviz_kuru (id, tarih, para_birimi, kur) FROM stdin;
    public       postgres    false    338   ��                 0    0    doviz_kuru_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.doviz_kuru_id_seq', 44, true);
            public       postgres    false    339                      0    46002    hesap_grubu 
   TABLE DATA               /   COPY public.hesap_grubu (id, grup) FROM stdin;
    public       postgres    false    340   ��                 0    0    hesap_grubu_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.hesap_grubu_id_seq', 3, true);
            public       postgres    false    341                      0    46007    hesap_karti 
   TABLE DATA               S  COPY public.hesap_karti (id, hesap_kodu, hesap_ismi, muhasebe_kodu, hesap_tipi_id, hesap_grubu_id, bolge_id, musteri_temsilci_grubu_id, mukellef_tipi_id, musteri_temsilcisi_id, adres_id, mukellef_adi, mukellef_ikinci_adi, mukellef_soyadi, vergi_dairesi, vergi_no, para_birimi, iban, iban_para, nace_kodu, is_efatura_hesabi, efatura_pk_name, yetkili1, yetkili1_tel, yetkili2, yetkili2_tel, yetkili3, yetkili3_tel, faks, muhasebe_telefon, muhasebe_eposta, muhasebe_yetkili, ozel_bilgi, odeme_vade_gun_sayisi, is_acik_hesap, kredi_limiti, hesap_iskonto, kok_hesap_kodu, ara_hesap_kodu) FROM stdin;
    public       postgres    false    342   �                 0    0    hesap_karti_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hesap_karti_id_seq', 1, false);
            public       postgres    false    343                      0    46017    hesap_plani 
   TABLE DATA               ]   COPY public.hesap_plani (id, tek_duzen_kodu, aciklama, plan_kodu, seviye_sayisi) FROM stdin;
    public       postgres    false    344   1�                 0    0    hesap_plani_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hesap_plani_id_seq', 401, true);
            public       postgres    false    345            !          0    46022    medeni_durum 
   TABLE DATA               1   COPY public.medeni_durum (id, durum) FROM stdin;
    public       postgres    false    346   f�                 0    0    medeni_durum_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.medeni_durum_id_seq', 1, false);
            public       postgres    false    347            #          0    46027    muhasebe_hesap_plani 
   TABLE DATA               q   COPY public.muhasebe_hesap_plani (id, tek_duzen_kodu, plan_kodu, aciklama, seviye_sayisi, is_active) FROM stdin;
    public       postgres    false    348   ��                 0    0    muhasebe_hesap_plani_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.muhasebe_hesap_plani_id_seq', 3, true);
            public       postgres    false    349            %          0    46033    musteri_temsilci_grubu 
   TABLE DATA               �  COPY public.musteri_temsilci_grubu (id, temsilci_grup_adi, gecmis_ocak, gecmis_subat, gecmis_mart, gecmis_nisan, gecmis_mayis, gecmis_haziran, gecmis_temmuz, gecmis_agustos, gecmis_eylul, gecmis_ekim, gecmis_kasim, gecmis_aralik, hedef_ocak, hedef_subat, hedef_mart, hedef_nisan, hedef_mayis, hedef_haziran, hedef_temmuz, hedef_agustos, hedef_eylul, hedef_ekim, hedef_kasim, hedef_aralik) FROM stdin;
    public       postgres    false    350   ��                 0    0    musteri_temsilci_grubu_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.musteri_temsilci_grubu_id_seq', 4, true);
            public       postgres    false    351            '          0    46062    olcu_birimi 
   TABLE DATA               ]   COPY public.olcu_birimi (id, birim, efatura_birim, birim_aciklama, is_float_tip) FROM stdin;
    public       postgres    false    352   !�                 0    0    olcu_birimi_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.olcu_birimi_id_seq', 5, true);
            public       postgres    false    353            )          0    46068    para_birimi 
   TABLE DATA               O   COPY public.para_birimi (id, kod, sembol, aciklama, is_varsayilan) FROM stdin;
    public       postgres    false    354   _�                 0    0    para_birimi_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.para_birimi_id_seq', 6, true);
            public       postgres    false    355            +          0    46074    personel_ayrilma_nedeni_tipi 
   TABLE DATA               ?   COPY public.personel_ayrilma_nedeni_tipi (id, tip) FROM stdin;
    public       postgres    false    356   ��                 0    0 #   personel_ayrilma_nedeni_tipi_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.personel_ayrilma_nedeni_tipi_id_seq', 4, true);
            public       postgres    false    357            -          0    46079    personel_calisma_gecmisi 
   TABLE DATA               �   COPY public.personel_calisma_gecmisi (id, personel_id, personel_birim, personel_gorev, ise_giris_tarihi, isten_cikis_tarihi, ayrilma_nedeni_tipi, ayrilma_nedeni_aciklama) FROM stdin;
    public       postgres    false    358   �                 0    0    personel_calisma_gecmisi_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.personel_calisma_gecmisi_id_seq', 1, false);
            public       postgres    false    359            /          0    46084    personel_dil_bilgisi 
   TABLE DATA               �   COPY public.personel_dil_bilgisi (id, dil_id, okuma_seviyesi_id, yazma_seviyesi_id, konusma_seviyesi_id, personel_id) FROM stdin;
    public       postgres    false    360   4�                 0    0    personel_dil_bilgisi_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.personel_dil_bilgisi_id_seq', 1, false);
            public       postgres    false    361            1          0    46089    personel_karti 
   TABLE DATA               �  COPY public.personel_karti (id, is_active, personel_ad, personel_soyad, telefon1, telefon2, personel_tipi_id, bolum_id, birim_id, gorev_id, mail_adresi, dogum_tarihi, kan_grubu, cinsiyet_id, askerlik_durum_id, medeni_durum_id, cocuk_sayisi, yakin_ad_soyad, yakin_telefon, ayakkabi_no, elbise_bedeni, genel_not, servis_id, personel_gecmisi_id, ozel_not, brut_maas, ikramiye_sayisi, ikramiye_miktar, tc_kimlik_no, adres_id) FROM stdin;
    public       postgres    false    362   Q�                 0    0    personel_karti_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.personel_karti_id_seq', 41, true);
            public       postgres    false    363            3          0    46100    personel_pdks_kart 
   TABLE DATA               Z   COPY public.personel_pdks_kart (id, kart_id, personel_no, kart_no, is_active) FROM stdin;
    public       postgres    false    364   ��                 0    0    personel_pdks_kart_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.personel_pdks_kart_id_seq', 1, false);
            public       postgres    false    365            5          0    46105    personel_tasima_servis 
   TABLE DATA               Q   COPY public.personel_tasima_servis (id, servis_no, servis_adi, rota) FROM stdin;
    public       postgres    false    366   �                 0    0    personel_tasima_servis_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.personel_tasima_servis_id_seq', 3, true);
            public       postgres    false    367            7          0    46113    quality_form_mail_reciever 
   TABLE DATA               E   COPY public.quality_form_mail_reciever (id, mail_adresi) FROM stdin;
    public       postgres    false    368   m�                 0    0 !   quality_form_mail_reciever_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.quality_form_mail_reciever_id_seq', 1, true);
            public       postgres    false    369            9          0    46118    recete 
   TABLE DATA               m   COPY public.recete (id, mamul_stok_kodu, ornek_uretim_miktari, fire_orani, aciklama, recete_adi) FROM stdin;
    public       postgres    false    370   ��      :          0    46121    recete_hammadde 
   TABLE DATA               b   COPY public.recete_hammadde (id, header_id, stok_kodu, miktar, fire_orani, recete_id) FROM stdin;
    public       postgres    false    371   ��                 0    0    recete_hammadde_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.recete_hammadde_id_seq', 1, false);
            public       postgres    false    372                       0    0    recete_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.recete_id_seq', 1, false);
            public       postgres    false    373            =          0    46128    satis_fatura 
   TABLE DATA               h   COPY public.satis_fatura (id, fatura_no, fatura_tarihi, teklif_id, siparis_id, irsaliye_id) FROM stdin;
    public       postgres    false    374   ��      >          0    46131    satis_fatura_detay 
   TABLE DATA               q   COPY public.satis_fatura_detay (id, header_id, teklif_detay_id, siparis_detay_id, irsaliye_detay_id) FROM stdin;
    public       postgres    false    375    �                 0    0    satis_fatura_detay_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.satis_fatura_detay_id_seq', 1, false);
            public       postgres    false    376                       0    0    satis_fatura_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.satis_fatura_id_seq', 1, false);
            public       postgres    false    377            A          0    46138    satis_irsaliye 
   TABLE DATA               l   COPY public.satis_irsaliye (id, irsaliye_no, irsaliye_tarihi, teklif_id, siparis_id, fatura_id) FROM stdin;
    public       postgres    false    378   �      B          0    46141    satis_irsaliye_detay 
   TABLE DATA               q   COPY public.satis_irsaliye_detay (id, header_id, teklif_detay_id, siparis_detay_id, fatura_detay_id) FROM stdin;
    public       postgres    false    379   :�                 0    0    satis_irsaliye_detay_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.satis_irsaliye_detay_id_seq', 1, false);
            public       postgres    false    380                        0    0    satis_irsaliye_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.satis_irsaliye_id_seq', 1, false);
            public       postgres    false    381            E          0    46148    satis_siparis 
   TABLE DATA               j   COPY public.satis_siparis (id, siparis_no, siparis_tarihi, teklif_id, irsaliye_id, fatura_id) FROM stdin;
    public       postgres    false    382   W�      F          0    46151    satis_siparis_detay 
   TABLE DATA               q   COPY public.satis_siparis_detay (id, header_id, teklif_detay_id, irsaliye_detay_id, fatura_detay_id) FROM stdin;
    public       postgres    false    383   t�      !           0    0    satis_siparis_detay_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.satis_siparis_detay_id_seq', 1, false);
            public       postgres    false    384            "           0    0    satis_siparis_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.satis_siparis_id_seq', 1, false);
            public       postgres    false    385            I          0    46158    satis_teklif 
   TABLE DATA               6  COPY public.satis_teklif (id, siparis_id, irsaliye_id, fatura_id, is_siparislesti, is_taslak, is_efatura, tutar, iskonto_tutar, iskonto_ara_toplam, genel_iskonto_tutar, ara_toplam, kdv_tutar, genel_toplam, islem_tipi_id, teklif_no, teklif_tarihi, teslim_tarihi, gecerlilik_tarihi, musteri_kodu, musteri_adi, posta_kodu, vergi_dairesi, vergi_no, musteri_temsilcisi_id, teklif_tipi_id, muhattap_ad, muhattap_soyad, odeme_vadesi, referans, teslimat_suresi, teklif_durum_id, sevk_tarihi, vade_gun_sayisi, fatura_sevk_tarihi, para_birimi, dolar_kur, euro_kur, odeme_baslangic_donemi_id, teslim_sarti_id, gonderim_sekli_id, gonderim_sekli_detay, odeme_sekli_id, aciklama, proforma_no, arayan_kisi_id, arama_tarihi, sonraki_aksiyon_tarihi, aksiyon_notu, tevkifat_kodu, tevkifat_pay, tevkifat_payda, ihrac_kayit_kodu) FROM stdin;
    public       postgres    false    386   ��      J          0    46175    satis_teklif_detay 
   TABLE DATA               �  COPY public.satis_teklif_detay (id, header_id, siparis_detay_id, irsaliye_detay_id, fatura_detay_id, stok_kodu, stok_aciklama, aciklama, referans, miktar, olcu_birimi, iskonto_orani, kdv_orani, fiyat, net_fiyat, tutar, iskonto_tutar, net_tutar, kdv_tutar, toplam_tutar, vade_gun, is_ana_urun, ana_urun_id, referans_ana_urun_id, transfer_hesap_kodu, kdv_transfer_hesap_kodu, vergi_kodu, vergi_muafiyet_kodu, diger_vergi_kodu, gtip_no) FROM stdin;
    public       postgres    false    387   ��      #           0    0    satis_teklif_detay_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.satis_teklif_detay_id_seq', 1, false);
            public       postgres    false    388            $           0    0    satis_teklif_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.satis_teklif_id_seq', 1, true);
            public       postgres    false    389            M          0    46222    stok_hareketi 
   TABLE DATA               �   COPY public.stok_hareketi (id, stok_kodu, miktar, tutar, giris_cikis_tip_id, alan_ambar, veren_ambar, tarih, is_donem_basi_hareket) FROM stdin;
    public       postgres    false    390   ��      %           0    0    stok_hareketi_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.stok_hareketi_id_seq', 5001, true);
            public       postgres    false    391            O          0    46228 
   stok_karti 
   TABLE DATA               x  COPY public.stok_karti (id, stok_kodu, stok_adi, stok_grubu_id, olcu_birimi_id, urun_tipi_id, alis_iskonto, satis_iskonto, yetkili_iskonto, stok_tipi_id, ham_alis_fiyat, ham_alis_para_birim, alis_fiyat, alis_para_birim, satis_fiyat, satis_para_birim, ihrac_fiyat, ihrac_para_birim, ortalama_maliyet, varsayilan_recete_id, en, boy, yukseklik, mensei_id, gtip_no, diib_urun_tanimi, en_az_stok_seviyesi, tanim, ozel_kod, marka, agirlik, kapasite, cins_id, string_degisken1, string_degisken2, string_degisken3, string_degisken4, string_degisken5, string_degisken6, integer_degisken1, integer_degisken2, integer_degisken3, double_degisken1, double_degisken2, double_degisken3, is_satilabilir, is_otomatik_uretim_urunu, lot_parti_miktari, paket_miktari, seri_no_turu, is_harici_seri_no_icerir, harici_serino_stok_kodu_id, tasiyici_paket_id, onceki_donem_cikan_miktar, temin_suresi) FROM stdin;
    public       postgres    false    392   �m      &           0    0    stok_karti_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.stok_karti_id_seq', 5, true);
            public       postgres    false    393            Q          0    46254    sys_application_settings 
   TABLE DATA               �  COPY public.sys_application_settings (id, logo, company_name, phone1, phone2, phone3, phone4, phone5, fax1, fax2, mersis_no, web_site, email, tax_administration, tax_no, taxpayer_type_id, trade_register_number, country_id, city_id, town, district, road, street, post_code, building_name, door_no, period, app_main_lang, form_color, mail_host_name, mail_host_user, mail_host_pass, mail_host_smtp_port, grid_color_1, grid_color_2, grid_color_active, crypt_key, is_use_quality_form_number) FROM stdin;
    public       postgres    false    394   Jn      '           0    0    sys_application_settings_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.sys_application_settings_id_seq', 4, true);
            public       postgres    false    395            S          0    46271    sys_application_settings_other 
   TABLE DATA               g  COPY public.sys_application_settings_other (id, is_edefter_aktif, mail_sender_address, mail_sender_username, mail_sender_password, mail_sender_port, varsayilan_satis_cari_kod, varsayilan_alis_cari_kod, is_bolum_ambarda_uretim_yap, is_uretim_muhasebe_kaydi_olustursun, is_stok_satimda_negatife_dusebilir, is_mal_satis_sayilarini_goster, is_pcb_uretim, is_proforma_no_goster, is_satis_takip, is_hammadde_girise_gore_sirala, is_uretim_entegrasyon_hammadde_kullanim_hesabi_iscilikle, is_tahsilat_listesi_virmanli, is_ortalama_vade_0_ise_sevkiyata_izin_verme, is_sipariste_teslim_tarihi_yazdir, is_teklif_ayrintilarini_goster, is_fatura_irsaliye_no_0_ile_baslasin, is_excel_ekli_irsaliye_yazdirma, is_ambarlararasi_transfer_numara_otomatik_gelsin, is_ambarlararasi_transfer_onayli_calissin, is_alis_teklif_alis_sipariste_ham_alis_fiyatini_kullan, is_tahsilat_listesine_120_bulut_hesabini_dahil_etme, is_satis_listesi_varsayilan_filtre_mamul_hammadde, is_recete_maliyet_analizi_baska_db_kullanarak_yap, is_efatura_aktif, is_stok_transfer_fiyati_kullanici_degistirebilir, is_hesaplar_rapolarda_cikmasin, is_siparisi_baska_programa_otomatik_kayit_yap, is_active_uretim_takip, is_pano_programina_otomatik_kayit, is_nakit_akista_farkli_db_kullan, is_ihrac_fiyati_yerine_satis_fiyatini_kullan, is_statik_iskonto_orani_kullan, is_eirsaliye_aktif, is_stok_recete_adi_birlikte_guncellensin, is_kur_bilgisini_1_olarak_kullan, is_genel_kdv_orani_kullan, xslt_sablon_adi, genel_iskonto_gecerlilik_tarihi, en_fazla_fatura_satir_sayisi, en_fazla_e_fatura_satir_sayisi, en_fazla_irsaliye_satir_sayisi, en_fazla_e_irsaliye_satir_sayisi, siparis_kopyalanacak_kaynak_cari_kod, siparis_kopyalanacak_hedef_cari_kod, maliyet_analizi_iskonto_orani, genel_kdv_orani, path_teklif_hesaplama_conf, path_proforma_file, path_mal_stok_seviyesi_eord_rapor, path_update, path_stok_karti_resim, path_proforma_pdf_kayit) FROM stdin;
    public       postgres    false    396   �~      (           0    0 %   sys_application_settings_other_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.sys_application_settings_other_id_seq', 1, false);
            public       postgres    false    397            U          0    46319    sys_city 
   TABLE DATA               M   COPY public.sys_city (id, city_name, car_plate_code, country_id) FROM stdin;
    public       postgres    false    398   �~      )           0    0    sys_city_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.sys_city_id_seq', 3, true);
            public       postgres    false    399            W          0    46324    sys_country 
   TABLE DATA               m   COPY public.sys_country (id, country_code, country_name, iso_year, iso_cctld_code, is_eu_member) FROM stdin;
    public       postgres    false    400   �~      *           0    0    sys_country_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.sys_country_id_seq', 4, true);
            public       postgres    false    401            Y          0    46330    sys_grid_col_color 
   TABLE DATA               u   COPY public.sys_grid_col_color (id, table_name, column_name, min_value, min_color, max_value, max_color) FROM stdin;
    public       postgres    false    402   ;      +           0    0    sys_grid_col_color_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.sys_grid_col_color_id_seq', 4, true);
            public       postgres    false    403            [          0    46342    sys_grid_col_percent 
   TABLE DATA               �   COPY public.sys_grid_col_percent (id, table_name, column_name, max_value, color_bar, color_bar_back, color_bar_text, color_bar_text_active) FROM stdin;
    public       postgres    false    404   X      ,           0    0    sys_grid_col_percent_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.sys_grid_col_percent_id_seq', 1, true);
            public       postgres    false    405            ]          0    46355    sys_grid_col_width 
   TABLE DATA               d   COPY public.sys_grid_col_width (id, table_name, column_name, column_width, sequence_no) FROM stdin;
    public       postgres    false    406   u      -           0    0    sys_grid_col_width_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.sys_grid_col_width_id_seq', 49, true);
            public       postgres    false    407            _          0    46365    sys_grid_default_order_filter 
   TABLE DATA               Q   COPY public.sys_grid_default_order_filter (id, key, value, is_order) FROM stdin;
    public       postgres    false    408   �      .           0    0 $   sys_grid_default_order_filter_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.sys_grid_default_order_filter_id_seq', 12, true);
            public       postgres    false    409            a          0    46374    sys_lang 
   TABLE DATA               0   COPY public.sys_lang (id, language) FROM stdin;
    public       postgres    false    410   ��      b          0    46377    sys_lang_data_content 
   TABLE DATA               _   COPY public.sys_lang_data_content (id, lang, table_name, column_name, row_id, val) FROM stdin;
    public       postgres    false    411   ��      /           0    0    sys_lang_data_content_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.sys_lang_data_content_id_seq', 59, true);
            public       postgres    false    412            d          0    46385    sys_lang_gui_content 
   TABLE DATA               |   COPY public.sys_lang_gui_content (id, lang, code, val, is_factory_setting, content_type, table_name, form_name) FROM stdin;
    public       postgres    false    413   O�      0           0    0    sys_lang_gui_content_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.sys_lang_gui_content_id_seq', 690, true);
            public       postgres    false    414            1           0    0    sys_lang_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.sys_lang_id_seq', 4, true);
            public       postgres    false    415            g          0    46396    sys_multi_lang_data_table_list 
   TABLE DATA               H   COPY public.sys_multi_lang_data_table_list (id, table_name) FROM stdin;
    public       postgres    false    416   ��      2           0    0 %   sys_multi_lang_data_table_list_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.sys_multi_lang_data_table_list_id_seq', 18, true);
            public       postgres    false    417            i          0    46405    sys_permission_source 
   TABLE DATA               ^   COPY public.sys_permission_source (id, source_code, source_name, source_group_id) FROM stdin;
    public       postgres    false    418   ʗ      j          0    46408    sys_permission_source_group 
   TABLE DATA               G   COPY public.sys_permission_source_group (id, source_group) FROM stdin;
    public       postgres    false    419   ��      3           0    0 "   sys_permission_source_group_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.sys_permission_source_group_id_seq', 6, true);
            public       postgres    false    420            4           0    0    sys_permission_source_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.sys_permission_source_id_seq', 24, true);
            public       postgres    false    421            m          0    46415    sys_quality_form_number 
   TABLE DATA               Y   COPY public.sys_quality_form_number (id, table_name, form_no, is_input_form) FROM stdin;
    public       postgres    false    422   �      5           0    0    sys_quality_form_number_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.sys_quality_form_number_id_seq', 4, true);
            public       postgres    false    423            o          0    46423    sys_taxpayer_type 
   TABLE DATA               J   COPY public.sys_taxpayer_type (id, taxpayer_type, is_default) FROM stdin;
    public       postgres    false    424   \�      6           0    0    sys_taxpayer_type_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sys_taxpayer_type_id_seq', 3, true);
            public       postgres    false    425            q          0    46429    sys_user 
   TABLE DATA               �   COPY public.sys_user (id, user_name, user_password, is_active_user, is_online, is_admin, is_super_user, ip_address, mac_address, email_address, app_version, personel_bilgisi_id, invoice_no_serie, dispatch_no_serie, default_qrcode_size) FROM stdin;
    public       postgres    false    426   ��      r          0    46441    sys_user_access_right 
   TABLE DATA               �   COPY public.sys_user_access_right (id, source_code, is_read, is_add_record, is_update, is_delete, is_special, user_name) FROM stdin;
    public       postgres    false    427   ��      7           0    0    sys_user_access_right_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.sys_user_access_right_id_seq', 7, true);
            public       postgres    false    428            8           0    0    sys_user_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.sys_user_id_seq', 1, true);
            public       postgres    false    429            u          0    46453    sys_user_mac_address_exception 
   TABLE DATA               S   COPY public.sys_user_mac_address_exception (id, user_name, ip_address) FROM stdin;
    public       postgres    false    430   F�      9           0    0 %   sys_user_mac_address_exception_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.sys_user_mac_address_exception_id_seq', 1, true);
            public       postgres    false    431            w          0    46471    urun_kabul_red_nedeni 
   TABLE DATA               :   COPY public.urun_kabul_red_nedeni (id, deger) FROM stdin;
    public       postgres    false    435   z�      :           0    0    urun_kabul_red_nedeni_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.urun_kabul_red_nedeni_id_seq', 7, true);
            public       postgres    false    436            �           2606    46613 
   adres_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.adres
    ADD CONSTRAINT adres_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.adres DROP CONSTRAINT adres_pkey;
       public         postgres    false    181    181            �           2606    46615    alis_teklif_detay_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.alis_teklif_detay
    ADD CONSTRAINT alis_teklif_detay_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.alis_teklif_detay DROP CONSTRAINT alis_teklif_detay_pkey;
       public         postgres    false    184    184            �           2606    46617    alis_teklif_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.alis_teklif
    ADD CONSTRAINT alis_teklif_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.alis_teklif DROP CONSTRAINT alis_teklif_pkey;
       public         postgres    false    183    183            �           2606    46619    ambar_ambar_adi_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.ambar
    ADD CONSTRAINT ambar_ambar_adi_key UNIQUE (ambar_adi);
 C   ALTER TABLE ONLY public.ambar DROP CONSTRAINT ambar_ambar_adi_key;
       public         postgres    false    187    187            �           2606    46621 
   ambar_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.ambar
    ADD CONSTRAINT ambar_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.ambar DROP CONSTRAINT ambar_pkey;
       public         postgres    false    187    187            �           2606    46623    arc_arac_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.arc_arac
    ADD CONSTRAINT arc_arac_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.arc_arac DROP CONSTRAINT arc_arac_pkey;
       public         postgres    false    189    189            �           2606    46625 $   ayar_barkod_hazirlik_dosya_turu_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_barkod_hazirlik_dosya_turu
    ADD CONSTRAINT ayar_barkod_hazirlik_dosya_turu_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.ayar_barkod_hazirlik_dosya_turu DROP CONSTRAINT ayar_barkod_hazirlik_dosya_turu_pkey;
       public         postgres    false    191    191            �           2606    46627 '   ayar_barkod_hazirlik_dosya_turu_tur_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_barkod_hazirlik_dosya_turu
    ADD CONSTRAINT ayar_barkod_hazirlik_dosya_turu_tur_key UNIQUE (tur);
 q   ALTER TABLE ONLY public.ayar_barkod_hazirlik_dosya_turu DROP CONSTRAINT ayar_barkod_hazirlik_dosya_turu_tur_key;
       public         postgres    false    191    191            �           2606    46629    ayar_barkod_serino_turu_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.ayar_barkod_serino_turu
    ADD CONSTRAINT ayar_barkod_serino_turu_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.ayar_barkod_serino_turu DROP CONSTRAINT ayar_barkod_serino_turu_pkey;
       public         postgres    false    193    193            �           2606    46631    ayar_barkod_serino_turu_tur_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.ayar_barkod_serino_turu
    ADD CONSTRAINT ayar_barkod_serino_turu_tur_key UNIQUE (tur);
 a   ALTER TABLE ONLY public.ayar_barkod_serino_turu DROP CONSTRAINT ayar_barkod_serino_turu_tur_key;
       public         postgres    false    193    193            �           2606    46633    ayar_barkod_tezgah_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.ayar_barkod_tezgah
    ADD CONSTRAINT ayar_barkod_tezgah_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.ayar_barkod_tezgah DROP CONSTRAINT ayar_barkod_tezgah_pkey;
       public         postgres    false    195    195            �           2606    46635 *   ayar_barkod_tezgah_tezgah_adi_ambar_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_barkod_tezgah
    ADD CONSTRAINT ayar_barkod_tezgah_tezgah_adi_ambar_id_key UNIQUE (tezgah_adi, ambar_id);
 g   ALTER TABLE ONLY public.ayar_barkod_tezgah DROP CONSTRAINT ayar_barkod_tezgah_tezgah_adi_ambar_id_key;
       public         postgres    false    195    195    195            �           2606    46637    ayar_barkod_urun_turu_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.ayar_barkod_urun_turu
    ADD CONSTRAINT ayar_barkod_urun_turu_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.ayar_barkod_urun_turu DROP CONSTRAINT ayar_barkod_urun_turu_pkey;
       public         postgres    false    197    197            �           2606    46639    ayar_barkod_urun_turu_tur_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.ayar_barkod_urun_turu
    ADD CONSTRAINT ayar_barkod_urun_turu_tur_key UNIQUE (tur);
 ]   ALTER TABLE ONLY public.ayar_barkod_urun_turu DROP CONSTRAINT ayar_barkod_urun_turu_tur_key;
       public         postgres    false    197    197            �           2606    46641 )   ayar_bb_calisma_durumu_calisma_durumu_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_bb_calisma_durumu
    ADD CONSTRAINT ayar_bb_calisma_durumu_calisma_durumu_key UNIQUE (calisma_durumu);
 j   ALTER TABLE ONLY public.ayar_bb_calisma_durumu DROP CONSTRAINT ayar_bb_calisma_durumu_calisma_durumu_key;
       public         postgres    false    199    199            �           2606    46643    ayar_bb_calisma_durumu_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.ayar_bb_calisma_durumu
    ADD CONSTRAINT ayar_bb_calisma_durumu_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.ayar_bb_calisma_durumu DROP CONSTRAINT ayar_bb_calisma_durumu_pkey;
       public         postgres    false    199    199            �           2606    46645 '   ayar_bb_finans_durumu_finans_durumu_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_bb_finans_durumu
    ADD CONSTRAINT ayar_bb_finans_durumu_finans_durumu_key UNIQUE (finans_durumu);
 g   ALTER TABLE ONLY public.ayar_bb_finans_durumu DROP CONSTRAINT ayar_bb_finans_durumu_finans_durumu_key;
       public         postgres    false    201    201            �           2606    46647    ayar_bb_finans_durumu_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.ayar_bb_finans_durumu
    ADD CONSTRAINT ayar_bb_finans_durumu_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.ayar_bb_finans_durumu DROP CONSTRAINT ayar_bb_finans_durumu_pkey;
       public         postgres    false    201    201                       2606    46649 !   ayar_bb_firma_tipi_firma_tipi_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.ayar_bb_firma_tipi
    ADD CONSTRAINT ayar_bb_firma_tipi_firma_tipi_key UNIQUE (firma_tipi);
 ^   ALTER TABLE ONLY public.ayar_bb_firma_tipi DROP CONSTRAINT ayar_bb_firma_tipi_firma_tipi_key;
       public         postgres    false    203    203                       2606    46651    ayar_bb_firma_tipi_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.ayar_bb_firma_tipi
    ADD CONSTRAINT ayar_bb_firma_tipi_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.ayar_bb_firma_tipi DROP CONSTRAINT ayar_bb_firma_tipi_pkey;
       public         postgres    false    203    203                       2606    46653    ayar_bordro_tipi_deger_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.ayar_bordro_tipi
    ADD CONSTRAINT ayar_bordro_tipi_deger_key UNIQUE (deger);
 U   ALTER TABLE ONLY public.ayar_bordro_tipi DROP CONSTRAINT ayar_bordro_tipi_deger_key;
       public         postgres    false    205    205                       2606    46655    ayar_bordro_tipi_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.ayar_bordro_tipi
    ADD CONSTRAINT ayar_bordro_tipi_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.ayar_bordro_tipi DROP CONSTRAINT ayar_bordro_tipi_pkey;
       public         postgres    false    205    205            	           2606    46657 (   ayar_cek_senet_cash_edici_tipi_deger_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_cek_senet_cash_edici_tipi
    ADD CONSTRAINT ayar_cek_senet_cash_edici_tipi_deger_key UNIQUE (deger);
 q   ALTER TABLE ONLY public.ayar_cek_senet_cash_edici_tipi DROP CONSTRAINT ayar_cek_senet_cash_edici_tipi_deger_key;
       public         postgres    false    207    207                       2606    46659 #   ayar_cek_senet_cash_edici_tipi_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_cek_senet_cash_edici_tipi
    ADD CONSTRAINT ayar_cek_senet_cash_edici_tipi_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.ayar_cek_senet_cash_edici_tipi DROP CONSTRAINT ayar_cek_senet_cash_edici_tipi_pkey;
       public         postgres    false    207    207                       2606    46661 *   ayar_cek_senet_tahsil_odeme_tipi_deger_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_cek_senet_tahsil_odeme_tipi
    ADD CONSTRAINT ayar_cek_senet_tahsil_odeme_tipi_deger_key UNIQUE (deger);
 u   ALTER TABLE ONLY public.ayar_cek_senet_tahsil_odeme_tipi DROP CONSTRAINT ayar_cek_senet_tahsil_odeme_tipi_deger_key;
       public         postgres    false    209    209                       2606    46663 %   ayar_cek_senet_tahsil_odeme_tipi_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_cek_senet_tahsil_odeme_tipi
    ADD CONSTRAINT ayar_cek_senet_tahsil_odeme_tipi_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.ayar_cek_senet_tahsil_odeme_tipi DROP CONSTRAINT ayar_cek_senet_tahsil_odeme_tipi_pkey;
       public         postgres    false    209    209                       2606    46665    ayar_cek_senet_tipi_deger_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.ayar_cek_senet_tipi
    ADD CONSTRAINT ayar_cek_senet_tipi_deger_key UNIQUE (deger);
 [   ALTER TABLE ONLY public.ayar_cek_senet_tipi DROP CONSTRAINT ayar_cek_senet_tipi_deger_key;
       public         postgres    false    211    211                       2606    46667    ayar_cek_senet_tipi_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.ayar_cek_senet_tipi
    ADD CONSTRAINT ayar_cek_senet_tipi_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.ayar_cek_senet_tipi DROP CONSTRAINT ayar_cek_senet_tipi_pkey;
       public         postgres    false    211    211                       2606    46669 1   ayar_diger_database_bilgisi_db_name_host_name_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_diger_database_bilgisi
    ADD CONSTRAINT ayar_diger_database_bilgisi_db_name_host_name_key UNIQUE (db_name, host_name);
 w   ALTER TABLE ONLY public.ayar_diger_database_bilgisi DROP CONSTRAINT ayar_diger_database_bilgisi_db_name_host_name_key;
       public         postgres    false    213    213    213                       2606    46671     ayar_diger_database_bilgisi_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.ayar_diger_database_bilgisi
    ADD CONSTRAINT ayar_diger_database_bilgisi_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.ayar_diger_database_bilgisi DROP CONSTRAINT ayar_diger_database_bilgisi_pkey;
       public         postgres    false    213    213                       2606    46673    ayar_edefter_donem_raporu_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.ayar_edefter_donem_raporu
    ADD CONSTRAINT ayar_edefter_donem_raporu_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.ayar_edefter_donem_raporu DROP CONSTRAINT ayar_edefter_donem_raporu_pkey;
       public         postgres    false    215    215                       2606    46675 ?   ayar_edefter_donem_raporu_rapor_baslangic_donemi_rapor_biti_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_edefter_donem_raporu
    ADD CONSTRAINT ayar_edefter_donem_raporu_rapor_baslangic_donemi_rapor_biti_key UNIQUE (rapor_baslangic_donemi, rapor_bitis_donemi);
 �   ALTER TABLE ONLY public.ayar_edefter_donem_raporu DROP CONSTRAINT ayar_edefter_donem_raporu_rapor_baslangic_donemi_rapor_biti_key;
       public         postgres    false    215    215    215                       2606    46677    ayar_efatura_alici_bilgisi_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.ayar_efatura_alici_bilgisi
    ADD CONSTRAINT ayar_efatura_alici_bilgisi_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.ayar_efatura_alici_bilgisi DROP CONSTRAINT ayar_efatura_alici_bilgisi_pkey;
       public         postgres    false    217    217                       2606    46679 (   ayar_efatura_evrak_cinsi_evrak_cinsi_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_efatura_evrak_cinsi
    ADD CONSTRAINT ayar_efatura_evrak_cinsi_evrak_cinsi_key UNIQUE (evrak_cinsi);
 k   ALTER TABLE ONLY public.ayar_efatura_evrak_cinsi DROP CONSTRAINT ayar_efatura_evrak_cinsi_evrak_cinsi_key;
       public         postgres    false    219    219            !           2606    46681    ayar_efatura_evrak_cinsi_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.ayar_efatura_evrak_cinsi
    ADD CONSTRAINT ayar_efatura_evrak_cinsi_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.ayar_efatura_evrak_cinsi DROP CONSTRAINT ayar_efatura_evrak_cinsi_pkey;
       public         postgres    false    219    219            '           2606    46683 >   ayar_efatura_evrak_tipi_cinsi_evrak_tipi_id_evrak_cinsi_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_efatura_evrak_tipi_cinsi
    ADD CONSTRAINT ayar_efatura_evrak_tipi_cinsi_evrak_tipi_id_evrak_cinsi_id_key UNIQUE (evrak_tipi_id, evrak_cinsi_id);
 �   ALTER TABLE ONLY public.ayar_efatura_evrak_tipi_cinsi DROP CONSTRAINT ayar_efatura_evrak_tipi_cinsi_evrak_tipi_id_evrak_cinsi_id_key;
       public         postgres    false    222    222    222            )           2606    46685 "   ayar_efatura_evrak_tipi_cinsi_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.ayar_efatura_evrak_tipi_cinsi
    ADD CONSTRAINT ayar_efatura_evrak_tipi_cinsi_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.ayar_efatura_evrak_tipi_cinsi DROP CONSTRAINT ayar_efatura_evrak_tipi_cinsi_pkey;
       public         postgres    false    222    222            #           2606    46687 &   ayar_efatura_evrak_tipi_evrak_tipi_key 
   CONSTRAINT        ALTER TABLE ONLY public.ayar_efatura_evrak_tipi
    ADD CONSTRAINT ayar_efatura_evrak_tipi_evrak_tipi_key UNIQUE (evrak_tipi);
 h   ALTER TABLE ONLY public.ayar_efatura_evrak_tipi DROP CONSTRAINT ayar_efatura_evrak_tipi_evrak_tipi_key;
       public         postgres    false    221    221            %           2606    46689    ayar_efatura_evrak_tipi_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.ayar_efatura_evrak_tipi
    ADD CONSTRAINT ayar_efatura_evrak_tipi_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.ayar_efatura_evrak_tipi DROP CONSTRAINT ayar_efatura_evrak_tipi_pkey;
       public         postgres    false    221    221            +           2606    46691    ayar_efatura_fatura_tipi_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.ayar_efatura_fatura_tipi
    ADD CONSTRAINT ayar_efatura_fatura_tipi_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.ayar_efatura_fatura_tipi DROP CONSTRAINT ayar_efatura_fatura_tipi_pkey;
       public         postgres    false    225    225            -           2606    46693     ayar_efatura_fatura_tipi_tip_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.ayar_efatura_fatura_tipi
    ADD CONSTRAINT ayar_efatura_fatura_tipi_tip_key UNIQUE (tip);
 c   ALTER TABLE ONLY public.ayar_efatura_fatura_tipi DROP CONSTRAINT ayar_efatura_fatura_tipi_tip_key;
       public         postgres    false    225    225            /           2606    46695 #   ayar_efatura_gonderici_bilgisi_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_efatura_gonderici_bilgisi
    ADD CONSTRAINT ayar_efatura_gonderici_bilgisi_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.ayar_efatura_gonderici_bilgisi DROP CONSTRAINT ayar_efatura_gonderici_bilgisi_pkey;
       public         postgres    false    227    227            1           2606    46697 #   ayar_efatura_gonderim_sekli_kod_key 
   CONSTRAINT     y   ALTER TABLE ONLY public.ayar_efatura_gonderim_sekli
    ADD CONSTRAINT ayar_efatura_gonderim_sekli_kod_key UNIQUE (kod);
 i   ALTER TABLE ONLY public.ayar_efatura_gonderim_sekli DROP CONSTRAINT ayar_efatura_gonderim_sekli_kod_key;
       public         postgres    false    229    229            3           2606    46699     ayar_efatura_gonderim_sekli_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.ayar_efatura_gonderim_sekli
    ADD CONSTRAINT ayar_efatura_gonderim_sekli_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.ayar_efatura_gonderim_sekli DROP CONSTRAINT ayar_efatura_gonderim_sekli_pkey;
       public         postgres    false    229    229            5           2606    46701 0   ayar_efatura_ihrac_kayitli_fatura_sebebi_kod_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_efatura_ihrac_kayitli_fatura_sebebi
    ADD CONSTRAINT ayar_efatura_ihrac_kayitli_fatura_sebebi_kod_key UNIQUE (kod);
 �   ALTER TABLE ONLY public.ayar_efatura_ihrac_kayitli_fatura_sebebi DROP CONSTRAINT ayar_efatura_ihrac_kayitli_fatura_sebebi_kod_key;
       public         postgres    false    231    231            7           2606    46703 -   ayar_efatura_ihrac_kayitli_fatura_sebebi_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_efatura_ihrac_kayitli_fatura_sebebi
    ADD CONSTRAINT ayar_efatura_ihrac_kayitli_fatura_sebebi_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.ayar_efatura_ihrac_kayitli_fatura_sebebi DROP CONSTRAINT ayar_efatura_ihrac_kayitli_fatura_sebebi_pkey;
       public         postgres    false    231    231            9           2606    46705 $   ayar_efatura_iletisim_kanali_kod_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.ayar_efatura_iletisim_kanali
    ADD CONSTRAINT ayar_efatura_iletisim_kanali_kod_key UNIQUE (kod);
 k   ALTER TABLE ONLY public.ayar_efatura_iletisim_kanali DROP CONSTRAINT ayar_efatura_iletisim_kanali_kod_key;
       public         postgres    false    233    233            ;           2606    46707 !   ayar_efatura_iletisim_kanali_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.ayar_efatura_iletisim_kanali
    ADD CONSTRAINT ayar_efatura_iletisim_kanali_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.ayar_efatura_iletisim_kanali DROP CONSTRAINT ayar_efatura_iletisim_kanali_pkey;
       public         postgres    false    233    233            =           2606    46709    ayar_efatura_istisna_kodu_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.ayar_efatura_istisna_kodu
    ADD CONSTRAINT ayar_efatura_istisna_kodu_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.ayar_efatura_istisna_kodu DROP CONSTRAINT ayar_efatura_istisna_kodu_pkey;
       public         postgres    false    235    235            �           2606    47569 $   ayar_efatura_kimlik_semasi_deger_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.ayar_efatura_kimlik_semasi
    ADD CONSTRAINT ayar_efatura_kimlik_semasi_deger_key UNIQUE (deger);
 i   ALTER TABLE ONLY public.ayar_efatura_kimlik_semasi DROP CONSTRAINT ayar_efatura_kimlik_semasi_deger_key;
       public         postgres    false    456    456            �           2606    47567    ayar_efatura_kimlik_semasi_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.ayar_efatura_kimlik_semasi
    ADD CONSTRAINT ayar_efatura_kimlik_semasi_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.ayar_efatura_kimlik_semasi DROP CONSTRAINT ayar_efatura_kimlik_semasi_pkey;
       public         postgres    false    456    456            ?           2606    46715 (   ayar_efatura_odeme_sekli_odeme_sekli_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_efatura_odeme_sekli
    ADD CONSTRAINT ayar_efatura_odeme_sekli_odeme_sekli_key UNIQUE (odeme_sekli);
 k   ALTER TABLE ONLY public.ayar_efatura_odeme_sekli DROP CONSTRAINT ayar_efatura_odeme_sekli_odeme_sekli_key;
       public         postgres    false    237    237            A           2606    46717    ayar_efatura_odeme_sekli_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.ayar_efatura_odeme_sekli
    ADD CONSTRAINT ayar_efatura_odeme_sekli_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.ayar_efatura_odeme_sekli DROP CONSTRAINT ayar_efatura_odeme_sekli_pkey;
       public         postgres    false    237    237            C           2606    46719    ayar_efatura_paket_tipi_kod_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.ayar_efatura_paket_tipi
    ADD CONSTRAINT ayar_efatura_paket_tipi_kod_key UNIQUE (kod);
 a   ALTER TABLE ONLY public.ayar_efatura_paket_tipi DROP CONSTRAINT ayar_efatura_paket_tipi_kod_key;
       public         postgres    false    239    239            E           2606    46721    ayar_efatura_paket_tipi_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.ayar_efatura_paket_tipi
    ADD CONSTRAINT ayar_efatura_paket_tipi_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.ayar_efatura_paket_tipi DROP CONSTRAINT ayar_efatura_paket_tipi_pkey;
       public         postgres    false    239    239            G           2606    46723 $   ayar_efatura_response_code_deger_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.ayar_efatura_response_code
    ADD CONSTRAINT ayar_efatura_response_code_deger_key UNIQUE (deger);
 i   ALTER TABLE ONLY public.ayar_efatura_response_code DROP CONSTRAINT ayar_efatura_response_code_deger_key;
       public         postgres    false    241    241            I           2606    46725    ayar_efatura_response_code_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.ayar_efatura_response_code
    ADD CONSTRAINT ayar_efatura_response_code_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.ayar_efatura_response_code DROP CONSTRAINT ayar_efatura_response_code_pkey;
       public         postgres    false    241    241            K           2606    46727    ayar_efatura_senaryo_tipi_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.ayar_efatura_senaryo_tipi
    ADD CONSTRAINT ayar_efatura_senaryo_tipi_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.ayar_efatura_senaryo_tipi DROP CONSTRAINT ayar_efatura_senaryo_tipi_pkey;
       public         postgres    false    243    243            M           2606    46729 !   ayar_efatura_senaryo_tipi_tip_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.ayar_efatura_senaryo_tipi
    ADD CONSTRAINT ayar_efatura_senaryo_tipi_tip_key UNIQUE (tip);
 e   ALTER TABLE ONLY public.ayar_efatura_senaryo_tipi DROP CONSTRAINT ayar_efatura_senaryo_tipi_tip_key;
       public         postgres    false    243    243            O           2606    46731 !   ayar_efatura_teslim_sarti_kod_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.ayar_efatura_teslim_sarti
    ADD CONSTRAINT ayar_efatura_teslim_sarti_kod_key UNIQUE (kod);
 e   ALTER TABLE ONLY public.ayar_efatura_teslim_sarti DROP CONSTRAINT ayar_efatura_teslim_sarti_kod_key;
       public         postgres    false    245    245            Q           2606    46733    ayar_efatura_teslim_sarti_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.ayar_efatura_teslim_sarti
    ADD CONSTRAINT ayar_efatura_teslim_sarti_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.ayar_efatura_teslim_sarti DROP CONSTRAINT ayar_efatura_teslim_sarti_pkey;
       public         postgres    false    245    245            S           2606    46735 -   ayar_efatura_tevkifat_kodu_kodu_pay_payda_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_efatura_tevkifat_kodu
    ADD CONSTRAINT ayar_efatura_tevkifat_kodu_kodu_pay_payda_key UNIQUE (kodu, pay, payda);
 r   ALTER TABLE ONLY public.ayar_efatura_tevkifat_kodu DROP CONSTRAINT ayar_efatura_tevkifat_kodu_kodu_pay_payda_key;
       public         postgres    false    247    247    247    247            U           2606    46737    ayar_efatura_tevkifat_kodu_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.ayar_efatura_tevkifat_kodu
    ADD CONSTRAINT ayar_efatura_tevkifat_kodu_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.ayar_efatura_tevkifat_kodu DROP CONSTRAINT ayar_efatura_tevkifat_kodu_pkey;
       public         postgres    false    247    247            [           2606    46739 .   ayar_fatura_no_serisi_fatura_seri_id_deger_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_fatura_no_serisi
    ADD CONSTRAINT ayar_fatura_no_serisi_fatura_seri_id_deger_key UNIQUE (fatura_seri_id, deger);
 n   ALTER TABLE ONLY public.ayar_fatura_no_serisi DROP CONSTRAINT ayar_fatura_no_serisi_fatura_seri_id_deger_key;
       public         postgres    false    251    251    251            ]           2606    46741    ayar_fatura_no_serisi_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.ayar_fatura_no_serisi
    ADD CONSTRAINT ayar_fatura_no_serisi_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.ayar_fatura_no_serisi DROP CONSTRAINT ayar_fatura_no_serisi_pkey;
       public         postgres    false    251    251            _           2606    46743    ayar_firma_tipi_firma_tipi_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.ayar_firma_tipi
    ADD CONSTRAINT ayar_firma_tipi_firma_tipi_key UNIQUE (firma_tipi);
 X   ALTER TABLE ONLY public.ayar_firma_tipi DROP CONSTRAINT ayar_firma_tipi_firma_tipi_key;
       public         postgres    false    253    253            a           2606    46745    ayar_firma_tipi_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.ayar_firma_tipi
    ADD CONSTRAINT ayar_firma_tipi_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.ayar_firma_tipi DROP CONSTRAINT ayar_firma_tipi_pkey;
       public         postgres    false    253    253            c           2606    46747    ayar_firma_turu_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.ayar_firma_turu
    ADD CONSTRAINT ayar_firma_turu_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.ayar_firma_turu DROP CONSTRAINT ayar_firma_turu_pkey;
       public         postgres    false    255    255            e           2606    46749    ayar_firma_turu_tur_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.ayar_firma_turu
    ADD CONSTRAINT ayar_firma_turu_tur_key UNIQUE (tur);
 Q   ALTER TABLE ONLY public.ayar_firma_turu DROP CONSTRAINT ayar_firma_turu_tur_key;
       public         postgres    false    255    255            g           2606    46751    ayar_fis_tipi_deger_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.ayar_fis_tipi
    ADD CONSTRAINT ayar_fis_tipi_deger_key UNIQUE (deger);
 O   ALTER TABLE ONLY public.ayar_fis_tipi DROP CONSTRAINT ayar_fis_tipi_deger_key;
       public         postgres    false    257    257            i           2606    46753    ayar_fis_tipi_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.ayar_fis_tipi
    ADD CONSTRAINT ayar_fis_tipi_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.ayar_fis_tipi DROP CONSTRAINT ayar_fis_tipi_pkey;
       public         postgres    false    257    257            k           2606    46755    ayar_genel_ayarlar_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.ayar_genel_ayarlar
    ADD CONSTRAINT ayar_genel_ayarlar_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.ayar_genel_ayarlar DROP CONSTRAINT ayar_genel_ayarlar_pkey;
       public         postgres    false    259    259            m           2606    46757 '   ayar_genel_ayarlar_tc_no_firma_tipi_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_genel_ayarlar
    ADD CONSTRAINT ayar_genel_ayarlar_tc_no_firma_tipi_key UNIQUE (tc_no, firma_tipi);
 d   ALTER TABLE ONLY public.ayar_genel_ayarlar DROP CONSTRAINT ayar_genel_ayarlar_tc_no_firma_tipi_key;
       public         postgres    false    259    259    259            o           2606    46759 *   ayar_genel_ayarlar_vergi_no_firma_tipi_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_genel_ayarlar
    ADD CONSTRAINT ayar_genel_ayarlar_vergi_no_firma_tipi_key UNIQUE (vergi_no, firma_tipi);
 g   ALTER TABLE ONLY public.ayar_genel_ayarlar DROP CONSTRAINT ayar_genel_ayarlar_vergi_no_firma_tipi_key;
       public         postgres    false    259    259    259            q           2606    46761    ayar_hane_sayisi_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.ayar_hane_sayisi
    ADD CONSTRAINT ayar_hane_sayisi_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.ayar_hane_sayisi DROP CONSTRAINT ayar_hane_sayisi_pkey;
       public         postgres    false    261    261            s           2606    46763    ayar_hane_sayisi_ukey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_hane_sayisi
    ADD CONSTRAINT ayar_hane_sayisi_ukey UNIQUE (hesap_bakiye, alis_miktar, alis_fiyat, alis_tutar, satis_miktar, satis_fiyat, satis_tutar, stok_miktar, stok_fiyat);
 P   ALTER TABLE ONLY public.ayar_hane_sayisi DROP CONSTRAINT ayar_hane_sayisi_ukey;
       public         postgres    false    261    261    261    261    261    261    261    261    261    261            u           2606    46765    ayar_hesap_tipi_hesap_tipi_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.ayar_hesap_tipi
    ADD CONSTRAINT ayar_hesap_tipi_hesap_tipi_key UNIQUE (hesap_tipi);
 X   ALTER TABLE ONLY public.ayar_hesap_tipi DROP CONSTRAINT ayar_hesap_tipi_hesap_tipi_key;
       public         postgres    false    263    263            w           2606    46767    ayar_hesap_tipi_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.ayar_hesap_tipi
    ADD CONSTRAINT ayar_hesap_tipi_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.ayar_hesap_tipi DROP CONSTRAINT ayar_hesap_tipi_pkey;
       public         postgres    false    263    263            y           2606    46769 (   ayar_irsaliye_fatura_no_serisi_deger_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_irsaliye_fatura_no_serisi
    ADD CONSTRAINT ayar_irsaliye_fatura_no_serisi_deger_key UNIQUE (deger);
 q   ALTER TABLE ONLY public.ayar_irsaliye_fatura_no_serisi DROP CONSTRAINT ayar_irsaliye_fatura_no_serisi_deger_key;
       public         postgres    false    265    265            {           2606    46771 #   ayar_irsaliye_fatura_no_serisi_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_irsaliye_fatura_no_serisi
    ADD CONSTRAINT ayar_irsaliye_fatura_no_serisi_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.ayar_irsaliye_fatura_no_serisi DROP CONSTRAINT ayar_irsaliye_fatura_no_serisi_pkey;
       public         postgres    false    265    265            }           2606    46773 2   ayar_irsaliye_no_serisi_irsaliye_seri_id_deger_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_irsaliye_no_serisi
    ADD CONSTRAINT ayar_irsaliye_no_serisi_irsaliye_seri_id_deger_key UNIQUE (irsaliye_seri_id, deger);
 t   ALTER TABLE ONLY public.ayar_irsaliye_no_serisi DROP CONSTRAINT ayar_irsaliye_no_serisi_irsaliye_seri_id_deger_key;
       public         postgres    false    267    267    267                       2606    46775    ayar_irsaliye_no_serisi_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.ayar_irsaliye_no_serisi
    ADD CONSTRAINT ayar_irsaliye_no_serisi_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.ayar_irsaliye_no_serisi DROP CONSTRAINT ayar_irsaliye_no_serisi_pkey;
       public         postgres    false    267    267            �           2606    46777    ayar_modul_tipi_deger_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.ayar_modul_tipi
    ADD CONSTRAINT ayar_modul_tipi_deger_key UNIQUE (deger);
 S   ALTER TABLE ONLY public.ayar_modul_tipi DROP CONSTRAINT ayar_modul_tipi_deger_key;
       public         postgres    false    269    269            �           2606    46779    ayar_modul_tipi_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.ayar_modul_tipi
    ADD CONSTRAINT ayar_modul_tipi_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.ayar_modul_tipi DROP CONSTRAINT ayar_modul_tipi_pkey;
       public         postgres    false    269    269            �           2606    46781 !   ayar_musteri_firma_turu_deger_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.ayar_musteri_firma_turu
    ADD CONSTRAINT ayar_musteri_firma_turu_deger_key UNIQUE (deger);
 c   ALTER TABLE ONLY public.ayar_musteri_firma_turu DROP CONSTRAINT ayar_musteri_firma_turu_deger_key;
       public         postgres    false    271    271            �           2606    46783    ayar_musteri_firma_turu_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.ayar_musteri_firma_turu
    ADD CONSTRAINT ayar_musteri_firma_turu_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.ayar_musteri_firma_turu DROP CONSTRAINT ayar_musteri_firma_turu_pkey;
       public         postgres    false    271    271            �           2606    46785 %   ayar_odeme_baslangic_donemi_deger_key 
   CONSTRAINT     }   ALTER TABLE ONLY public.ayar_odeme_baslangic_donemi
    ADD CONSTRAINT ayar_odeme_baslangic_donemi_deger_key UNIQUE (deger);
 k   ALTER TABLE ONLY public.ayar_odeme_baslangic_donemi DROP CONSTRAINT ayar_odeme_baslangic_donemi_deger_key;
       public         postgres    false    273    273            �           2606    46787     ayar_odeme_baslangic_donemi_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.ayar_odeme_baslangic_donemi
    ADD CONSTRAINT ayar_odeme_baslangic_donemi_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.ayar_odeme_baslangic_donemi DROP CONSTRAINT ayar_odeme_baslangic_donemi_pkey;
       public         postgres    false    273    273            �           2606    46789     ayar_odeme_sekli_odeme_sekli_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.ayar_odeme_sekli
    ADD CONSTRAINT ayar_odeme_sekli_odeme_sekli_key UNIQUE (odeme_sekli);
 [   ALTER TABLE ONLY public.ayar_odeme_sekli DROP CONSTRAINT ayar_odeme_sekli_odeme_sekli_key;
       public         postgres    false    275    275            �           2606    46791    ayar_odeme_sekli_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.ayar_odeme_sekli
    ADD CONSTRAINT ayar_odeme_sekli_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.ayar_odeme_sekli DROP CONSTRAINT ayar_odeme_sekli_pkey;
       public         postgres    false    275    275            �           2606    46793 ,   ayar_prs_askerlik_durumu_askerlik_durumu_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_prs_askerlik_durumu
    ADD CONSTRAINT ayar_prs_askerlik_durumu_askerlik_durumu_key UNIQUE (askerlik_durumu);
 o   ALTER TABLE ONLY public.ayar_prs_askerlik_durumu DROP CONSTRAINT ayar_prs_askerlik_durumu_askerlik_durumu_key;
       public         postgres    false    277    277            �           2606    46795    ayar_prs_askerlik_durumu_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.ayar_prs_askerlik_durumu
    ADD CONSTRAINT ayar_prs_askerlik_durumu_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.ayar_prs_askerlik_durumu DROP CONSTRAINT ayar_prs_askerlik_durumu_pkey;
       public         postgres    false    277    277            �           2606    46797 *   ayar_prs_ayrilma_nedeni_ayrilma_nedeni_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_prs_ayrilma_nedeni
    ADD CONSTRAINT ayar_prs_ayrilma_nedeni_ayrilma_nedeni_key UNIQUE (ayrilma_nedeni);
 l   ALTER TABLE ONLY public.ayar_prs_ayrilma_nedeni DROP CONSTRAINT ayar_prs_ayrilma_nedeni_ayrilma_nedeni_key;
       public         postgres    false    279    279            �           2606    46799    ayar_prs_ayrilma_nedeni_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.ayar_prs_ayrilma_nedeni
    ADD CONSTRAINT ayar_prs_ayrilma_nedeni_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.ayar_prs_ayrilma_nedeni DROP CONSTRAINT ayar_prs_ayrilma_nedeni_pkey;
       public         postgres    false    279    279            �           2606    46801 !   ayar_prs_birim_birim_bolum_id_key 
   CONSTRAINT     v   ALTER TABLE ONLY public.ayar_prs_birim
    ADD CONSTRAINT ayar_prs_birim_birim_bolum_id_key UNIQUE (birim, bolum_id);
 Z   ALTER TABLE ONLY public.ayar_prs_birim DROP CONSTRAINT ayar_prs_birim_birim_bolum_id_key;
       public         postgres    false    281    281    281            �           2606    46803    ayar_prs_birim_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.ayar_prs_birim
    ADD CONSTRAINT ayar_prs_birim_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.ayar_prs_birim DROP CONSTRAINT ayar_prs_birim_pkey;
       public         postgres    false    281    281            �           2606    46805    ayar_prs_bolum_bolum_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.ayar_prs_bolum
    ADD CONSTRAINT ayar_prs_bolum_bolum_key UNIQUE (bolum);
 Q   ALTER TABLE ONLY public.ayar_prs_bolum DROP CONSTRAINT ayar_prs_bolum_bolum_key;
       public         postgres    false    283    283            �           2606    46807    ayar_prs_bolum_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.ayar_prs_bolum
    ADD CONSTRAINT ayar_prs_bolum_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.ayar_prs_bolum DROP CONSTRAINT ayar_prs_bolum_pkey;
       public         postgres    false    283    283            �           2606    46809    ayar_prs_cinsiyet_cinsiyet_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.ayar_prs_cinsiyet
    ADD CONSTRAINT ayar_prs_cinsiyet_cinsiyet_key UNIQUE (cinsiyet);
 Z   ALTER TABLE ONLY public.ayar_prs_cinsiyet DROP CONSTRAINT ayar_prs_cinsiyet_cinsiyet_key;
       public         postgres    false    285    285            �           2606    46811    ayar_prs_cinsiyet_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.ayar_prs_cinsiyet
    ADD CONSTRAINT ayar_prs_cinsiyet_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.ayar_prs_cinsiyet DROP CONSTRAINT ayar_prs_cinsiyet_pkey;
       public         postgres    false    285    285            �           2606    47342 ,   ayar_prs_egitim_seviyesi_egitim_seviyesi_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_prs_egitim_seviyesi
    ADD CONSTRAINT ayar_prs_egitim_seviyesi_egitim_seviyesi_key UNIQUE (egitim_seviyesi);
 o   ALTER TABLE ONLY public.ayar_prs_egitim_seviyesi DROP CONSTRAINT ayar_prs_egitim_seviyesi_egitim_seviyesi_key;
       public         postgres    false    438    438            �           2606    47340    ayar_prs_egitim_seviyesi_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.ayar_prs_egitim_seviyesi
    ADD CONSTRAINT ayar_prs_egitim_seviyesi_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.ayar_prs_egitim_seviyesi DROP CONSTRAINT ayar_prs_egitim_seviyesi_pkey;
       public         postgres    false    438    438            �           2606    46817 &   ayar_prs_ehliyet_tipi_ehliyet_tipi_key 
   CONSTRAINT        ALTER TABLE ONLY public.ayar_prs_ehliyet_tipi
    ADD CONSTRAINT ayar_prs_ehliyet_tipi_ehliyet_tipi_key UNIQUE (ehliyet_tipi);
 f   ALTER TABLE ONLY public.ayar_prs_ehliyet_tipi DROP CONSTRAINT ayar_prs_ehliyet_tipi_ehliyet_tipi_key;
       public         postgres    false    287    287            �           2606    46819    ayar_prs_ehliyet_tipi_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.ayar_prs_ehliyet_tipi
    ADD CONSTRAINT ayar_prs_ehliyet_tipi_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.ayar_prs_ehliyet_tipi DROP CONSTRAINT ayar_prs_ehliyet_tipi_pkey;
       public         postgres    false    287    287            �           2606    46821    ayar_prs_gorev_gorev_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.ayar_prs_gorev
    ADD CONSTRAINT ayar_prs_gorev_gorev_key UNIQUE (gorev);
 Q   ALTER TABLE ONLY public.ayar_prs_gorev DROP CONSTRAINT ayar_prs_gorev_gorev_key;
       public         postgres    false    289    289            �           2606    46823    ayar_prs_gorev_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.ayar_prs_gorev
    ADD CONSTRAINT ayar_prs_gorev_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.ayar_prs_gorev DROP CONSTRAINT ayar_prs_gorev_pkey;
       public         postgres    false    289    289            �           2606    46825     ayar_prs_izin_tipi_izin_tipi_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.ayar_prs_izin_tipi
    ADD CONSTRAINT ayar_prs_izin_tipi_izin_tipi_key UNIQUE (izin_tipi);
 ]   ALTER TABLE ONLY public.ayar_prs_izin_tipi DROP CONSTRAINT ayar_prs_izin_tipi_izin_tipi_key;
       public         postgres    false    291    291            �           2606    46827    ayar_prs_izin_tipi_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.ayar_prs_izin_tipi
    ADD CONSTRAINT ayar_prs_izin_tipi_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.ayar_prs_izin_tipi DROP CONSTRAINT ayar_prs_izin_tipi_pkey;
       public         postgres    false    291    291            �           2606    46829 &   ayar_prs_medeni_durum_medeni_durum_key 
   CONSTRAINT        ALTER TABLE ONLY public.ayar_prs_medeni_durum
    ADD CONSTRAINT ayar_prs_medeni_durum_medeni_durum_key UNIQUE (medeni_durum);
 f   ALTER TABLE ONLY public.ayar_prs_medeni_durum DROP CONSTRAINT ayar_prs_medeni_durum_medeni_durum_key;
       public         postgres    false    294    294            �           2606    46831    ayar_prs_medeni_durum_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.ayar_prs_medeni_durum
    ADD CONSTRAINT ayar_prs_medeni_durum_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.ayar_prs_medeni_durum DROP CONSTRAINT ayar_prs_medeni_durum_pkey;
       public         postgres    false    294    294            �           2606    46833 $   ayar_prs_mektup_tipi_mektup_tipi_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.ayar_prs_mektup_tipi
    ADD CONSTRAINT ayar_prs_mektup_tipi_mektup_tipi_key UNIQUE (mektup_tipi);
 c   ALTER TABLE ONLY public.ayar_prs_mektup_tipi DROP CONSTRAINT ayar_prs_mektup_tipi_mektup_tipi_key;
       public         postgres    false    296    296            �           2606    46835    ayar_prs_mektup_tipi_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.ayar_prs_mektup_tipi
    ADD CONSTRAINT ayar_prs_mektup_tipi_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.ayar_prs_mektup_tipi DROP CONSTRAINT ayar_prs_mektup_tipi_pkey;
       public         postgres    false    296    296            �           2606    46837    ayar_prs_myk_tipi_myk_tipi_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.ayar_prs_myk_tipi
    ADD CONSTRAINT ayar_prs_myk_tipi_myk_tipi_key UNIQUE (myk_tipi);
 Z   ALTER TABLE ONLY public.ayar_prs_myk_tipi DROP CONSTRAINT ayar_prs_myk_tipi_myk_tipi_key;
       public         postgres    false    298    298            �           2606    46839    ayar_prs_myk_tipi_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.ayar_prs_myk_tipi
    ADD CONSTRAINT ayar_prs_myk_tipi_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.ayar_prs_myk_tipi DROP CONSTRAINT ayar_prs_myk_tipi_pkey;
       public         postgres    false    298    298            �           2606    46841 (   ayar_prs_personel_tipi_personel_tipi_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_prs_personel_tipi
    ADD CONSTRAINT ayar_prs_personel_tipi_personel_tipi_key UNIQUE (personel_tipi);
 i   ALTER TABLE ONLY public.ayar_prs_personel_tipi DROP CONSTRAINT ayar_prs_personel_tipi_personel_tipi_key;
       public         postgres    false    300    300            �           2606    46843    ayar_prs_personel_tipi_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.ayar_prs_personel_tipi
    ADD CONSTRAINT ayar_prs_personel_tipi_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.ayar_prs_personel_tipi DROP CONSTRAINT ayar_prs_personel_tipi_pkey;
       public         postgres    false    300    300            �           2606    46845    ayar_prs_rapor_tipi_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.ayar_prs_rapor_tipi
    ADD CONSTRAINT ayar_prs_rapor_tipi_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.ayar_prs_rapor_tipi DROP CONSTRAINT ayar_prs_rapor_tipi_pkey;
       public         postgres    false    302    302            �           2606    46847 "   ayar_prs_rapor_tipi_rapor_tipi_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.ayar_prs_rapor_tipi
    ADD CONSTRAINT ayar_prs_rapor_tipi_rapor_tipi_key UNIQUE (rapor_tipi);
 `   ALTER TABLE ONLY public.ayar_prs_rapor_tipi DROP CONSTRAINT ayar_prs_rapor_tipi_rapor_tipi_key;
       public         postgres    false    302    302            �           2606    46849    ayar_prs_src_tipi_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.ayar_prs_src_tipi
    ADD CONSTRAINT ayar_prs_src_tipi_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.ayar_prs_src_tipi DROP CONSTRAINT ayar_prs_src_tipi_pkey;
       public         postgres    false    304    304            �           2606    46851    ayar_prs_src_tipi_src_tipi_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.ayar_prs_src_tipi
    ADD CONSTRAINT ayar_prs_src_tipi_src_tipi_key UNIQUE (src_tipi);
 Z   ALTER TABLE ONLY public.ayar_prs_src_tipi DROP CONSTRAINT ayar_prs_src_tipi_src_tipi_key;
       public         postgres    false    304    304            �           2606    46853    ayar_prs_tatil_tipi_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.ayar_prs_tatil_tipi
    ADD CONSTRAINT ayar_prs_tatil_tipi_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.ayar_prs_tatil_tipi DROP CONSTRAINT ayar_prs_tatil_tipi_pkey;
       public         postgres    false    306    306            �           2606    46855 "   ayar_prs_tatil_tipi_tatil_tipi_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.ayar_prs_tatil_tipi
    ADD CONSTRAINT ayar_prs_tatil_tipi_tatil_tipi_key UNIQUE (tatil_tipi);
 `   ALTER TABLE ONLY public.ayar_prs_tatil_tipi DROP CONSTRAINT ayar_prs_tatil_tipi_tatil_tipi_key;
       public         postgres    false    306    306            �           2606    46857    ayar_prs_yabanci_dil_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.ayar_prs_yabanci_dil
    ADD CONSTRAINT ayar_prs_yabanci_dil_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.ayar_prs_yabanci_dil DROP CONSTRAINT ayar_prs_yabanci_dil_pkey;
       public         postgres    false    308    308            �           2606    46859 "   ayar_prs_yabanci_dil_seviyesi_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.ayar_prs_yabanci_dil_seviyesi
    ADD CONSTRAINT ayar_prs_yabanci_dil_seviyesi_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.ayar_prs_yabanci_dil_seviyesi DROP CONSTRAINT ayar_prs_yabanci_dil_seviyesi_pkey;
       public         postgres    false    310    310            �           2606    46861 6   ayar_prs_yabanci_dil_seviyesi_yabanci_dil_seviyesi_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_prs_yabanci_dil_seviyesi
    ADD CONSTRAINT ayar_prs_yabanci_dil_seviyesi_yabanci_dil_seviyesi_key UNIQUE (yabanci_dil_seviyesi);
 ~   ALTER TABLE ONLY public.ayar_prs_yabanci_dil_seviyesi DROP CONSTRAINT ayar_prs_yabanci_dil_seviyesi_yabanci_dil_seviyesi_key;
       public         postgres    false    310    310            �           2606    46863 $   ayar_prs_yabanci_dil_yabanci_dil_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.ayar_prs_yabanci_dil
    ADD CONSTRAINT ayar_prs_yabanci_dil_yabanci_dil_key UNIQUE (yabanci_dil);
 c   ALTER TABLE ONLY public.ayar_prs_yabanci_dil DROP CONSTRAINT ayar_prs_yabanci_dil_yabanci_dil_key;
       public         postgres    false    308    308            �           2606    46865    ayar_sabit_degisken_deger_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.ayar_sabit_degisken
    ADD CONSTRAINT ayar_sabit_degisken_deger_key UNIQUE (deger);
 [   ALTER TABLE ONLY public.ayar_sabit_degisken DROP CONSTRAINT ayar_sabit_degisken_deger_key;
       public         postgres    false    312    312            �           2606    46867    ayar_sabit_degisken_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.ayar_sabit_degisken
    ADD CONSTRAINT ayar_sabit_degisken_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.ayar_sabit_degisken DROP CONSTRAINT ayar_sabit_degisken_pkey;
       public         postgres    false    312    312            �           2606    46869 (   ayar_sevkiyat_hazirlama_durumu_deger_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_sevkiyat_hazirlama_durumu
    ADD CONSTRAINT ayar_sevkiyat_hazirlama_durumu_deger_key UNIQUE (deger);
 q   ALTER TABLE ONLY public.ayar_sevkiyat_hazirlama_durumu DROP CONSTRAINT ayar_sevkiyat_hazirlama_durumu_deger_key;
       public         postgres    false    314    314            �           2606    46871 #   ayar_sevkiyat_hazirlama_durumu_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ayar_sevkiyat_hazirlama_durumu
    ADD CONSTRAINT ayar_sevkiyat_hazirlama_durumu_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.ayar_sevkiyat_hazirlama_durumu DROP CONSTRAINT ayar_sevkiyat_hazirlama_durumu_pkey;
       public         postgres    false    314    314            �           2606    47423    ayar_stk_cins_ailesi_aile_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.ayar_stk_cins_ailesi
    ADD CONSTRAINT ayar_stk_cins_ailesi_aile_key UNIQUE (aile);
 \   ALTER TABLE ONLY public.ayar_stk_cins_ailesi DROP CONSTRAINT ayar_stk_cins_ailesi_aile_key;
       public         postgres    false    446    446            �           2606    47421    ayar_stk_cins_ailesi_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.ayar_stk_cins_ailesi
    ADD CONSTRAINT ayar_stk_cins_ailesi_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.ayar_stk_cins_ailesi DROP CONSTRAINT ayar_stk_cins_ailesi_pkey;
       public         postgres    false    446    446            �           2606    47506    ayar_stk_cins_ozelligi_cins_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.ayar_stk_cins_ozelligi
    ADD CONSTRAINT ayar_stk_cins_ozelligi_cins_key UNIQUE (cins);
 `   ALTER TABLE ONLY public.ayar_stk_cins_ozelligi DROP CONSTRAINT ayar_stk_cins_ozelligi_cins_key;
       public         postgres    false    450    450            �           2606    47504    ayar_stk_cins_ozelligi_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.ayar_stk_cins_ozelligi
    ADD CONSTRAINT ayar_stk_cins_ozelligi_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.ayar_stk_cins_ozelligi DROP CONSTRAINT ayar_stk_cins_ozelligi_pkey;
       public         postgres    false    450    450            �           2606    47383    ayar_stk_hareket_ayari_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.ayar_stk_hareket_ayari
    ADD CONSTRAINT ayar_stk_hareket_ayari_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.ayar_stk_hareket_ayari DROP CONSTRAINT ayar_stk_hareket_ayari_pkey;
       public         postgres    false    442    442            �           2606    47372    ayar_stk_hareket_tipi_deger_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.ayar_stk_hareket_tipi
    ADD CONSTRAINT ayar_stk_hareket_tipi_deger_key UNIQUE (deger);
 _   ALTER TABLE ONLY public.ayar_stk_hareket_tipi DROP CONSTRAINT ayar_stk_hareket_tipi_deger_key;
       public         postgres    false    440    440            �           2606    47374 "   ayar_stk_hareket_tipi_is_input_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.ayar_stk_hareket_tipi
    ADD CONSTRAINT ayar_stk_hareket_tipi_is_input_key UNIQUE (is_input);
 b   ALTER TABLE ONLY public.ayar_stk_hareket_tipi DROP CONSTRAINT ayar_stk_hareket_tipi_is_input_key;
       public         postgres    false    440    440            �           2606    47370    ayar_stk_hareket_tipi_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.ayar_stk_hareket_tipi
    ADD CONSTRAINT ayar_stk_hareket_tipi_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.ayar_stk_hareket_tipi DROP CONSTRAINT ayar_stk_hareket_tipi_pkey;
       public         postgres    false    440    440            �           2606    47542    ayar_stk_stok_grubu_grup_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.ayar_stk_stok_grubu
    ADD CONSTRAINT ayar_stk_stok_grubu_grup_key UNIQUE (grup);
 Z   ALTER TABLE ONLY public.ayar_stk_stok_grubu DROP CONSTRAINT ayar_stk_stok_grubu_grup_key;
       public         postgres    false    452    452            �           2606    47540    ayar_stk_stok_grubu_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.ayar_stk_stok_grubu
    ADD CONSTRAINT ayar_stk_stok_grubu_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.ayar_stk_stok_grubu DROP CONSTRAINT ayar_stk_stok_grubu_pkey;
       public         postgres    false    452    452            �           2606    47404    ayar_stk_stok_tipi_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.ayar_stk_stok_tipi
    ADD CONSTRAINT ayar_stk_stok_tipi_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.ayar_stk_stok_tipi DROP CONSTRAINT ayar_stk_stok_tipi_pkey;
       public         postgres    false    444    444            �           2606    47406 %   ayar_stk_stok_tipi_tip_is_default_key 
   CONSTRAINT     ~   ALTER TABLE ONLY public.ayar_stk_stok_tipi
    ADD CONSTRAINT ayar_stk_stok_tipi_tip_is_default_key UNIQUE (tip, is_default);
 b   ALTER TABLE ONLY public.ayar_stk_stok_tipi DROP CONSTRAINT ayar_stk_stok_tipi_tip_is_default_key;
       public         postgres    false    444    444    444            �           2606    47408    ayar_stk_stok_tipi_tip_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.ayar_stk_stok_tipi
    ADD CONSTRAINT ayar_stk_stok_tipi_tip_key UNIQUE (tip);
 W   ALTER TABLE ONLY public.ayar_stk_stok_tipi DROP CONSTRAINT ayar_stk_stok_tipi_tip_key;
       public         postgres    false    444    444            �           2606    47550    ayar_stk_urun_tipi_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.ayar_stk_urun_tipi
    ADD CONSTRAINT ayar_stk_urun_tipi_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.ayar_stk_urun_tipi DROP CONSTRAINT ayar_stk_urun_tipi_pkey;
       public         postgres    false    454    454            �           2606    47552    ayar_stk_urun_tipi_tip_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.ayar_stk_urun_tipi
    ADD CONSTRAINT ayar_stk_urun_tipi_tip_key UNIQUE (tip);
 W   ALTER TABLE ONLY public.ayar_stk_urun_tipi DROP CONSTRAINT ayar_stk_urun_tipi_tip_key;
       public         postgres    false    454    454            �           2606    46881    ayar_teklif_durum_deger_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.ayar_teklif_durum
    ADD CONSTRAINT ayar_teklif_durum_deger_key UNIQUE (deger);
 W   ALTER TABLE ONLY public.ayar_teklif_durum DROP CONSTRAINT ayar_teklif_durum_deger_key;
       public         postgres    false    316    316            �           2606    46883    ayar_teklif_durum_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.ayar_teklif_durum
    ADD CONSTRAINT ayar_teklif_durum_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.ayar_teklif_durum DROP CONSTRAINT ayar_teklif_durum_pkey;
       public         postgres    false    316    316            �           2606    46885    ayar_teklif_tipi_deger_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.ayar_teklif_tipi
    ADD CONSTRAINT ayar_teklif_tipi_deger_key UNIQUE (deger);
 U   ALTER TABLE ONLY public.ayar_teklif_tipi DROP CONSTRAINT ayar_teklif_tipi_deger_key;
       public         postgres    false    318    318            �           2606    46887    ayar_teklif_tipi_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.ayar_teklif_tipi
    ADD CONSTRAINT ayar_teklif_tipi_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.ayar_teklif_tipi DROP CONSTRAINT ayar_teklif_tipi_pkey;
       public         postgres    false    318    318            �           2606    46889    ayar_vergi_orani_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.ayar_vergi_orani
    ADD CONSTRAINT ayar_vergi_orani_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.ayar_vergi_orani DROP CONSTRAINT ayar_vergi_orani_pkey;
       public         postgres    false    320    320            �           2606    46891     ayar_vergi_orani_vergi_orani_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.ayar_vergi_orani
    ADD CONSTRAINT ayar_vergi_orani_vergi_orani_key UNIQUE (vergi_orani);
 [   ALTER TABLE ONLY public.ayar_vergi_orani DROP CONSTRAINT ayar_vergi_orani_vergi_orani_key;
       public         postgres    false    320    320            �           2606    46893    banka_adi_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.banka
    ADD CONSTRAINT banka_adi_key UNIQUE (adi);
 =   ALTER TABLE ONLY public.banka DROP CONSTRAINT banka_adi_key;
       public         postgres    false    322    322            �           2606    46895 
   banka_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.banka
    ADD CONSTRAINT banka_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.banka DROP CONSTRAINT banka_pkey;
       public         postgres    false    322    322            �           2606    46897    banka_subesi_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.banka_subesi
    ADD CONSTRAINT banka_subesi_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.banka_subesi DROP CONSTRAINT banka_subesi_pkey;
       public         postgres    false    324    324            �           2606    46899    barkod_hazirlik_dosya_turu_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.barkod_hazirlik_dosya_turu
    ADD CONSTRAINT barkod_hazirlik_dosya_turu_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.barkod_hazirlik_dosya_turu DROP CONSTRAINT barkod_hazirlik_dosya_turu_pkey;
       public         postgres    false    326    326            �           2606    46901 "   barkod_hazirlik_dosya_turu_tur_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.barkod_hazirlik_dosya_turu
    ADD CONSTRAINT barkod_hazirlik_dosya_turu_tur_key UNIQUE (tur);
 g   ALTER TABLE ONLY public.barkod_hazirlik_dosya_turu DROP CONSTRAINT barkod_hazirlik_dosya_turu_tur_key;
       public         postgres    false    326    326            �           2606    46903    barkod_serino_turu_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.barkod_serino_turu
    ADD CONSTRAINT barkod_serino_turu_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.barkod_serino_turu DROP CONSTRAINT barkod_serino_turu_pkey;
       public         postgres    false    328    328            �           2606    46905    barkod_serino_turu_tur_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.barkod_serino_turu
    ADD CONSTRAINT barkod_serino_turu_tur_key UNIQUE (tur);
 W   ALTER TABLE ONLY public.barkod_serino_turu DROP CONSTRAINT barkod_serino_turu_tur_key;
       public         postgres    false    328    328            �           2606    46907    barkod_tezgah_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.barkod_tezgah
    ADD CONSTRAINT barkod_tezgah_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.barkod_tezgah DROP CONSTRAINT barkod_tezgah_pkey;
       public         postgres    false    330    330            �           2606    46909 %   barkod_tezgah_tezgah_adi_ambar_id_key 
   CONSTRAINT     ~   ALTER TABLE ONLY public.barkod_tezgah
    ADD CONSTRAINT barkod_tezgah_tezgah_adi_ambar_id_key UNIQUE (tezgah_adi, ambar_id);
 ]   ALTER TABLE ONLY public.barkod_tezgah DROP CONSTRAINT barkod_tezgah_tezgah_adi_ambar_id_key;
       public         postgres    false    330    330    330            �           2606    46911    bb_kayitlar_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.bb_kayitlar
    ADD CONSTRAINT bb_kayitlar_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.bb_kayitlar DROP CONSTRAINT bb_kayitlar_pkey;
       public         postgres    false    332    332            �           2606    46913    bolge_bolge_adi_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.bolge
    ADD CONSTRAINT bolge_bolge_adi_key UNIQUE (bolge_adi);
 C   ALTER TABLE ONLY public.bolge DROP CONSTRAINT bolge_bolge_adi_key;
       public         postgres    false    334    334            �           2606    46915 
   bolge_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.bolge
    ADD CONSTRAINT bolge_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.bolge DROP CONSTRAINT bolge_pkey;
       public         postgres    false    334    334                       2606    46917    bolge_turu_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.bolge_turu
    ADD CONSTRAINT bolge_turu_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.bolge_turu DROP CONSTRAINT bolge_turu_pkey;
       public         postgres    false    336    336                       2606    46919    bolge_turu_tur_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.bolge_turu
    ADD CONSTRAINT bolge_turu_tur_key UNIQUE (tur);
 G   ALTER TABLE ONLY public.bolge_turu DROP CONSTRAINT bolge_turu_tur_key;
       public         postgres    false    336    336                       2606    46921    doviz_kuru_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.doviz_kuru
    ADD CONSTRAINT doviz_kuru_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.doviz_kuru DROP CONSTRAINT doviz_kuru_pkey;
       public         postgres    false    338    338                       2606    46923     doviz_kuru_tarih_para_birimi_key 
   CONSTRAINT     t   ALTER TABLE ONLY public.doviz_kuru
    ADD CONSTRAINT doviz_kuru_tarih_para_birimi_key UNIQUE (tarih, para_birimi);
 U   ALTER TABLE ONLY public.doviz_kuru DROP CONSTRAINT doviz_kuru_tarih_para_birimi_key;
       public         postgres    false    338    338    338            W           2606    46925    efatura_vergi_kodu_kodu_key 
   CONSTRAINT     n   ALTER TABLE ONLY public.ayar_efatura_vergi_kodu
    ADD CONSTRAINT efatura_vergi_kodu_kodu_key UNIQUE (kodu);
 ]   ALTER TABLE ONLY public.ayar_efatura_vergi_kodu DROP CONSTRAINT efatura_vergi_kodu_kodu_key;
       public         postgres    false    249    249            Y           2606    46927    efatura_vergi_kodu_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.ayar_efatura_vergi_kodu
    ADD CONSTRAINT efatura_vergi_kodu_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY public.ayar_efatura_vergi_kodu DROP CONSTRAINT efatura_vergi_kodu_pkey;
       public         postgres    false    249    249            	           2606    46929    hesap_grubu_grup_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.hesap_grubu
    ADD CONSTRAINT hesap_grubu_grup_key UNIQUE (grup);
 J   ALTER TABLE ONLY public.hesap_grubu DROP CONSTRAINT hesap_grubu_grup_key;
       public         postgres    false    340    340                       2606    46931    hesap_grubu_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.hesap_grubu
    ADD CONSTRAINT hesap_grubu_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.hesap_grubu DROP CONSTRAINT hesap_grubu_pkey;
       public         postgres    false    340    340                       2606    46933    hesap_karti_hesap_kodu_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.hesap_karti
    ADD CONSTRAINT hesap_karti_hesap_kodu_key UNIQUE (hesap_kodu);
 P   ALTER TABLE ONLY public.hesap_karti DROP CONSTRAINT hesap_karti_hesap_kodu_key;
       public         postgres    false    342    342                       2606    46935    hesap_karti_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.hesap_karti
    ADD CONSTRAINT hesap_karti_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.hesap_karti DROP CONSTRAINT hesap_karti_pkey;
       public         postgres    false    342    342                       2606    46937    hesap_plani_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.hesap_plani
    ADD CONSTRAINT hesap_plani_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.hesap_plani DROP CONSTRAINT hesap_plani_pkey;
       public         postgres    false    344    344                       2606    46941    medeni_durum_durum_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.medeni_durum
    ADD CONSTRAINT medeni_durum_durum_key UNIQUE (durum);
 M   ALTER TABLE ONLY public.medeni_durum DROP CONSTRAINT medeni_durum_durum_key;
       public         postgres    false    346    346                       2606    46943    medeni_durum_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.medeni_durum
    ADD CONSTRAINT medeni_durum_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.medeni_durum DROP CONSTRAINT medeni_durum_pkey;
       public         postgres    false    346    346                       2606    46945    muhasebe_hesap_plani_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.muhasebe_hesap_plani
    ADD CONSTRAINT muhasebe_hesap_plani_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.muhasebe_hesap_plani DROP CONSTRAINT muhasebe_hesap_plani_pkey;
       public         postgres    false    348    348                       2606    46947 "   muhasebe_hesap_plani_plan_kodu_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.muhasebe_hesap_plani
    ADD CONSTRAINT muhasebe_hesap_plani_plan_kodu_key UNIQUE (plan_kodu);
 a   ALTER TABLE ONLY public.muhasebe_hesap_plani DROP CONSTRAINT muhasebe_hesap_plani_plan_kodu_key;
       public         postgres    false    348    348                       2606    46949 '   muhasebe_hesap_plani_tek_duzen_kodu_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.muhasebe_hesap_plani
    ADD CONSTRAINT muhasebe_hesap_plani_tek_duzen_kodu_key UNIQUE (tek_duzen_kodu);
 f   ALTER TABLE ONLY public.muhasebe_hesap_plani DROP CONSTRAINT muhasebe_hesap_plani_tek_duzen_kodu_key;
       public         postgres    false    348    348                       2606    46951    musteri_temsilci_grubu_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.musteri_temsilci_grubu
    ADD CONSTRAINT musteri_temsilci_grubu_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.musteri_temsilci_grubu DROP CONSTRAINT musteri_temsilci_grubu_pkey;
       public         postgres    false    350    350                       2606    46953 ,   musteri_temsilci_grubu_temsilci_grup_adi_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.musteri_temsilci_grubu
    ADD CONSTRAINT musteri_temsilci_grubu_temsilci_grup_adi_key UNIQUE (temsilci_grup_adi);
 m   ALTER TABLE ONLY public.musteri_temsilci_grubu DROP CONSTRAINT musteri_temsilci_grubu_temsilci_grup_adi_key;
       public         postgres    false    350    350            !           2606    46955    olcu_birimi_birim_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.olcu_birimi
    ADD CONSTRAINT olcu_birimi_birim_key UNIQUE (birim);
 K   ALTER TABLE ONLY public.olcu_birimi DROP CONSTRAINT olcu_birimi_birim_key;
       public         postgres    false    352    352            #           2606    46957    olcu_birimi_efatura_birim_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.olcu_birimi
    ADD CONSTRAINT olcu_birimi_efatura_birim_key UNIQUE (efatura_birim);
 S   ALTER TABLE ONLY public.olcu_birimi DROP CONSTRAINT olcu_birimi_efatura_birim_key;
       public         postgres    false    352    352            %           2606    46959    olcu_birimi_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.olcu_birimi
    ADD CONSTRAINT olcu_birimi_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.olcu_birimi DROP CONSTRAINT olcu_birimi_pkey;
       public         postgres    false    352    352            '           2606    46961    para_birimi_kod_ukey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.para_birimi
    ADD CONSTRAINT para_birimi_kod_ukey UNIQUE (kod);
 J   ALTER TABLE ONLY public.para_birimi DROP CONSTRAINT para_birimi_kod_ukey;
       public         postgres    false    354    354            )           2606    46963    para_birimi_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.para_birimi
    ADD CONSTRAINT para_birimi_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.para_birimi DROP CONSTRAINT para_birimi_pkey;
       public         postgres    false    354    354            +           2606    46965 !   personel_ayrilma_nedeni_tipi_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.personel_ayrilma_nedeni_tipi
    ADD CONSTRAINT personel_ayrilma_nedeni_tipi_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.personel_ayrilma_nedeni_tipi DROP CONSTRAINT personel_ayrilma_nedeni_tipi_pkey;
       public         postgres    false    356    356            -           2606    46967 $   personel_ayrilma_nedeni_tipi_tip_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.personel_ayrilma_nedeni_tipi
    ADD CONSTRAINT personel_ayrilma_nedeni_tipi_tip_key UNIQUE (tip);
 k   ALTER TABLE ONLY public.personel_ayrilma_nedeni_tipi DROP CONSTRAINT personel_ayrilma_nedeni_tipi_tip_key;
       public         postgres    false    356    356            /           2606    46969    personel_calisma_gecmisi_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.personel_calisma_gecmisi
    ADD CONSTRAINT personel_calisma_gecmisi_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.personel_calisma_gecmisi DROP CONSTRAINT personel_calisma_gecmisi_pkey;
       public         postgres    false    358    358            1           2606    46971 +   personel_dil_bilgisi_dil_id_personel_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.personel_dil_bilgisi
    ADD CONSTRAINT personel_dil_bilgisi_dil_id_personel_id_key UNIQUE (dil_id, personel_id);
 j   ALTER TABLE ONLY public.personel_dil_bilgisi DROP CONSTRAINT personel_dil_bilgisi_dil_id_personel_id_key;
       public         postgres    false    360    360    360            3           2606    46973    personel_dil_bilgisi_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.personel_dil_bilgisi
    ADD CONSTRAINT personel_dil_bilgisi_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.personel_dil_bilgisi DROP CONSTRAINT personel_dil_bilgisi_pkey;
       public         postgres    false    360    360            5           2606    46975    personel_karti_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.personel_karti
    ADD CONSTRAINT personel_karti_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.personel_karti DROP CONSTRAINT personel_karti_pkey;
       public         postgres    false    362    362            7           2606    46977    personel_pdks_kart_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.personel_pdks_kart
    ADD CONSTRAINT personel_pdks_kart_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.personel_pdks_kart DROP CONSTRAINT personel_pdks_kart_pkey;
       public         postgres    false    364    364            9           2606    46979    personel_servis_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.personel_tasima_servis
    ADD CONSTRAINT personel_servis_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.personel_tasima_servis DROP CONSTRAINT personel_servis_pkey;
       public         postgres    false    366    366            ;           2606    46981 $   personel_tasima_servis_servis_no_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.personel_tasima_servis
    ADD CONSTRAINT personel_tasima_servis_servis_no_key UNIQUE (servis_no);
 e   ALTER TABLE ONLY public.personel_tasima_servis DROP CONSTRAINT personel_tasima_servis_servis_no_key;
       public         postgres    false    366    366            =           2606    46983 *   quality_form_mail_reciever_mail_adresi_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.quality_form_mail_reciever
    ADD CONSTRAINT quality_form_mail_reciever_mail_adresi_key UNIQUE (mail_adresi);
 o   ALTER TABLE ONLY public.quality_form_mail_reciever DROP CONSTRAINT quality_form_mail_reciever_mail_adresi_key;
       public         postgres    false    368    368            ?           2606    46985    quality_form_mail_reciever_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.quality_form_mail_reciever
    ADD CONSTRAINT quality_form_mail_reciever_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.quality_form_mail_reciever DROP CONSTRAINT quality_form_mail_reciever_pkey;
       public         postgres    false    368    368            E           2606    46987    recete_hammadde_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.recete_hammadde
    ADD CONSTRAINT recete_hammadde_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.recete_hammadde DROP CONSTRAINT recete_hammadde_pkey;
       public         postgres    false    371    371            G           2606    46989 '   recete_hammadde_stok_kodu_header_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.recete_hammadde
    ADD CONSTRAINT recete_hammadde_stok_kodu_header_id_key UNIQUE (stok_kodu, header_id);
 a   ALTER TABLE ONLY public.recete_hammadde DROP CONSTRAINT recete_hammadde_stok_kodu_header_id_key;
       public         postgres    false    371    371    371            A           2606    46991    recete_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.recete
    ADD CONSTRAINT recete_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.recete DROP CONSTRAINT recete_pkey;
       public         postgres    false    370    370            C           2606    46993    recete_recete_adi_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.recete
    ADD CONSTRAINT recete_recete_adi_key UNIQUE (recete_adi);
 F   ALTER TABLE ONLY public.recete DROP CONSTRAINT recete_recete_adi_key;
       public         postgres    false    370    370            K           2606    46995    satis_fatura_detay_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.satis_fatura_detay
    ADD CONSTRAINT satis_fatura_detay_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.satis_fatura_detay DROP CONSTRAINT satis_fatura_detay_pkey;
       public         postgres    false    375    375            I           2606    46997    satis_fatura_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.satis_fatura
    ADD CONSTRAINT satis_fatura_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.satis_fatura DROP CONSTRAINT satis_fatura_pkey;
       public         postgres    false    374    374            O           2606    46999    satis_irsaliye_detay_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.satis_irsaliye_detay
    ADD CONSTRAINT satis_irsaliye_detay_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.satis_irsaliye_detay DROP CONSTRAINT satis_irsaliye_detay_pkey;
       public         postgres    false    379    379            M           2606    47001    satis_irsaliye_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.satis_irsaliye
    ADD CONSTRAINT satis_irsaliye_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.satis_irsaliye DROP CONSTRAINT satis_irsaliye_pkey;
       public         postgres    false    378    378            S           2606    47003    satis_siparis_detay_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.satis_siparis_detay
    ADD CONSTRAINT satis_siparis_detay_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.satis_siparis_detay DROP CONSTRAINT satis_siparis_detay_pkey;
       public         postgres    false    383    383            Q           2606    47005    satis_siparis_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.satis_siparis
    ADD CONSTRAINT satis_siparis_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.satis_siparis DROP CONSTRAINT satis_siparis_pkey;
       public         postgres    false    382    382            W           2606    47007    satis_teklif_detay_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.satis_teklif_detay
    ADD CONSTRAINT satis_teklif_detay_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.satis_teklif_detay DROP CONSTRAINT satis_teklif_detay_pkey;
       public         postgres    false    387    387            U           2606    47009    satis_teklif_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.satis_teklif
    ADD CONSTRAINT satis_teklif_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.satis_teklif DROP CONSTRAINT satis_teklif_pkey;
       public         postgres    false    386    386            �           2606    47482    stok_grubu_turu_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.ayar_stk_stok_grubu_turu
    ADD CONSTRAINT stok_grubu_turu_pkey PRIMARY KEY (id);
 W   ALTER TABLE ONLY public.ayar_stk_stok_grubu_turu DROP CONSTRAINT stok_grubu_turu_pkey;
       public         postgres    false    448    448            �           2606    47484    stok_grubu_turu_tur_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.ayar_stk_stok_grubu_turu
    ADD CONSTRAINT stok_grubu_turu_tur_key UNIQUE (stok_grubu_tur);
 Z   ALTER TABLE ONLY public.ayar_stk_stok_grubu_turu DROP CONSTRAINT stok_grubu_turu_tur_key;
       public         postgres    false    448    448            Y           2606    47027    stok_hareketi_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.stok_hareketi
    ADD CONSTRAINT stok_hareketi_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.stok_hareketi DROP CONSTRAINT stok_hareketi_pkey;
       public         postgres    false    390    390            [           2606    47029    stok_karti_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.stok_karti
    ADD CONSTRAINT stok_karti_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.stok_karti DROP CONSTRAINT stok_karti_pkey;
       public         postgres    false    392    392            ]           2606    47031    stok_karti_stok_kodu_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.stok_karti
    ADD CONSTRAINT stok_karti_stok_kodu_key UNIQUE (stok_kodu);
 M   ALTER TABLE ONLY public.stok_karti DROP CONSTRAINT stok_karti_stok_kodu_key;
       public         postgres    false    392    392            a           2606    47039 #   sys_application_settings_other_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.sys_application_settings_other
    ADD CONSTRAINT sys_application_settings_other_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.sys_application_settings_other DROP CONSTRAINT sys_application_settings_other_pkey;
       public         postgres    false    396    396            _           2606    47041    sys_application_settings_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.sys_application_settings
    ADD CONSTRAINT sys_application_settings_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.sys_application_settings DROP CONSTRAINT sys_application_settings_pkey;
       public         postgres    false    394    394            c           2606    47043    sys_city_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sys_city
    ADD CONSTRAINT sys_city_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sys_city DROP CONSTRAINT sys_city_pkey;
       public         postgres    false    398    398            e           2606    47045    sys_country_country_code_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.sys_country
    ADD CONSTRAINT sys_country_country_code_key UNIQUE (country_code);
 R   ALTER TABLE ONLY public.sys_country DROP CONSTRAINT sys_country_country_code_key;
       public         postgres    false    400    400            g           2606    47047    sys_country_country_name_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.sys_country
    ADD CONSTRAINT sys_country_country_name_key UNIQUE (country_name);
 R   ALTER TABLE ONLY public.sys_country DROP CONSTRAINT sys_country_country_name_key;
       public         postgres    false    400    400            i           2606    47049    sys_country_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.sys_country
    ADD CONSTRAINT sys_country_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.sys_country DROP CONSTRAINT sys_country_pkey;
       public         postgres    false    400    400            k           2606    47051    sys_grid_col_color_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.sys_grid_col_color
    ADD CONSTRAINT sys_grid_col_color_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.sys_grid_col_color DROP CONSTRAINT sys_grid_col_color_pkey;
       public         postgres    false    402    402            m           2606    47053 -   sys_grid_col_color_table_name_column_name_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.sys_grid_col_color
    ADD CONSTRAINT sys_grid_col_color_table_name_column_name_key UNIQUE (table_name, column_name);
 j   ALTER TABLE ONLY public.sys_grid_col_color DROP CONSTRAINT sys_grid_col_color_table_name_column_name_key;
       public         postgres    false    402    402    402            o           2606    47055    sys_grid_col_percent_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.sys_grid_col_percent
    ADD CONSTRAINT sys_grid_col_percent_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.sys_grid_col_percent DROP CONSTRAINT sys_grid_col_percent_pkey;
       public         postgres    false    404    404            q           2606    47057 /   sys_grid_col_percent_table_name_column_name_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.sys_grid_col_percent
    ADD CONSTRAINT sys_grid_col_percent_table_name_column_name_key UNIQUE (table_name, column_name);
 n   ALTER TABLE ONLY public.sys_grid_col_percent DROP CONSTRAINT sys_grid_col_percent_table_name_column_name_key;
       public         postgres    false    404    404    404            s           2606    47059    sys_grid_col_width_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.sys_grid_col_width
    ADD CONSTRAINT sys_grid_col_width_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.sys_grid_col_width DROP CONSTRAINT sys_grid_col_width_pkey;
       public         postgres    false    406    406            u           2606    47061 -   sys_grid_col_width_table_name_column_name_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.sys_grid_col_width
    ADD CONSTRAINT sys_grid_col_width_table_name_column_name_key UNIQUE (table_name, column_name);
 j   ALTER TABLE ONLY public.sys_grid_col_width DROP CONSTRAINT sys_grid_col_width_table_name_column_name_key;
       public         postgres    false    406    406    406            w           2606    47063 -   sys_grid_col_width_table_name_sequence_no_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.sys_grid_col_width
    ADD CONSTRAINT sys_grid_col_width_table_name_sequence_no_key UNIQUE (table_name, sequence_no);
 j   ALTER TABLE ONLY public.sys_grid_col_width DROP CONSTRAINT sys_grid_col_width_table_name_sequence_no_key;
       public         postgres    false    406    406    406            y           2606    47065 .   sys_grid_default_order_filter_key_is_order_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.sys_grid_default_order_filter
    ADD CONSTRAINT sys_grid_default_order_filter_key_is_order_key UNIQUE (key, is_order);
 v   ALTER TABLE ONLY public.sys_grid_default_order_filter DROP CONSTRAINT sys_grid_default_order_filter_key_is_order_key;
       public         postgres    false    408    408    408            {           2606    47067 "   sys_grid_default_order_filter_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.sys_grid_default_order_filter
    ADD CONSTRAINT sys_grid_default_order_filter_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.sys_grid_default_order_filter DROP CONSTRAINT sys_grid_default_order_filter_pkey;
       public         postgres    false    408    408            �           2606    47069 <   sys_lang_data_content_lang_table_name_column_name_row_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.sys_lang_data_content
    ADD CONSTRAINT sys_lang_data_content_lang_table_name_column_name_row_id_key UNIQUE (lang, table_name, column_name, row_id);
 |   ALTER TABLE ONLY public.sys_lang_data_content DROP CONSTRAINT sys_lang_data_content_lang_table_name_column_name_row_id_key;
       public         postgres    false    411    411    411    411    411            �           2606    47071    sys_lang_data_content_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.sys_lang_data_content
    ADD CONSTRAINT sys_lang_data_content_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.sys_lang_data_content DROP CONSTRAINT sys_lang_data_content_pkey;
       public         postgres    false    411    411            �           2606    47073 :   sys_lang_gui_content_lang_code_content_type_table_name_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.sys_lang_gui_content
    ADD CONSTRAINT sys_lang_gui_content_lang_code_content_type_table_name_key UNIQUE (lang, code, content_type, table_name);
 y   ALTER TABLE ONLY public.sys_lang_gui_content DROP CONSTRAINT sys_lang_gui_content_lang_code_content_type_table_name_key;
       public         postgres    false    413    413    413    413    413            �           2606    47075    sys_lang_gui_content_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.sys_lang_gui_content
    ADD CONSTRAINT sys_lang_gui_content_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.sys_lang_gui_content DROP CONSTRAINT sys_lang_gui_content_pkey;
       public         postgres    false    413    413            }           2606    47077    sys_lang_language_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.sys_lang
    ADD CONSTRAINT sys_lang_language_key UNIQUE (language);
 H   ALTER TABLE ONLY public.sys_lang DROP CONSTRAINT sys_lang_language_key;
       public         postgres    false    410    410                       2606    47079    sys_lang_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sys_lang
    ADD CONSTRAINT sys_lang_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sys_lang DROP CONSTRAINT sys_lang_pkey;
       public         postgres    false    410    410            �           2606    47081 #   sys_multi_lang_data_table_list_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.sys_multi_lang_data_table_list
    ADD CONSTRAINT sys_multi_lang_data_table_list_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.sys_multi_lang_data_table_list DROP CONSTRAINT sys_multi_lang_data_table_list_pkey;
       public         postgres    false    416    416            �           2606    47083 -   sys_multi_lang_data_table_list_table_name_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.sys_multi_lang_data_table_list
    ADD CONSTRAINT sys_multi_lang_data_table_list_table_name_key UNIQUE (table_name);
 v   ALTER TABLE ONLY public.sys_multi_lang_data_table_list DROP CONSTRAINT sys_multi_lang_data_table_list_table_name_key;
       public         postgres    false    416    416            �           2606    47085 #   sys_permission_source_group_id_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.sys_permission_source_group
    ADD CONSTRAINT sys_permission_source_group_id_pkey PRIMARY KEY (id);
 i   ALTER TABLE ONLY public.sys_permission_source_group DROP CONSTRAINT sys_permission_source_group_id_pkey;
       public         postgres    false    419    419            �           2606    47087 -   sys_permission_source_group_source_group_ukey 
   CONSTRAINT     �   ALTER TABLE ONLY public.sys_permission_source_group
    ADD CONSTRAINT sys_permission_source_group_source_group_ukey UNIQUE (source_group);
 s   ALTER TABLE ONLY public.sys_permission_source_group DROP CONSTRAINT sys_permission_source_group_source_group_ukey;
       public         postgres    false    419    419            �           2606    47089    sys_permission_source_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.sys_permission_source
    ADD CONSTRAINT sys_permission_source_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.sys_permission_source DROP CONSTRAINT sys_permission_source_pkey;
       public         postgres    false    418    418            �           2606    47091 %   sys_permission_source_source_code_key 
   CONSTRAINT     }   ALTER TABLE ONLY public.sys_permission_source
    ADD CONSTRAINT sys_permission_source_source_code_key UNIQUE (source_code);
 e   ALTER TABLE ONLY public.sys_permission_source DROP CONSTRAINT sys_permission_source_source_code_key;
       public         postgres    false    418    418            �           2606    47093    sys_quality_form_number_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.sys_quality_form_number
    ADD CONSTRAINT sys_quality_form_number_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.sys_quality_form_number DROP CONSTRAINT sys_quality_form_number_pkey;
       public         postgres    false    422    422            �           2606    47095 4   sys_quality_form_number_table_name_is_input_form_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.sys_quality_form_number
    ADD CONSTRAINT sys_quality_form_number_table_name_is_input_form_key UNIQUE (table_name, is_input_form);
 v   ALTER TABLE ONLY public.sys_quality_form_number DROP CONSTRAINT sys_quality_form_number_table_name_is_input_form_key;
       public         postgres    false    422    422    422            �           2606    47097    sys_taxpayer_type_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.sys_taxpayer_type
    ADD CONSTRAINT sys_taxpayer_type_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.sys_taxpayer_type DROP CONSTRAINT sys_taxpayer_type_pkey;
       public         postgres    false    424    424            �           2606    47099 #   sys_taxpayer_type_taxpayer_type_key 
   CONSTRAINT     y   ALTER TABLE ONLY public.sys_taxpayer_type
    ADD CONSTRAINT sys_taxpayer_type_taxpayer_type_key UNIQUE (taxpayer_type);
 _   ALTER TABLE ONLY public.sys_taxpayer_type DROP CONSTRAINT sys_taxpayer_type_taxpayer_type_key;
       public         postgres    false    424    424            �           2606    47101    sys_user_access_right_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.sys_user_access_right
    ADD CONSTRAINT sys_user_access_right_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.sys_user_access_right DROP CONSTRAINT sys_user_access_right_pkey;
       public         postgres    false    427    427            �           2606    47103 /   sys_user_access_right_source_code_user_name_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_access_right
    ADD CONSTRAINT sys_user_access_right_source_code_user_name_key UNIQUE (source_code, user_name);
 o   ALTER TABLE ONLY public.sys_user_access_right DROP CONSTRAINT sys_user_access_right_source_code_user_name_key;
       public         postgres    false    427    427    427            �           2606    47105 #   sys_user_mac_address_exception_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_mac_address_exception
    ADD CONSTRAINT sys_user_mac_address_exception_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.sys_user_mac_address_exception DROP CONSTRAINT sys_user_mac_address_exception_pkey;
       public         postgres    false    430    430            �           2606    47107 7   sys_user_mac_address_exception_user_name_ip_address_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_mac_address_exception
    ADD CONSTRAINT sys_user_mac_address_exception_user_name_ip_address_key UNIQUE (user_name, ip_address);
 �   ALTER TABLE ONLY public.sys_user_mac_address_exception DROP CONSTRAINT sys_user_mac_address_exception_user_name_ip_address_key;
       public         postgres    false    430    430    430            �           2606    47109    sys_user_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT sys_user_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT sys_user_pkey;
       public         postgres    false    426    426            �           2606    47111    sys_user_user_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT sys_user_user_name_key UNIQUE (user_name);
 I   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT sys_user_user_name_key;
       public         postgres    false    426    426            �           2606    47113    urun_kabul_red_nedeni_deger_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.urun_kabul_red_nedeni
    ADD CONSTRAINT urun_kabul_red_nedeni_deger_key UNIQUE (deger);
 _   ALTER TABLE ONLY public.urun_kabul_red_nedeni DROP CONSTRAINT urun_kabul_red_nedeni_deger_key;
       public         postgres    false    435    435            �           2606    47115    urun_kabul_red_nedeni_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.urun_kabul_red_nedeni
    ADD CONSTRAINT urun_kabul_red_nedeni_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.urun_kabul_red_nedeni DROP CONSTRAINT urun_kabul_red_nedeni_pkey;
       public         postgres    false    435    435                       2620    47116    audit    TRIGGER     �   CREATE TRIGGER audit AFTER INSERT OR DELETE OR UPDATE ON public.urun_kabul_red_nedeni FOR EACH ROW EXECUTE PROCEDURE public.audit();
 4   DROP TRIGGER audit ON public.urun_kabul_red_nedeni;
       public       postgres    false    497    435            �           2620    47118    audit    TRIGGER     �   CREATE TRIGGER audit AFTER INSERT OR DELETE OR UPDATE ON public.ayar_barkod_hazirlik_dosya_turu FOR EACH ROW EXECUTE PROCEDURE public.audit();
 >   DROP TRIGGER audit ON public.ayar_barkod_hazirlik_dosya_turu;
       public       postgres    false    191    497                        2620    47119    audit    TRIGGER     �   CREATE TRIGGER audit AFTER INSERT OR DELETE OR UPDATE ON public.ayar_barkod_tezgah FOR EACH ROW EXECUTE PROCEDURE public.audit();
 1   DROP TRIGGER audit ON public.ayar_barkod_tezgah;
       public       postgres    false    497    195                       2620    47120    audit    TRIGGER     �   CREATE TRIGGER audit AFTER INSERT OR DELETE OR UPDATE ON public.ayar_barkod_urun_turu FOR EACH ROW EXECUTE PROCEDURE public.audit();
 4   DROP TRIGGER audit ON public.ayar_barkod_urun_turu;
       public       postgres    false    497    197            �           2620    47121    audit    TRIGGER     �   CREATE TRIGGER audit AFTER INSERT OR DELETE OR UPDATE ON public.ayar_barkod_serino_turu FOR EACH ROW EXECUTE PROCEDURE public.audit();
 6   DROP TRIGGER audit ON public.ayar_barkod_serino_turu;
       public       postgres    false    497    193                       2620    47123    delete_table_lang_content    TRIGGER     �   CREATE TRIGGER delete_table_lang_content AFTER DELETE ON public.ayar_prs_gorev FOR EACH ROW EXECUTE PROCEDURE public.delete_table_lang_content();
 A   DROP TRIGGER delete_table_lang_content ON public.ayar_prs_gorev;
       public       postgres    false    511    289                       2620    47124    delete_table_lang_content    TRIGGER     �   CREATE TRIGGER delete_table_lang_content AFTER DELETE ON public.ayar_prs_bolum FOR EACH ROW EXECUTE PROCEDURE public.delete_table_lang_content();
 A   DROP TRIGGER delete_table_lang_content ON public.ayar_prs_bolum;
       public       postgres    false    511    283                       2620    47125    delete_table_lang_content    TRIGGER     �   CREATE TRIGGER delete_table_lang_content AFTER DELETE ON public.ayar_prs_birim FOR EACH ROW EXECUTE PROCEDURE public.delete_table_lang_content();
 A   DROP TRIGGER delete_table_lang_content ON public.ayar_prs_birim;
       public       postgres    false    281    511                       2620    47126    sys_grid_col_width_table_notify    TRIGGER     �   CREATE TRIGGER sys_grid_col_width_table_notify AFTER INSERT OR DELETE OR UPDATE ON public.sys_grid_col_width FOR EACH ROW EXECUTE PROCEDURE public.table_notify();
 K   DROP TRIGGER sys_grid_col_width_table_notify ON public.sys_grid_col_width;
       public       postgres    false    541    406            �           2606    47127     alis_teklif_detay_header_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alis_teklif_detay
    ADD CONSTRAINT alis_teklif_detay_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.alis_teklif(id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.alis_teklif_detay DROP CONSTRAINT alis_teklif_detay_header_id_fkey;
       public       postgres    false    184    3295    183            �           2606    47132     ayar_barkod_tezgah_ambar_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ayar_barkod_tezgah
    ADD CONSTRAINT ayar_barkod_tezgah_ambar_id_fkey FOREIGN KEY (ambar_id) REFERENCES public.ambar(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 ]   ALTER TABLE ONLY public.ayar_barkod_tezgah DROP CONSTRAINT ayar_barkod_tezgah_ambar_id_fkey;
       public       postgres    false    195    187    3301            �           2606    47137 1   ayar_efatura_evrak_tipi_cinsi_evrak_cinsi_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ayar_efatura_evrak_tipi_cinsi
    ADD CONSTRAINT ayar_efatura_evrak_tipi_cinsi_evrak_cinsi_id_fkey FOREIGN KEY (evrak_cinsi_id) REFERENCES public.ayar_efatura_evrak_cinsi(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 y   ALTER TABLE ONLY public.ayar_efatura_evrak_tipi_cinsi DROP CONSTRAINT ayar_efatura_evrak_tipi_cinsi_evrak_cinsi_id_fkey;
       public       postgres    false    3361    222    219            �           2606    47142 0   ayar_efatura_evrak_tipi_cinsi_evrak_tipi_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ayar_efatura_evrak_tipi_cinsi
    ADD CONSTRAINT ayar_efatura_evrak_tipi_cinsi_evrak_tipi_id_fkey FOREIGN KEY (evrak_tipi_id) REFERENCES public.ayar_efatura_evrak_tipi(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 x   ALTER TABLE ONLY public.ayar_efatura_evrak_tipi_cinsi DROP CONSTRAINT ayar_efatura_evrak_tipi_cinsi_evrak_tipi_id_fkey;
       public       postgres    false    221    3365    222            �           2606    47147 ,   ayar_efatura_istisna_kodu_fatura_tip_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ayar_efatura_istisna_kodu
    ADD CONSTRAINT ayar_efatura_istisna_kodu_fatura_tip_id_fkey FOREIGN KEY (fatura_tip_id) REFERENCES public.ayar_efatura_fatura_tipi(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 p   ALTER TABLE ONLY public.ayar_efatura_istisna_kodu DROP CONSTRAINT ayar_efatura_istisna_kodu_fatura_tip_id_fkey;
       public       postgres    false    3371    225    235            �           2606    47152 )   ayar_fatura_no_serisi_fatura_seri_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ayar_fatura_no_serisi
    ADD CONSTRAINT ayar_fatura_no_serisi_fatura_seri_id_fkey FOREIGN KEY (fatura_seri_id) REFERENCES public.ayar_irsaliye_fatura_no_serisi(id) ON UPDATE CASCADE ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.ayar_fatura_no_serisi DROP CONSTRAINT ayar_fatura_no_serisi_fatura_seri_id_fkey;
       public       postgres    false    3451    265    251            �           2606    47157 "   ayar_firma_tipi_firma_turu_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ayar_firma_tipi
    ADD CONSTRAINT ayar_firma_tipi_firma_turu_id_fkey FOREIGN KEY (firma_turu_id) REFERENCES public.ayar_firma_turu(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 \   ALTER TABLE ONLY public.ayar_firma_tipi DROP CONSTRAINT ayar_firma_tipi_firma_turu_id_fkey;
       public       postgres    false    3427    255    253            �           2606    47162 -   ayar_irsaliye_no_serisi_irsaliye_seri_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ayar_irsaliye_no_serisi
    ADD CONSTRAINT ayar_irsaliye_no_serisi_irsaliye_seri_id_fkey FOREIGN KEY (irsaliye_seri_id) REFERENCES public.ayar_irsaliye_fatura_no_serisi(id) ON UPDATE CASCADE ON DELETE CASCADE;
 o   ALTER TABLE ONLY public.ayar_irsaliye_no_serisi DROP CONSTRAINT ayar_irsaliye_no_serisi_irsaliye_seri_id_fkey;
       public       postgres    false    265    267    3451            �           2606    47167    ayar_prs_birim_bolum_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ayar_prs_birim
    ADD CONSTRAINT ayar_prs_birim_bolum_id_fkey FOREIGN KEY (bolum_id) REFERENCES public.ayar_prs_bolum(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.ayar_prs_birim DROP CONSTRAINT ayar_prs_birim_bolum_id_fkey;
       public       postgres    false    281    283    3487            �           2606    47507 1   ayar_stk_cins_ozelligi_ayar_stk_cins_aile_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ayar_stk_cins_ozelligi
    ADD CONSTRAINT ayar_stk_cins_ozelligi_ayar_stk_cins_aile_id_fkey FOREIGN KEY (ayar_stk_cins_aile_id) REFERENCES public.ayar_stk_cins_ailesi(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 r   ALTER TABLE ONLY public.ayar_stk_cins_ozelligi DROP CONSTRAINT ayar_stk_cins_ozelligi_ayar_stk_cins_aile_id_fkey;
       public       postgres    false    3777    450    446            �           2606    47384 '   ayar_stk_hareket_ayari_cikis_ayari_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ayar_stk_hareket_ayari
    ADD CONSTRAINT ayar_stk_hareket_ayari_cikis_ayari_fkey FOREIGN KEY (cikis_ayari) REFERENCES public.ayar_modul_tipi(deger) ON UPDATE CASCADE ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.ayar_stk_hareket_ayari DROP CONSTRAINT ayar_stk_hareket_ayari_cikis_ayari_fkey;
       public       postgres    false    442    3457    269            �           2606    47389 '   ayar_stk_hareket_ayari_giris_ayari_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ayar_stk_hareket_ayari
    ADD CONSTRAINT ayar_stk_hareket_ayari_giris_ayari_fkey FOREIGN KEY (giris_ayari) REFERENCES public.ayar_modul_tipi(deger) ON UPDATE CASCADE ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.ayar_stk_hareket_ayari DROP CONSTRAINT ayar_stk_hareket_ayari_giris_ayari_fkey;
       public       postgres    false    442    269    3457            �           2606    47409    ayar_stk_stok_tipi_tip_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ayar_stk_stok_tipi
    ADD CONSTRAINT ayar_stk_stok_tipi_tip_fkey FOREIGN KEY (tip) REFERENCES public.ayar_stk_stok_tipi(tip) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.ayar_stk_stok_tipi DROP CONSTRAINT ayar_stk_stok_tipi_tip_fkey;
       public       postgres    false    3773    444    444            �           2606    47182    banka_subesi_banka_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.banka_subesi
    ADD CONSTRAINT banka_subesi_banka_id_fkey FOREIGN KEY (banka_id) REFERENCES public.banka(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.banka_subesi DROP CONSTRAINT banka_subesi_banka_id_fkey;
       public       postgres    false    324    3563    322            �           2606    47187    barkod_tezgah_ambar_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.barkod_tezgah
    ADD CONSTRAINT barkod_tezgah_ambar_id_fkey FOREIGN KEY (ambar_id) REFERENCES public.ambar(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 S   ALTER TABLE ONLY public.barkod_tezgah DROP CONSTRAINT barkod_tezgah_ambar_id_fkey;
       public       postgres    false    3301    187    330            �           2606    47192    doviz_kuru_para_birimi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.doviz_kuru
    ADD CONSTRAINT doviz_kuru_para_birimi_fkey FOREIGN KEY (para_birimi) REFERENCES public.para_birimi(kod) ON UPDATE CASCADE ON DELETE RESTRICT;
 P   ALTER TABLE ONLY public.doviz_kuru DROP CONSTRAINT doviz_kuru_para_birimi_fkey;
       public       postgres    false    338    3623    354            �           2606    47197    recete_hammadde_header_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recete_hammadde
    ADD CONSTRAINT recete_hammadde_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.recete(id) ON UPDATE RESTRICT ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.recete_hammadde DROP CONSTRAINT recete_hammadde_header_id_fkey;
       public       postgres    false    3649    371    370            �           2606    47202    recete_hammadde_recete_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recete_hammadde
    ADD CONSTRAINT recete_hammadde_recete_id_fkey FOREIGN KEY (recete_id) REFERENCES public.recete(id) ON UPDATE CASCADE ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.recete_hammadde DROP CONSTRAINT recete_hammadde_recete_id_fkey;
       public       postgres    false    371    370    3649            �           2606    47207 !   satis_fatura_detay_header_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.satis_fatura_detay
    ADD CONSTRAINT satis_fatura_detay_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.satis_fatura(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.satis_fatura_detay DROP CONSTRAINT satis_fatura_detay_header_id_fkey;
       public       postgres    false    375    3657    374            �           2606    47212 #   satis_irsaliye_detay_header_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.satis_irsaliye_detay
    ADD CONSTRAINT satis_irsaliye_detay_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.satis_irsaliye(id) ON UPDATE CASCADE ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.satis_irsaliye_detay DROP CONSTRAINT satis_irsaliye_detay_header_id_fkey;
       public       postgres    false    3661    379    378            �           2606    47217 "   satis_siparis_detay_header_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.satis_siparis_detay
    ADD CONSTRAINT satis_siparis_detay_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.satis_siparis(id) ON UPDATE CASCADE ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.satis_siparis_detay DROP CONSTRAINT satis_siparis_detay_header_id_fkey;
       public       postgres    false    3665    382    383            �           2606    47222 !   satis_teklif_detay_header_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.satis_teklif_detay
    ADD CONSTRAINT satis_teklif_detay_header_id_fkey FOREIGN KEY (header_id) REFERENCES public.satis_teklif(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.satis_teklif_detay DROP CONSTRAINT satis_teklif_detay_header_id_fkey;
       public       postgres    false    3669    387    386            �           2606    47227    satis_teklif_fatura_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.satis_teklif
    ADD CONSTRAINT satis_teklif_fatura_id_fkey FOREIGN KEY (fatura_id) REFERENCES public.satis_fatura(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public.satis_teklif DROP CONSTRAINT satis_teklif_fatura_id_fkey;
       public       postgres    false    386    3657    374            �           2606    47232 #   satis_teklif_gonderim_sekli_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.satis_teklif
    ADD CONSTRAINT satis_teklif_gonderim_sekli_id_fkey FOREIGN KEY (gonderim_sekli_id) REFERENCES public.ayar_efatura_gonderim_sekli(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 Z   ALTER TABLE ONLY public.satis_teklif DROP CONSTRAINT satis_teklif_gonderim_sekli_id_fkey;
       public       postgres    false    229    3379    386            �           2606    47237 "   satis_teklif_ihrac_kayit_kodu_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.satis_teklif
    ADD CONSTRAINT satis_teklif_ihrac_kayit_kodu_fkey FOREIGN KEY (ihrac_kayit_kodu) REFERENCES public.ayar_efatura_ihrac_kayitli_fatura_sebebi(kod) ON UPDATE CASCADE ON DELETE RESTRICT;
 Y   ALTER TABLE ONLY public.satis_teklif DROP CONSTRAINT satis_teklif_ihrac_kayit_kodu_fkey;
       public       postgres    false    231    3381    386            �           2606    47242    satis_teklif_irsaliye_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.satis_teklif
    ADD CONSTRAINT satis_teklif_irsaliye_id_fkey FOREIGN KEY (irsaliye_id) REFERENCES public.satis_irsaliye(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.satis_teklif DROP CONSTRAINT satis_teklif_irsaliye_id_fkey;
       public       postgres    false    386    3661    378            �           2606    47247    satis_teklif_islem_tipi_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.satis_teklif
    ADD CONSTRAINT satis_teklif_islem_tipi_id_fkey FOREIGN KEY (islem_tipi_id) REFERENCES public.ayar_efatura_fatura_tipi(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public.satis_teklif DROP CONSTRAINT satis_teklif_islem_tipi_id_fkey;
       public       postgres    false    386    225    3371            �           2606    47252     satis_teklif_odeme_sekli_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.satis_teklif
    ADD CONSTRAINT satis_teklif_odeme_sekli_id_fkey FOREIGN KEY (odeme_sekli_id) REFERENCES public.ayar_efatura_odeme_sekli(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 W   ALTER TABLE ONLY public.satis_teklif DROP CONSTRAINT satis_teklif_odeme_sekli_id_fkey;
       public       postgres    false    237    386    3393            �           2606    47257    satis_teklif_para_birimi_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.satis_teklif
    ADD CONSTRAINT satis_teklif_para_birimi_fkey FOREIGN KEY (para_birimi) REFERENCES public.para_birimi(kod) ON UPDATE CASCADE ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.satis_teklif DROP CONSTRAINT satis_teklif_para_birimi_fkey;
       public       postgres    false    3623    386    354            �           2606    47262    satis_teklif_siparis_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.satis_teklif
    ADD CONSTRAINT satis_teklif_siparis_id_fkey FOREIGN KEY (siparis_id) REFERENCES public.satis_siparis(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 S   ALTER TABLE ONLY public.satis_teklif DROP CONSTRAINT satis_teklif_siparis_id_fkey;
       public       postgres    false    386    382    3665            �           2606    47267 !   satis_teklif_teklif_durum_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.satis_teklif
    ADD CONSTRAINT satis_teklif_teklif_durum_id_fkey FOREIGN KEY (teklif_durum_id) REFERENCES public.ayar_teklif_durum(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.satis_teklif DROP CONSTRAINT satis_teklif_teklif_durum_id_fkey;
       public       postgres    false    386    316    3551            �           2606    47272 !   satis_teklif_teslim_sarti_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.satis_teklif
    ADD CONSTRAINT satis_teklif_teslim_sarti_id_fkey FOREIGN KEY (teslim_sarti_id) REFERENCES public.ayar_efatura_teslim_sarti(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.satis_teklif DROP CONSTRAINT satis_teklif_teslim_sarti_id_fkey;
       public       postgres    false    386    245    3409            �           2606    47287 %   sys_application_settings_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_application_settings
    ADD CONSTRAINT sys_application_settings_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.sys_city(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 h   ALTER TABLE ONLY public.sys_application_settings DROP CONSTRAINT sys_application_settings_city_id_fkey;
       public       postgres    false    394    398    3683            �           2606    47292 (   sys_application_settings_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_application_settings
    ADD CONSTRAINT sys_application_settings_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.sys_country(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 k   ALTER TABLE ONLY public.sys_application_settings DROP CONSTRAINT sys_application_settings_country_id_fkey;
       public       postgres    false    394    400    3689            �           2606    47297 .   sys_application_settings_taxpayer_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_application_settings
    ADD CONSTRAINT sys_application_settings_taxpayer_type_id_fkey FOREIGN KEY (taxpayer_type_id) REFERENCES public.sys_taxpayer_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 q   ALTER TABLE ONLY public.sys_application_settings DROP CONSTRAINT sys_application_settings_taxpayer_type_id_fkey;
       public       postgres    false    394    424    3737            �           2606    47302    sys_lang_gui_content_lang_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_lang_gui_content
    ADD CONSTRAINT sys_lang_gui_content_lang_fkey FOREIGN KEY (lang) REFERENCES public.sys_lang(language) ON UPDATE CASCADE ON DELETE RESTRICT;
 ]   ALTER TABLE ONLY public.sys_lang_gui_content DROP CONSTRAINT sys_lang_gui_content_lang_fkey;
       public       postgres    false    413    410    3709            �           2606    47307 6   sys_permission_source_sys_permission_source_group_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_permission_source
    ADD CONSTRAINT sys_permission_source_sys_permission_source_group_fkey FOREIGN KEY (source_group_id) REFERENCES public.sys_permission_source_group(id) ON UPDATE CASCADE ON DELETE CASCADE;
 v   ALTER TABLE ONLY public.sys_permission_source DROP CONSTRAINT sys_permission_source_sys_permission_source_group_fkey;
       public       postgres    false    418    419    3729            �           2606    47312 &   sys_user_access_right_source_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_access_right
    ADD CONSTRAINT sys_user_access_right_source_code_fkey FOREIGN KEY (source_code) REFERENCES public.sys_permission_source(source_code) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.sys_user_access_right DROP CONSTRAINT sys_user_access_right_source_code_fkey;
       public       postgres    false    427    418    3727            �           2606    47317 "   sys_user_access_right_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_access_right
    ADD CONSTRAINT sys_user_access_right_user_id_fkey FOREIGN KEY (user_name) REFERENCES public.sys_user(user_name) ON UPDATE CASCADE ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.sys_user_access_right DROP CONSTRAINT sys_user_access_right_user_id_fkey;
       public       postgres    false    427    426    3743            �           2606    47322 -   sys_user_mac_address_exception_user_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sys_user_mac_address_exception
    ADD CONSTRAINT sys_user_mac_address_exception_user_name_fkey FOREIGN KEY (user_name) REFERENCES public.sys_user(user_name) ON UPDATE CASCADE ON DELETE CASCADE;
 v   ALTER TABLE ONLY public.sys_user_mac_address_exception DROP CONSTRAINT sys_user_mac_address_exception_user_name_fkey;
       public       postgres    false    430    3743    426            |   I   x�35�4�4�p�s9�����1��1�ّ34*ԏ��3ؑ����Ȇ��8M�8c�8��MLA�?�=... b�      ~      x������ � �            x������ � �      �   (   x�3�tq��,�L�L�2�tst
:����
��qqq ��      �   Z   x�3�r�s�	���u���46��342�tr�t��420��50"NC� W?�#�9/?�1;'17��"��}xZ$W� Ҩs      �   A   x�3�tr>�!D��1�3���[��?8�1ؓ˘�;�����Q!�5��LF�!�N>��1z\\\ ~p7      �      x�3�400s�ttQ�v
����� -i�      �      x�3��vvQ���q��4����� :�      �   !   x�3��u�=<Ǉː�������ŕ+F��� W#�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   I   x��I
�0���c�xo4�&Q!���C�Z�5�׈�<^Y���s��'��^�0�R�yˋ�v >*��      �      x������ � �      �      x������ � �      �      x������ � �      �   �  x�}T�r�0>��bO��� �?�ĩ+�C/�Al��h�[�!�`]���Nۙ�������o���X���-6O��;]=��|I(9���/���9]����2��M}dN��X�m�L��B�йbNx �����UU�0iӫ��>��97��o��*�h��*���P�<���l��J�8�C+�L�z�g�=��y}��y�gA�]�w��o@զ���+��ϰ҅��:bu(7�0���H���6*�Hes����#;q�!��@�J�U�V�Mm��_3�F�JQc��a��Q��ʟ�ju\��
]_���8�@�t���QM��ڴ�&��2w@B Ozg?si*	Y���K����!1WD��L��vhg��Ƥ�!g�����hO�J�44��A� ���l�7Hh��3�,�OM����yR��o����tS&x5UU�� ���9�-��c��i���W�s!�f�/`���A1o�⺱>�'g����k 2j[:2�9k�O��n�)�}H��u`��)�{���.���\��b�:3� a����!���2��1#�a��$k�0��� ��K�����}��,�b�����4]��.H��H)އ�x�H��X�^_�h*���"�^_f\�̥O���C��X����=s����e�k1B>Y���C�z��׋e4�u8' ��a���3[�      �   �  x��Y�RI]���%L���K�ظ�ap�:f)UJ��EdU)�����A�z���f�;��/�sof=$0n/&&��6"��s�u��^�7�뉳�C�/��+�zu�s��XNV��J>ޭ�K��՗ǻHő2�i�`��u��{�R\��]���b�o57J|T�2�J�ki��=�[~ƙM9>�X9˄Ԟ��(�e�Cqaf��oe��7�0EI��O�Wn�D������=�KIh�f:��f�}��U.�#wbu����5 p�&�\4A�a�ͪd���.ԉ�RY���۹��9�k�߇����S��B�ND�3�[{g�;C���,ħ��.��L&�T�˯Q���SC�8$��H�H=�Ū+N�\����,�1�A��!��9��sd���LBI�/�,5�煌a �F��Lg�M�f2�X�j��d�Q������6R7�qY4Q�j�w�Z����BE��ǋ���D���#N��gY���k���}��G��,g�gdx@�jtC뗳{��ۋ��(5R0�9����w*7)g�)��f�Q:Za�K��
s9�0X&�ԍ1:	(=���f�\I�x�4)rk���*�LY ra��ˊ���FH �^�U�-�������6����̂^o`o��7��S��<($��J�7Ѝ��
 $zC+ ANeȕ�kBw��LSˬLq�<���! ��+$l�z09�6 ۼ�K�T�"���!�In�mʈ�B��h��>���V�$t�І繑�@V��^೜�y�s��\�u��H%���Pt��!���bJ�y�S�z#x ��oE�C�\�X\�q����(�n�������8ͥT�Oe�E�s��D��y�N�^������S���?�8W	��Av�~�՗��NJ���77ˇ�E�:
'=ϯm��Q��T��Q���E,Gb���6'�,���7�|Pv���
�H�2q������Ƌf�D��K��{����vϑ�X,#���%���D���:�,�F�e*L�D��)l���P�T�"ʾ�Z���՝a�n  Q�a��L��Μ.�f9(OC
BhT[�)j8���`]#Cד�x�kj �m�(v � P?�%!�q�&9�����[kixG����} m9j�ERF�ÜՎ
��'�$� ,����*�_���4*��^ a��2�����/�CM��1�C�[��g�9��n�3Q	Yz�3]R�4�6�����{��s�A�"��d����g�X~.��]����0a
�@ݥ��c�^%��]�a@ ��*�Vw A��W�9Du-I�h&@8��J��u�YP�0��ܵd�F#�Y,Ѧ�n�AR�`ޥ"g7��m�#�t�s�D<����(]����+:'�</ޫO�������z��!��{��Pri��6�9�@+>�~��Yq}�s�qm*2W�Š,�!*2�ACu�Fȇ��L�82$���Y¿�^}�u�a�=y�|��|�� ��]A�E���w�#�&\Jg�	�Q	B��I0T^�i[��:e�w�'�B]O&-���J[��V" s��&���[��F�+��z3]�g(H�(��CQ�Z=�臮N��Q�(ϭ,�;"�V��T��\�
��e3YF/����1���t��<o�3lw��e��*!���J�U��q�������i�;���|r*K���4��s����BLX�=�k ��^�s��*�#�|�{ ��
	�������Wp��#��3�S	>��K��>���=Ze80�6F�6eu�M��類:��L=�]:�R��ar.�`I���}R9v*���g����S�Nq�\�e\�Z-DS7Y�ER4�f�̠�}XM�g��6��6r�\�M�/�m��C���Gr ���[���lu٘�^b:6e�mw��H��Jf:���c�{9>��esvn�r������W��?��w�{��/k��=$k1�C�ӟ��0�ޯa�61��>.�E��35ae8\��A�1Z��#��#���t|̔�;e._ku�A����h�=@7�^	��О�hv��Y��kz�h������}����v�r@>M�?Z�(��rų��HS�|K"���d�x���*\k?u&cĂ7P!z��Q��85�s�i���
ǾmФ��r�3�XyNа����P�}#�t�}�w3L�i��qݼ��n�1f��$�~�������h��x��V8͜�Τ3#[���08ֳϑ����h�̮C�.ת�VM�5�k箱?�B|�D-3t�Xu�������.�g���U<T[\S,��"=�Ξ0H��|��M�́���3��DƪT?����9�eC�����)���f�E�wc7tb�P�Lq�����C(?��laJ�����z=�Ցx��.�_�k#�q&�qA�;r���K���G��|5�U^��(��{#���� ��ĮmFH�X����z��[Q r�+�F�&�̥� �A[�b�ꄍ8�������臦|V%�G�;B���X��"K�01XJbn@l����b�F�LG�j��`+���@I1s����Vѵ}��*�mY}	�W��:��<�Ӕ,���Ѝ�ؾx����,�E2�_R52|d�֨�����T�eĨ������4Ic���n~{f\o���Q��2��ۤ��m�֨�^�a^�ڄ�Mp %�������У�K�fw�=�sd��x�U�b�������c�� ��z��4�����Ci7H��_kc�_��<_9P�=U��ATLo�~_�Q����s9�/t������2�.�-:C�ol��k�@%���Ce����� ��q\mw�^�2Ѯ���j�><�~t4hr�n�_@������� �.$��O�{��PC0�Ǉ�^�1����"�!�X�<ϯ$xVMWw�Jm��}��b-~ҴNL�=Y� �jϷ������^�KW�u���ˁ��~g�OSޠ/�W�^�m-�/0�LD�zҕ�Γ �/������ 2Q�V_V_Fܷ9�$�F^B��ͺ݊@�����>�Ŏ4v��>�Q�;�p��o5�0K�"�M�n�Ɨ�����4��:Ҳ2���R/����M��A��9�EI����6b����ѯr��HKWgX��>�T˩"`�L&��s5*!NF�C�^rÇ��1���n�b��p2B
J-�~�멘6@�؎�$���S,+�{���S/���$JN\��Y�<(m� e��Y��!σ�~�N��XB��R�s�Th�L��.]��E�O�?d:�;��k2��\��|htPr�RVW�Ό%j��iD_{���P[|��.;�r�r�}�Π[��L4<�չr�ǽ�N��U��y��\�N�W��nY� "�:����ׁ}�S7�8<Q�Ѥ���/a�!B�+ѕ��Sr:IS-�ǲԛ��z7�V;����왦	ߵ������y�#]��H�h\&_�O��^�7xic�:kHF�m���zz�'x��0Y�o�n�&2�I�кH?;���jkk�[?&      �   C   x�3�q���<:���3X��Ȇ _�`O�.#�0�x�k���
�G6�������Q���� �r�      �      x������ � �      �      x������ � �      �   "   x�3��vt
��2�ru�2��ttq����� F��      �   �   x���K
B1E��*����J�@UH��&�!{0��j����B����e���+u�nov���&���nq�։��M_Pg�auX2���P���5j����(�P��C(���^r�'l�>U]�����U��f�      �      x������ � �      �   �  x��V�v�0];_�e$���C��+K��2��i����n���8|�W]u'�zG���&�]�غsug�8��hM�L��~���65�r)f��/|��6oj�$~�'!S~��wipS��k�Ԛl�)��B:�s�K[|�b��-���܉8�\���o��w�np����?Fɧ�%QܿJ�+�BO,s2��H�d{MIp'�t���f�l�)�_%H4�DSN4@�A�I5���~���18�cg��gx����dIPS;ܳ=1#����!���@`�FL`�h-�T��v)1^� F E���a��0�0�8�Z����� 6n.�ɨ%�8�����\ i%�D�6�-0nC?�j��c�c�S	!
.� t���G؜*�s�Ta�q�Ԭ�S���ߒq�oК���`+L�d�չE𦥻�;���%?��W�}f���fO
��b����.�Ϊ\���� V_b�ۖDq��qT.+T���2,5\�5�3�V����^��"s��,�5�od����݈�f�Kz$�c���O�z��r����ъ��gp� ��|��:��g���v1�F�BZ����`UB�����^҆�?�~|+J�&τ"Sa�ĝt+�/�*��,&��l���7��=�fn��x��
�����pĢ�)	���O��K�$�����n0>�h&�b�g&�a�m٪�CU�Bm\k���y`x �Ga�ΜsL�Z�v9�q�zi�X�f��G1�A��0P:��5J�lD�0��a���Ӆ��o+��?�ߎ�ܑn�D�0�Vi�5����3|����	��X�朠p�����-Il��)Ĳ(�4���~��#�h@� ��p*[�W8�X�q[N�yԏ��	 �O�/���J2y���������/7WWW �p	3      �   �  x��UKn�0]ӧ�ZA_�^�-FQHIE	��u��de����{��lXJI
{Ar޼7r�b���(kW[�JG���I��?�EEr8���z�é���^���Vn8��S6N�p�?�j��*Pl��U �)����G�xZ�K(ƾ(�%yWW�l��������vF߸zG�Ȼ�T �ЭmKh} �sx��ܶVZ�Mk2%5��d����1�uȭ����bC�&Y�T*�����);  ��+�R�e(���^U�1S�|*w����t�%X�@씳������H&����?T�x�>כs��)�GB�G��`���$�M '��2cA��J�T���hR^�r,2zDY4��N2NcJB��'o�Y#�4֬����Z�$���ϬK�����H�������ģ�/��(o��x�3"b�J$~�Ȇ�j�Z<�Ay޻2�������o&n�v�]s��#�^|�2ڻ <�{0y̔�i�sz<8��>C﭅���N៌��h��8R�xk(�S6w�
�s�w��ߝ3�J�0uĦ��ˌ��rtӱ��1�5�C�*e0_Ʊ�f��0&�5�V��}����N�P�i[�6�ne຿έ)P73�G�O�x��7�ޠ�G���x���T	s�:�>��I^�M�@��z���0���9�:"�q����_:�_�      �      x������ � �      �   D   x�3�4�tt9��������q�9������u�ʅp�pq���d��p�y�~�~@�=... ���      �       x�3�<:���3�ˈ3�5��1ҕ+F��� Tk�      �      x������ � �      �   ^  x�]Q�n�0<�W �#y5p*U85�U�V�	-`�"������o�#���F����wֶ6�앶�����ej�t6_,�V�������;�e��}��4˘��E�6��*�A��n���H��t�������b5pI HC�`��o�@�:"9���/ʋP8��=��2�epƤ#�y��V�Y9ʄ������5�v��o�Q5ZrY�Q*�B�l�,�Tb��B%���Ґ�0�c������;��qo��F��1�̸Ȥ��(����4�y�ԘI� �X������*����W�ؘ"BAb�F]�9�xL0���w�%N��8�YE��W*�W�S?���� +���      �      x�3�4�4B# 4bN�=... (      �      x�3�t�s�2�tr�2�������� 36      �      x������ � �      �      x������ � �      �   :   x�3�q��9���ˈ3�Ȇ Ǡ#���2�<�!(�(��e��������� �'�      �      x������ � �      �   c   x�3�p=:��?�?�.#Nc��s�|��Vq�V8����3�4�a�2j�13бDҌ�5���aUa��B���*sN�VXp���&���� �pF      �      x������ � �      �   0   x�3�t�ut��2��ut�2�qu>�����.C�d�'W� �!
�      �   c   x�3�tq�s�uU><'�5���#��;�d��{��e�ydCpȑn�\&� I�0� W?�� G7O?G?���ގA�>��\�X̓����� ��,T      �   �   x�=�;�0��S�Hv墬�Pl�D��2g�p�Œ�r�7o�0p���p�m ���Z��y�{���
ω�X9Zl��4�Z<�Hw�y��FhfR�<'(��3��[H���A�WY�ZVlD����!=N*���#�������j�Q�:!�0�      �   q   x�3�
9��p��
��!�G�q���\�LO����.�A@EG6����e��td��;\ė�Ȑ�����ב���/��O��1�����1ȓˈ�7��1��ɕ+F��� ��+)      �   !   x�3��vt���L�2�t�v��,����� D��      z   M   x�3�<�����;ԇˈ�?(��4��9�!ؕ˄��4?��/�˔�2�<<�;��[&b����������� ��I      �   L   x�Ȼ� D�xo14��4���C�	&����'��NV��9'���W��֍���Ż��pV�Em����d      �   =   x�3��=<�����Ȇ`.cΣ�\ݸL@b.��qYr�8zE�qr����:�q��qqq �C       �       x�3��u�rr�2����������� EG      �   !   x�3�tr�v�L�2�t�9����+F��� Mz�      �      x�3��t��2�qu
:���+F��� E��      �   +   x�3�t���9��-�ː��1J��'�S��1��ћ+F��� ���      �   %   x�3�tr�t�R�t�v�,�2��u;�ƍ���� �Y�      �   9   x�3�t�?2/�W��4?g��#��a"��~A���\�@�� � � ��P�=... Q�      �   #   x�3�rV0�2��\&`ڄ�Lr��qqq ���      �   v   x�3��rr�Spr�r���,�2�4T�u���M8�,\��l�Up��:�!�5I�)��%\�����ߑ��~@�9g������y u���
!����Q@�!'P�c��1z\\\ �$�      �   1   x�3�t��u�sv�2�tr����9�l�s?���Ȇ(gW�=... ��%      �   1   x�3�<�!��.�����
�!���9G����e�������� ��+      �   %   x�3�vt:�!�ˈ���ȼ#���v������ ��	p            x������ � �      �      x�3���s
q�����  $\      �   |   x�%��	�0��)<A!#��"�k�ۀ��d����=X\�s��Bm���g.��!j�0d�+��)"+(���(�3�T)B��3_�&J��ZXm4�{����h�W�Ѵ��xD~���9w8z,+      ~      x�3�<�!(���ȆHW$&W� �O
f      |   %   x�3�t?�!�Ȇ��8K��8�{z{�i\1z\\\ ��
�      �      x������ � �      �       x�3���u�sqTp���q������ I7d      �   4   x�3����,�,�2��8�!��5�3�3�q<:�3����O����� $!�      �   )   x�3��u�=<Ǉˈ3�1�S�3��p�utqq����� Љ	�         G   x�3�tr<:��1��ϑ3Ə��ˈ�Ȇ�G�Ѐ3�w:���<��!g��7Pµ��v��rb���� E*<         9   x�3�tw�s���
!��>G6�q�pq8z��@H�`G���ӂ`
�l *����� Gu�            x�3����#.#NCTcNC~� +�
�      	   +   x�3�twr�9�A�����1ؓ3$�����ݐ��+F��� ��         "   x�3�4�41626��v��srv�4����� Al�            x������ � �            x������ � �            x������ � �            x������ � �         #   x�3��u"GNCN�B.#NWwW:����� u��         #   x�3�
9��p��\F`����y�\1z\\\ ��
E         1   x�31�420��50"��`NS= �21A�p�4�32J��qqq �	�         '   x�3�t��t��q�2�v���9���A�=... ���            x������ � �         %  x����n�H���S�d�7yL��02����K'�LI�AQ��7��`�%��eO�I~���&�")��vU������7����:W+e����>sܘ'��b���UnoKg�Ћ	���R�35W��7�g}H�l�6*�����g�.R��"+x����**�u��n�|��w��}���ڷy��8�M�Z��E���ы�����u:���U��߫�_��^R��r�/�rw�U|T\6�X�5�Z��� ��ѷi>[���fQy��B���\o�>����l�f��ݎ��sU���n�񎿌� �;�����6�
(ꓚ�C*��[�J��l����>P�>!�V9/X������~���J�zV �BٯUvm�������ҫ�uV.%t��f��k�H�:v�O
��^B�H���������F� ������ۻ���du�8��m�?�oJ" �;MĀ��{�v7���[�ݎZ5��ǴX-�t>h�H�:DT��MV�����kBy
�@yf\;��e@�#r�q@�v�g�[5���9����:��ťTK���-� Lx��S`�j�,�7	}��\�[ �����\@����|�]�f
�����! D�<V����J��w��7JU��].
q<�t*4�(�ޫ{�[��N�*-
�Ģ��O��~���_d��}65�cH�cǪjT����ֳ���?�Xg�"��;�~�+D?q@.�fℼ�X��ա6�A���h^���l�׬n����iqPI����Iܓ�)�� �v�ȺP�h�]V�8���J�a��*:���rQu�jyb�$Z�'5�-�g�C�9�y>ڞ�����s"�W�sa�����~SG%��:*)��QI`�5v?�Qc0:���`�����u�X��z�c,"<���c�[�~��^sEV�PE�ϟ�we7��$.3�Ti4~T��� =�e:��% ��<$�r�D``��u�I�e�J�a]��VCt����[H�B]gR�/����鎮��*K����g����u�r��F�A��ܗ4�� 6�z�{�,O��w�gu݈�\ƹ̯�mi<@F����Ȣ�pA��{:����e��d���],�2[-�&߄Ýt�����Z�T��9/���k�$��X�XwB\��o���dJ��A%���֏	�|]��k\��4ůU��l�Lδ<�d0e�W��U���f@��ˤޟcZ�W	pu����o��H89������p4F�f������2C��6y���$�Q���^�Sgê�?f��܈�h���8E��S5$�Ϫd���X��y7qmM�=̦d�l�u	?-��V>��FA/�$Wh�K�yU��oDJ����^RP8Zi.�%� �;�o�"�$�T#�+�&�r�s�C&,\śL���9�632̛��X}�$k�.D4�н\ۯ����^��(S��l�m�:9�4�}�Dǣ���z-��
7h�#su%��^�Vٞ]H�ap��&��VWZ�z��ZsH�G+��t���Hk:���CCz�.��m��h�}6B�j�����'�ʛtG�a�cˣ�.�q�DZ�G�U�<Z�G5,05!Q��ﰎ�`!H��\R�U���z��p@vӞ�a�}{�ܠ�}[Dx�����7��O�������x7��p��BN<b��c3󘚑j8���a.^e�I��ge�I�~e�I��%��'1FU��9W|cdfe�I�%b艌�=~��Q��t�*z�c�],WF��ۻ/��lV]0�9����L�*�.m�ʸyn���C�iŞO��k/�R�d�n��ֹLئY�==H]��C��Z4��+��}��oQ$^�dvMӼC�B���1�c�c�Ac���t��3M���j�8�eZ���<��-�&q���#?�vt�$��]}#SYO�del�L)2�&]�+f�2.�`{Cđ�yǷi1K����?�S����[����5�k9�u���V��*���?U����)
-��A��o!d0~�/2�;�h�t���}~�$D �?��.
G	Q�Y� !�}�Q�x!�A�TB�C�(�c�(&�����J����C���"<ԑ�/���6�n|�Z@:�6q���M	X���(n����s�?z�v0����Ɂ�'�=[�0ү�����'d9��I}��sY]�4�|-�C��<t�u*9�xZ_��>��H+Ok�&A�p��O�M��Xd�� �pP���TD�Ji]L��v"D�X�n_�y6�.����r�WJg��1н�=U3A�o�)!$g]�9Ě���K���ز�X�_S�zQ���9�E��B��	&�(�ݍʷw+SH� Q{�*1�!?���L��9�I��Vs�r��ܿ��{��9D=i���oOq�2�Ms�2bZ �BR�r]����kfW]߸;�pHbV"g�$�A=!��t��#1B��'�",%��#>2����W�� �� ��-��!Z��]�@�7]=�Mk�N+���;$#��o�kF�`����j3:������tIk(
??�kI
Tt���*�ȥP�!M��Eʇ�KI�25��fƄNK)��{��A�{��ǳq=@����h��u�\d��2��ﳞ�Wk�l}ݝ4Z����(5q;,C�Pf��l��-�Џ,=��A�FH�x��2W���W�y	�={��~����ޠ@Z�ka�	̨��#(a �n�@J�`4$C���A�A0	z�x9x���<:hH�~�*2@��J� �g��Rz(\}�� �8H�S�p�dj簈����[3��Qo�����!a����`��l��ps�f��6���U�x��#���v�k�CG�{�<��x7�!���98�~"�������IVn[�d��]+b�jz�v�Y�ҏ��U�T�p�gH�jNg'4|+b��eE:�9��
ԇ淠���� ]���{Ct�㺯��*�C�V�P󎫽�f%S��[�kl���"�[���)r�c��[��E�;����S��7bV4��ހ����H�⤃7������;|�	�9cB㮓�d﫽�ޕۯ.� �7�&1��0G����<WW�����ߗcLş��fFZ�}gLh<@�0SW����u���Q0��s�ƨ�1���x�F/|1�A;��i5�#|e������n�	�a�ԉ&�,TK�(�3*5�!�s�6��:$y���[����-��!�Q?�s(�Ą	%��`j�Z�$�~i�j8�;}v,�M���b�����	ſ^�ʹ��}]�G�yC{����0]����O�/Ƌe^YyL�K���*���+�0@av(�����[{v&���z�,�B?��ٳg�#�      !      x������ � �      #   I   x�3�4���t9<���O!�1�����1$V�e�ih by8Fy)������
�4J���c�#D,F��� r��      %   5   x�3�t
P0�4400 �0&��2�8��"��Op�@`L�L�'�b���� Z?g      '   .   x�3�ttq����0ҸL9�݁ȗ���� G_��=... �~
b      )   B   x�3�v�T�t��q�L�2�t�|ԴD�L8C|��]�!��y+����	������ !
�      +   V   x�3�<�!8��7G.#NW?W_W���s�\��lP���2�8:/�5��O!�1�������O$Q`�y������<G
b���� ��$)      -      x������ � �      /      x������ � �      1   �   x�%MK
�@[gNѽX޼y���jEd
���2H�Ђ����s�$$B"�M�P6��A�p@
�����_����<B�Y�%�}t�7�׺ �¹�7""�	7?�!��e��a+�>��?�%��e52�X6U���AR�)��a��J�/8h%�      3      x������ � �      5   K   x�3�4�p�s9��[������X����T���T����Ԭ�ˈӈ�5��/��Ǔ3Ə˘Ә3$4��ĉ���� 5�I      7   ,   x�3�LK-�H,���I�,��5��0sH�M���K������� �Y      9      x������ � �      :      x������ � �      =      x������ � �      >      x������ � �      A      x������ � �      B      x������ � �      E      x������ � �      F      x������ � �      I      x������ � �      J      x������ � �      M      x���ۑ,����RP��+%���_��g��8U�fl'/�LGG����Z��~���������������{������1����߿�߱�u�?�{�k�-B�z���O���1��?�O�o��~�ם����?���)�����>���H���������|�S���9�9?��pV`�\r������k~.�pk�a��%b�\�oF���r���,Z!�J����+}�����J#���+}�^?�\�e5��=r�ϓ�	��+�����G��y�Wg�<�����y��ʕ>_����W������^��g��\?�\��7f�^����o����J���0��ɕ�N����O����s�>�������ɕ^�,`�ߔ+}���Y?S�������\�k�i�L������M����W���\���w_����o=~����^7����'W���E�~Ɵ\��kh�_�|r��n����~��w�!W��_��g��~���!���痸�N��7�Z�C��s�K�!o٬�~'������	�*���]h��Mh��[��6��7���6�=�w#ސlH[�E@k�mJ{o`�gؘ�޾�֚ۜ�����g��z�Zkn��{�6�~��j�M�\.��}yg��Ն���
��ܦ��ތ�ϰqm��5�y���n�z�Zkn�w�~��l�h���l�MJ (�ж2�Zs�ھ�`�~��m+V �iL��7�"��VZkn��ė�3lt[�h���n�$�zlx[yh��Mo�&$��a�ۊH@k�m~�/��he�JU@k�m����ϰ� Ňp���ot~�ヸ�C�d���F��w�\�Ms�
\�m�w��u6�\�m�[��׿l@����������&�����g�������g��/[�����j����_�����S,�]�]���1]����1�:�o����G�3֢���.���@�.��!��0����m%�O#��X�ݤ�,p��醓���e�n9G���@6Dק��6G�c��&:O�����2¦�q��i���S�2�f�q��1�:Pk��/����&�q���O�HZ�2���q��XH'j#6�
\Fؔ=�Q'�#���i��e����<�c���� �cX#�����㶡�>�����{�o�]�a�7�z�!�F��q�>2� ^��\F�>����u�Χ��6����5� ���y�����u�����c�X��\F�T>�����G���ڀ�6��kv���C�s�����A]
x���5�_��5�Ҵ�cA�z�W8�����)u@�Wq���}P��,�A�Z� �^�:u��~�sA��ԧ��S'K���:YR��7k��^
�9����5кN�,�V\F�dI�Z�2B'K��
\F�dI�Z�2B'Kz��:YR����ɒ���:YR����ɒε�e�N�Ԯ�5�7���U�x�V{���A�Z�2B'˷�8�S'Kb@���,)b���N�,�b\F�dI[�2B'KG���,)e\F�dI/[�2B'K���:Ym
�ykm�|�o���v�u�dIM��S'KBT���,)k\F�dI_[�2B'˪l��N�,����:u�������ɲ�۷�S'˴�\�M����^����ۮ}/�,��-�}vV��G]�M�G��g]�M��m�ׂ�,����M��c�ς��,j����YԎ~�F���Y�e��A����&K
�ٖg��v,��<���
d�5�ڱ�e�M�T�.#l�<�\F�dY}r���,��"z]�ޝI�X�2B�Фv<����.M��Qץwj�Vͣ�K�֤v,p�wlR;�/k��>/k�c���FP;�����v,pa�e��.#l�<��u�dI���2�&˃ڱ�e�M����^k�c���,����e�M��c���,���h�8�����Ak�c���,jǫ�Ӹl���2
\F�dyP;���ɒ/@\F�dyP;��nk��
\F�dyP;���ɒ�Z\F�dyP;���ɒ�u�7�q��b���Z#�/��Wj���_�ǂ��V-�\����WH�u���������~>�F����wAֈ;_V�oT'ˇ��u�:Y>����u�䝢�e�N���_�=��F<|Yu�u�d�ܿ�:Y�T�2B'���/��u�d���\F�d��_���,y�+p���;���u�:Y����:Y���e�N���������Kŗ��ֈ��/�n�L��k������\F�d����u�:Y~,�������'׭�%١�e�N���_��������˳�['���5���ɒ�R�2B'����d�u�d����[׭��7�5�<T�2B'�9���u�:Y���2B'�y�\F�dI�*p����k�u�:YN�о�u����e�N�d��:Y�|����&K��n�GP�s����zl���yz�>O�w�<d�)������&����5x-�>[�����M����k�Y�}�p�#5�.�>g�7~�Fv���d�������d�V�y��1�_�<�d�Xb�T�5���\F�dɦ��6Y�<^�2�&Kv*4������Ł�ɒ�.#l�<�Q�"��,���2�&��8�ر5�`��Y�c��yܿyj�qp:�]�c��y��y���$mpa��y�_����9�����O��(9 ��'�y���e�
��5���O�ף�g]�~�G�\F�'�y���e�~*�G�\F�'�y̼@h�F����ɒ/.#l�<�Q;e��,�%��2�&��:.#l�dkM���,���5�ֈ���e�M����\F�d�&��6Y���5���ɒ���5����7ϺZ#�*Y ��Z#�*Y� kĺ7x.H�Xq��d�`�d����ɒ��>�F�U��wAֈ��Aq�:Y�U��� k[%��?��d�V��:Y�U�@���F�U�@���F�U��e�N�l�,p��%[%\F�d�V��:Y�U��e�N�l�,p��%[%y^'K�J���ɒ��.#t�d�d���,�*Y ��[#�*Y ����m�_�<Vo�`�d���,�����d�V��:Y�U��u�N�l�,p��%[%\F�d�V��:Y�U��e�N�l�,p��%[%\F�3�8����ɒ��r܂5��Jκ^�,�*	��W'K�J���ɒ��.#t�d�d���,k��U׫�em���zu����O]�N��U����2[%�^�,�&� �i��j�d��l��j����򪭒G]�M�Wm�<��l���*Y� {J[%��M�[%|dO�b�d���Yl�,�[�5�����3�Fm4��l�d�i��f�`�d���b�`�d���b�`�d���,����2�&ˋ��.#l�dl���,�ћg�>�,�8��2�&˫δ�]��M��mpa���V�9@��V��6Y^l�,�x�l�,�Cx�l�,��{�l�,pa���V��6Y����e�M�[%���dɶ��6Y^l�,pa�%{��XEk[%\F�d���6Y^l�,pa�%���p&k��۩�>}�&[%\F�5�*y�>�O���V����M�J���l������'m�Q�W]�>m���.#�l�,p�O�d�d��}�&[%\F�d��rh�5���k�d�~A6�y_ֈ��5x,�����g�޿�Y#n6��uM�,���� k���������칦N�;�:Y>�v�sM�,6؏��N���k��ܬ�Ϻ�N���kp�����w]S'���5����r��5������:Y�,�k�d��z<�k�d��2\F�d����:Y����:Y���A���F�<rq�5u�|�_�h�xy��k�d��#\S'ˏ��uM�,�Q�ipM�,?�uM�,����2B'ˏG.κ�N���kp���J).#t���_���,?��~�:Y~�� GGZ#&;�:Y�Q�pM�,W�jp���<.#t�\ɫ�e�N���5����r��]���r���:YN�y��L�~�k�s�Y�Y��g���zr��A���<�3�Z�=����5�����?��9�Z�=����    5�������$��3���_��l��}_�PMr��>��o���lK1y$�I����f��XL2y���:�ߺ1�_�up�uc��5YG�Z7��k7l�乩&q�&�{��&q�FM�j7lּG?�ŵ(���
Ϻe�8F=�U�x�ٸ��]M�͛�q����֍���κe�`^O�u��u����u�?�9o&�Y'[7�S$n��y3çHܰ��ך��;�s�#o\��O�wk7l����$n���crM����y���>y��Iܰ��>�_��a�'�5Y�%[7�~��kQ֍��u-ʺq�z
�����G ���A���5�6���`��aS�}ݿ&k��uc�Zj7l����$n� �s�M�M��5M↎�<^d�m���pȻNӶn�Dx�u�u�G�<m�E׽I��s��_�����h��~���ə�:��\x������}�5�HgQ�/�c�u���'ϋ�D<(�$n�,���E�Y���/�Ni�n�xx����(χ�:��x����(O��:��x����(ψ�:��8$'c��E<;�$n�,�c�E�΢<'^$n�,ʃ�E�I���/����s��_�u��u�gŋ��E�~4�k��F<�$n�,���_�*�3�x��I��Y�Ƌ��Eyb�H��Y�GƋ��Eyf�H��Y��Ƌ��Eyj���`���"kău���u=���qHN�Գ�xºI��Y�Gǋ��Eyv�H��Y���z6�]O��u=��ǟ~\�H���񷮡�$�y��k�YI<=�d�����<{��%=���k�IO=D~�5�Ĥ��"?�zd��c�E2��fQqo�a6�><H^$�<l���&�a��ã�E2�C���Y�"��gc�z�k�?<��d�ȴn�8y�5�ź���E�|���z^&O��zf&���zn&ϔ�zv��c����M�͢��9�@��h�&q�fчˋ����,/7l}x��Țd����"k�u��ˋ��A��./7l}x��HܰY�c���E0��B6�rZC��a���#�E�͢��d�صn�y��a�(gC4�6�><f^$n�,ʑMֈ(��هQp=��(���E5�r���M�͢��6�r�E��a�����E�f�ϛ�6�><p^$n�,�)M�͢���:�ެ�k��@�=�X��Gq�G�5{̺q��&�!���7�1�E���$S�t�9��k��@����d��΢7'��u=!�����Gq^I���Y���ON;�C�8�I��Y���E�|9��׋��t�f��~v;s�ﺆ��� ����GqK����(3ً��E�^$n�,��:��k�qA���$n�,���&qCg��V�$n�,�޿&k��u��T����g=��k�Z7^εy�zj����6\C��T�&qCg�o�y8u&��a8M�΢��k7t�8��k��A�w����EW�i7t��_�����
AM�pJ��7M�XK��d�g]COz�#���!��@M�΢��5�:����$n�,:�_������죻���=��5�:�NN?z�z��3��#��G	q�Q�5�T����:5�NN�Ä82�ɚz*�x��_�L/�Y����d|�͢���k���6�r@S�0�Y��{M2��fQ�uj��6����$3Lm�8�&bj��;F$�5�X!N�j7l}��k�&�Z7�[�5׺1�_��a�(gV5�6����5�6�r�U��a��;��,���qBV��a��{�:[�����8X�IܰY�=�_��a�(�q5�6����k��[7�zM��c��������֍%l��a��{�_��a�(��5�6����Ƹ�5�YcM�͢�y����E9��IܰY�=�_��a�('�5�6����k7l�@�&k,�u��Ը�9�9jM�͢�5��:�M���&q�f��:M�͢���$n�,�^��IܰY��ޚ��E���5�6�rF\��a��{�_����(gqYCӭ�	�Sӭ��Yd�[�npg��M�Ytݛdp�΢�Y$��u�D�"���(Gr��t�E9��H���,z��{oMO�Y�S9�d|�΢���>=��C����E9��H��Y��9���E9��H��Y��9���E9��H��Y��9���E9��H��Y��9���E9��^T�$���&qCgQ��,7t��"qCgQ�,7t��"qCgQ��,7t��"qCgѷ�e�z4g26�:�rT��p"�rl7t��"qCgQN�,7t��"qCgQ��,7t���"qCgQN�,7t���"qCg�:�s�5����C;!�E��"N�l7t���"qCgQ��,7t��;���U��ɝw]C�*z��ΧO��Ê�:��k�iEo��z\'w6�6�~u|g�����:�s�5�Ģ��<�zd�W'x�u=����"/(�ǋ6���S�>�,�np*i�/�t���"?(��x9���	I/�Gqj��a���Q�E�͢��$n�,�q�g��a�('�6�6�~�Y$n�,�A�M�͢��#^��a���M�͢Gz9V1�X�&q�fяC=���E9M�IܰY��X�"q�fQ�m7l�8سHܰY��k���E?��,7l���&q�fя�=!�E�8#N�m7l�8޳HܰY�v���E?�,7l�\�&q�fя#>���E9ηIܰY�;� `���q
p��a���1�W�փ�8<�IܰY���"q�fQ�n7l�8�HܰY������E?�,7l��&q�fя�>���EoVx�5��u�2��#�8O��eݸ�_��ucݛ<����k�nܜ}�5����~M>P֍�Ӣߺ��t��}\4�У�8+��	e�xF�2]'M�aG1�$n�,���&qCgч3�Ϻ��w�=��I��Yt�e5�:�>�I��Yt��5�:�>��$n�,��³���}糖���{ĩ�M�΢��k7t]o�M�΢��k7t}9Q��k��G������E_��z������\C�?�D�&qCg�o�Y�u���A�M�΢��k7t�8Y��k�H�w����EW�i7t��_�����
AM�΢��5�:�NVx�5�$�o�:��k�QH���$n�,:�_�����iM�΢��5�:�NΝ��z�7�_�����������'"}����z$��7�6�οQ'�ש�z(��79�����5y@I78��J�1��_��t���\n��H���5�@I78S��J�1���ʺ1X�Y��ӑ�u�?���8��IܰYt���$n�,���M�͢sܿ&q�fQ�4�6�������E3�$n�,:G(�zL�	���E�1j�A�6Ѓ�j�$n�,:���$n�,�,�&q�f�yܿ&q�fQF(4�6����5�6�2y�IܰYt��$n�,���&q�f�y���5��$�<4�6����5�6�2�IܰYt���IܰY��M�͢�|M�͢�h7l�g���zt3,���E�5j�EM��Ó}�$n�,:���$n�,�Č&q�f�yݿ&q�fQm4�6����5�6�2��IܰYt^��$n�,��"qCgQ!Aҋ�1JLir@Y7�T�e�X�&O(�Ð����LC*r��g)M�!�@Y7��T�eݸ{�	��㔘t�䄲n0�ɜ=P�)M�΢E*7te*R����(c����E��T$n�,�`�"qCgQ&#�:�2�H��Y��HE�΢G��գ���$n�,�x�"qCgQ�#�:�2 �H��Y�	IE�΢�H*7teFR������#q����<�&qCgQ�$}����,1F�I��Y�AIE�΢LJ*7teTR����(�����E�T$n�,ʴ�"qCgQ�%�:�ּ�Y��Ӗ&� �E��%&5�:�22�H��Y��IE�΢54�k�K��&�u=si�ؤ�� �K��&�u=uifp��c�jjR��a���F&.q;�쥚���(Y/?�> �%=�)�	(EY/��� �+5�i�7�������M?�V�3�B��VJ�^>��x����*5=����&+͟���Գ�Bc�����oӘc3k͵�4��غ^~�    6�96��L�Иc��z���4���Z�6�96®�gW����zWẖAv�#���znS���4��8�^~�6�96���ИcC�z���4��\[��6�96ڮ���Mc�M�={,4�؀�^>���qkn٦1����_h�F�N=�,4�ذ�^~�6�96�ּ�Mc������oӘcSo�Z�96�����Mc�;5�mӘc��zy����7=��g����82!�ۡg>�|�Mc������oӘc�pϖ�96��߿Mc���5�nӘcc�z���4��d�3�Bc�����i�������};�8��_h~�P=K/� ��л�> �9T��O@m�]��z:T��������kn�ӷCψ���~�9w��A=)�g���ڜ�ff���E���Mc�O�OM<�v�Q=�04���L7s|B���9>!�І���y'�9>!�ӆ����Z�ٷC��Z k_4��z�T�h�9>!�ن����mCc�O�oM���v��R=24�����<ʧo��/Us%7�9>!��J٣)����Is|B�j6e�Zz�Tͳ�4����Մʣo��8ճ0Cc�O����1�'d��И�2�nh��	�s|B���9>!�Z�ٷC��Z k_4�OO��ٟ�1�'d��И�2�oh��	yքӫo��J�3GCc�Oȳ�>};�l��W�i��	yf�i�<��z�ih��	y��LJ�v�9U5'u�К3��ߦ@kNe��'�5g��� �9��M/s�ت�����КS�=�h����?@mΨ��};���_h�\���)stB���1G'd>hlstB��mstB�O(�1G'�1�ߦ1G'd>�lstB#St{���n�3tCc�N�������3�j��1G'�q��Mc�N��),4��<h�Cc�N�||�4��<h�Cc�N���/4��<h�Cc�N�|`�4��<h���o���ճ�Cc�Nȃ84���G�Mc�N�������mh��	y��oӘ�2�7�9:!�3ә{D���ճ�Cc�N��������j��1G'�q��Mc�N���=4��<h�Cc�N�|��4��<h�Cc�N������-ph��	����};����/4�����QE��͡} jsh�C��ڜ�&}_};�$�Q�H�e����o��~�v�yZ�:e�/�6����z�V��=�9O����ۡgkռ�Mc�O�OM ?�v�	[=k<4���Ls|B��9>!�����y'�9>!������Z�ٷC��Z k_4��z�V�V�9>!�����i�Cc�O�oM���v�)\=�=4�������o���U��7�9>!��&�#��D��%s|B�j��_�=����os|B�j��ѷCO����1�'dZ�И�2-ph��	�84���L�9>!�����g���ۡGv-��/����v��ECc�Oȴ��1�'dZ�И�2-ph��	��s|B��9>!�����i�Cc�N�������Zࢹz�נ4�� �����@kN�͡O@k�A���PSoz��G|��3M��КS�v�Кs��� �9��~������͟���5�Q�9:!���1G'd��Mc�N�-ph��	�:�И��AstB���4��|������[�И��A�4��6��aӘ��AstB��)Bc�N�-ph��	�/86�9:!���1G'��f$4��|������JeӘ��A�4����Q�ń���Z�И�2_�lstB>h�Cc�N���Oh��	���9:!�Ѧ1G'�84��\�7����Z���,��U����Z�И�r}�stB>h�Cc�N�|5�i��	���9:!�wj�1G'�84���|��Ͼz��Y���]�'���/� ����> �9���O@m-p�P������=xl���o�����~�9���?@m�Sk?�v�!dd틦C�s�_qns|B��9>!�s|B��9>!�����i�Cc�Oȼ�����i�Cc�O�o���ۡG�-��/�wq=�l����1�'dZ�И�2-ph��	�84���LZ�9>!�����i�Cc�Oȴ��1�'��~������M��g���4���Ls|B&����i�Cc�Oȴ��1�'dZ�И�2,4���Ls|B����o�o�@־h�p6j�@h��	�84���Ls|B��9>!�3Cc�Oȴ��1�'dZ�И�2-ph��	�vG����OZࢹz��`[Ŧ�5�} Zsj?F�Кs��� �9l���2G�C[/�~ �9�$�h�9i�C�ڜQk?�v��hd���EOG��$4��|�����٬�i��	���9:!�.�И��IstBf{̦1G'�84��\�jBc�N�'-p�t�zv�`CΦ1G'�84��\;yBc�N�'-ph��	�-@����OZ�И�r�
�9:!����1G'd6mstB>i���o���6j�Rh��	���9:!��iӘ��IstB��Q�1G'�84���ƪMc�N�'-ph��	�vd����OZ���ܵ�V�Mc�N�'-ph��	�������OZ�И�2��6�9:!����1G'��ustB>i�Cc�O�w���ۡG�-��/���z*ۨ}n��6�8��͡}jsh�C_��~�^��!m��}��6�8��͡�js�Z�ٷCl[ k_4���6��i��	�84�����Zh��	�84���Ls|B��9>!�Ns|B��9>!����o��@־h���D�Q;$Cc�Oȴ��1�'dZ�И�2-ph��	��s|B��9>!�����i�Cc�O�_���ۡ��-��/�Y�{l�4���Ls|B&����i�Cc�Oȴ��1�'dZ�И�2,4���Ls|B����o��@־h�7jomh��	�84���Ls|B��9>!�3Cc�Oȴ��1�'dZ�И�2-ph��	������/ZࢹzV�`���5�} Zsj�r�Кs��� �9lu��2G��[/�~ �9�G:�h͹h�C�ڜQk?�v�1rd���EO��+;4��|������νi��	���9:!�>�И��EstBf��1G'�84��\;�Cc�N�-p�t�z��`���1G'�84��\{�Cc�N�-ph��	�M����/Z�И�r���9:!_���1G'd��ostB�h���o��B7j?h��	���9:!� ��1G'�84��\O����/Z�И�2�lstB�h�Cc�N���Bh��	��n�YϨ<�i��	���9:!�S�1G'�84��������/Z�И�r=�stB�h�Cc�O�w���ۡ��-��/���z�ݨ'AB@m-p�P�C������ �9��������Y��@m-p�P�C���<���o�n�@־h:d=�n�̦1�'dZ�И�2�k�1�'dZ�И�2-ph��	�84����;ih��	�84������Ͼz��Y��y���F=Cs|B��9>!�����i�Cc�OȤ�И�2-ph��	�84���Ls|B�j�g�=o��}�t�z6���Mc�Oȴ��1�'dQh��	�84���Ls|B��9>!��Bc�Oȴ��1�'�Yk?�v�yd�&���y��>�9>!�����i�Cc�Oȴ��1�'drfh��	�84���Ls|B��9:!�v�1G'��hn���ǣy��֜�8�hͩg�B��֜�8�h��a�M��	��� Zs�)��/�5��jsF�����9��M��	��[�9:!ߴ��1G'dx�4��|������I�И��MstB��Mc�N�7-ph��	����9:!ߴ�M��2unstB�i�Cc�N��4hh��	���9:!��1G'�84��\ϟ����oZ�И�2�nstB�i��>1G'�z�54��|�����yTvӘ��MstB�glCc�N�7-ph��	��s7�9:!ߴ��1G'�z�74��|�7}a�N�<�i��	���9:!�sġ1G'�84���    ț���oZ�И�r=�stB�i�Cc�O�w�����g�ݴ�M���g�ճҡ�6�8��͡}jsh�C_��~�^���z7-p�P�C������ �9O�����g�ݴ�M?��2-ph��	�84�����Zh��	�84���Ls|B��9>!�Ns|B��9>!����o���w�7�b�Oȼw����i�Cc�Oȴ��1�'dZ�И�2i!4���Ls|B��9>!������Z�ٷ��Իi���0�'dZ�И�2-ph��	�Ds|B��9>!�����i�Cc�O�d�И�2-ph��	y��Ͼ�~��M�����I}�1�'dZ�И�2-ph��	�84���L��9>!�����i�Cc�Oȴ��1G'�:�"4�������3�8�b�К���> �9u�E�К���� �9���e������~ �9u�F�К���� �9��~���3�Z���L�:�#4��������9dӘ��CstB��DBc�N�-ph��	�CH6�9:!?���1G'�:�$4����7M��g�q�ɦ1G'�84��\祄���Z�И�2�lstB~h�Cc�N�uBKh��	���9:!s�˦1G'��i:d?S�΄	�9:!?���1G'd��4����������И��CstB���Mc�N�-ph��	�ν	�9:!?��M�!��z��i��	���9:!�I;�1G'�84���=����Z�И�r��stB~h�Cc�O�w�����g�=��M�!��zu�P��͡} jsh�C���Z���6�����9~��C�����~�9���?@m�Sk?�v��z-p�t�~�G-ms|B��9>!�s|B��9>!�����i�Cc�Oȼ�����i�Cc�O�o�����g�=��M�!��zuUh��	�84���Ls|B��9>!�Bc�Oȴ��1�'dZ�И�2-ph��	����};�L���i:d?S�C�6�9>!�����ID�1�'dZ�И�2-ph��	�84���L�9>!�����g�����g�=��M�!��zu�Yh��	�84���Ls|B��9>!�3Cc�Oȴ��1�'dZ�И�2-ph��	�Ni�9:!���Es;�L=�w�� �漴��@kN���漴��/@k�mz��g꽴��@kN�D��漴��?@mΨ��};�L���i:d?S�ξ�9:!����1G'd��4��������봽И��KstB显Mc�N�/-ph��	����9:!���M�!��z�i��	���9:!׉��1G'�84���Q�����_Z�И�r�astB~i�Cc�N�~�i��	��n���ԫSCc�N�/-ph��	��7�9:!����1G'�:�14��������9�qӘ��KstB��!Cc�N�/-p�t�~�GJnstB~i�Cc�N�ueh��	���9:!s��1G'�84��\�_����_Z�И��]k?�v��z/-p�t�~�^��z jsh�C��Z��'�6�8����w~�e������~ �9���_@m-p�P����Ͼ�~��K�4����a�����i�Cc�Oȼ�����i�Cc�Oȴ��1�'dZ�И�2嵐1�'dZ�И��[k?�v��z/-p�t�~�^��s|B��9>!�����i�Cc�OȤ�И�2-ph��	�84���Ls|B�j�g�N?S�n������Mc�Oȴ��1�'dQh��	�84���Ls|B��9>!��Bc�Oȴ��1�'�Yk?�v��z/-p�t�~�^��s|B��9>!�����i�Cc�O���И�2-ph��	�84���LstB�s�Cc�N�-p��N?S��7= �9-p�КS''�>�9-p�КÑ˛^���z-p�КSg5�~�9-p�P�3j�g�N?S�n���ԫӡCc�N�-ph��	�c�7�9:!���1G'�:�:4��������9�zӘ��GstB��Cc�N�-p�t�~�GgostB�h�Cc�N�u�vh��	���9:!sX��1G'�84��\�|����?Z�И�2ǃostB�h���C�3��\�И��GstB�@�Mc�N�-ph��	�N2�9:!���1G'd�@�4�����������И��G�4���ǡ����?Z�И�r��stB�h�Cc�N��i��	���9:!���1G'�84���|��Ͼ�~��G�4���W'҇��Z���6�8�	�͡}js��z��g�}���@m-p�P�C���<���o�����7M��g�q\��1�'dZ�И�2�k�1�'dZ�И�2-ph��	�84����;ih��	�84������Ͼ�~��G�4���W�Bc�Oȴ��1�'dZ�И�2-ph��	��s|B��9>!�����i�Cc�O�_�����g�}��M�!��zz�4���Ls|B&����i�Cc�Oȴ��1�'dZ�И�2,4���Ls|B����o�����7M��g���И�2-ph��	�84���Ls|B&g����i�Cc�Oȴ��1�'dZ�И�rM��9:!OZࢹ�~�#B6= �9�8�hͩ�"�O@kΤ}ZsJ��e���7i�C?�֜�f���LZ���6g��Ͼ�~�ޤn���ԫ�)�1G'�IstBf�ʦ1G'�IstB��-�1G'�IstBf�˦1G'�IstB�1�1G'�I�4����p�Mc�Nȓ84��\SiBc�Nȓ84���8�Mc�Nȓ84��\spBc�Nȓ84��� �Mc�Nȓ�i:d?S�&����'-ph��	��=����'-ph��	�f�����'-ph��	�!A����'-ph��	������'-p�t�~�c�6�9:!OZ�И�r�3
�9:!OZ�И�2��6�9:!OZ�И�rMP
�9:!OZ�И��]k?�v��z��i:d?S�f6���Z���6�8�	�͡}js��z��g�MZ���6�8��͡�js�Z�ٷ��ԛ��M�!��z��4���Ls|B�}-4���Ls|B��9>!�����y'�9>!������Z�ٷ��ԛ��M�!��z5�+4���Ls|B��9>!�����I�1�'dZ�И�2-ph��	�84������Ͼ�~�ޤn����cڦ1�'dZ�И�2�(4���Ls|B��9>!������`�1�'dZ�И�򬵟};�L�I�4���Ws�Bc�Oȴ��1�'dZ�И�2-ph��	��s|B��9>!�����i�Cc�M�G���96!/p���ۥg�5D/� �欗��M�Ҝ�Wn��欗߿M_�Ҝ��+B��	y���m�����m��欗�ߦ?@mΨ��}[�6g��E̱	��OcӘc��7Y��1�&��Cc�M���d������7�96!���oslB>j�Bc�M��ߜ�Mc�M�+�i̱	y��}��؄|�*�1�&��r־i̱	���Mc�M���}Әc�Qr������Y��1�&��7�96!����Mc�M�G�u�96!/��/�����mslB^/g������slB^/g������nslB^/g������+slB^/g����~WlslB^ k_�96!�K&4�؄�^��7�96!�v�4�؄�^��7�96!�k-4�؄�^��7�96!�>�4�؄�^��7�9>!ߵ��o����@־�u��L������ڜ��o� ���;�	�͹Y��/@m���7���3���Y��@mo�_@m���7�js�Z�ٷK��[ k_�9>!��s|B~X��1�'䇵os|B~X��1�'d�Cc�O�k�4������Mc�O�k�4������Ͼ]z��Y��_��	�e����_־i��	�7�И����7�9>!��}Ә����7�9>!3Bc�O�/k�4������Ͼ]z��Y��?��	�`s|B�X��1�'䏵os|B�X��1�'d�Th��	�c�    ���?־i��	�c����g���ۥg�-��/zb�Oȓ�os|B��}Ә�2q14���<Y��1�'���7�9>!O־i��	��s|B��}Ә���i��	y����3���ġ�5g��> �9d�M��֜A���T���3���ߦ@k�}�/�5g��� �9��~���3���M��g�|^�4��<h�Cc�N��A#4��<h�Cc�N�|B�4��<h�Cc�N���&4��<h�Cc�N�|&�4��<h���C�3���0stB���1G'd>�mstB���1G'���stB���1G'd>�mstB���1G'���stB��M�!�z�47�9:!Z�И�r}D�9:!Z�И�2�m7�9:!Z�И�r}(�9:!Z�И�2��7�9:!Z���L��>�����-ph��	������-ph��	�>�����-ph��	��`Ә���9>!ߵ��o����@־h:d=S�� ����> �9��}jsh�C_��Z���=So���o����f������ �9O���ۥg�-��/�Y��;��	�9>!�����i�Cc�Oȴ��1�'d�Cc�Oȴ��1�'dZ�И�2-ph��	����}��L���E�!�z�֦1�'dZ�И�2o��1�'dZ�И�2-ph��	�84���L��9>!������Z�ٷK��[ k_4���wT�s|B��9>!�����i�Cc�O�D�И�2-ph��	�84���Ls|B����o����@־h:d=S��4���Ls|B&.����i�Cc�Oȴ��1�'dZ�И�254���LstB>�nstB>h���v�zG�ơ�5�} Zsh�7}ZsZ���5�j���=So���m����oo������?@mΨ��}��L���E�!�z���1G'�84��\U|h��	���9:!��ostB>h�Cc�N�U�����Z�И�2�lstB>h���C�3����!4��|�������bӘ��AstB�/8Bc�N�-ph��	�oF6�9:!���1G'��J%4��|�7M��g�|�i��	���9:!ח8�1G'�84��̷?����Z�И�r}mstB>h�Cc�N�|ߴi��	��n�Y��;ꋪИ��AstB��Mc�N�-ph��	���9:!���1G'd�S�4��|������Z�ٷK��[ k_4���w�-ަ�6�8����Ww�P�C�����^��z��}��6�7��/�6�8���yj�g�.=So��}�t�z��Q_q����i�Cc�Oȴ��1�'dZ�И�2o��1�'dZ�И�2-ph��	�84������Ͼ]z��Y����L���7�9>!�����y��9>!�����i�Cc�Oȴ��1�'dbFh��	�84������Ͼ]z��Y����L����9>!�����i�Cc�Oȴ��1�'d�Th��	�84���Ls|B��9>!�Z�ٷK��[ k_4���w�s`Ә�2-ph��	��s|B��9>!�����i�Cc�O��И�2-ph��	���i��	��.�ۥg���"� �朴��@k�16}ZsNZ���5�6r�^��z���o��5� �~�9'-p�P�3j�g�.=So��}�t�z�����Mc�N�'-ph��	�6�����OZ�И�2�\6�9:!����1G'��stB>i�Cc�N���4��|�7M��g��!'4��|������ɳi��	���9:!��И��IstBf�Ц1G'�84��\��Bc�N�'-p�t�z���n�Mc�N�'-ph��	��9����OZ�И�2��6�9:!����1G'��XstB>i�Cc�N����4��|�7M��g���+4��|�������i��	���9:!��И��IstBf�٦1G'�84���|��Ͼ]z��Y����L��}n���Z���6�_ݡO@m-p�P�Cz��gꭗ��M?���,B���Z���6穵�}��L���E�!�zGm�9>!�����i�Cc�Oȴ��1�'d�Cc�Oȴ��1�'dZ�И�2-ph��	����}��L���E�!�z;$7�9>!�����y��9>!�����i�Cc�Oȴ��1�'dbFh��	�84������Ͼ]z��Y����L��������i�Cc�Oȴ��1�'dZ�И�2Q*4���Ls|B��9>!�����g���ۥg�-��/�Y��;�[�i��	�84���L\�9>!�����i�Cc�Oȴ��1�'djh��	�84��|U�4��|����3���xz Zs.Z���5�˛>�9-p�КS[�C/s�L������К��M��֜�8������o����@־h:d=S�`W��1G'�84��\۹Cc�N�-ph��	�}�����/Z�И�rm �9:!_���1G'dv�ostB�h���C�3��ڲstB�h�Cc�N��u�4��|�����k�|h��	���9:!��~Ә��EstB�m��1G'��i:d=S�`?��1G'�84��\����/Z�И�2OlstB�h�Cc�N���Ah��	���9:!��¦1G'��i:d=S輻Bc�N�-ph��	��$6�9:!_���1G'�z�"4��|�����y.cӘ��Es|B�k�g�.=So��}�t�z���� ���Z���6�_ݡO@m-p�P�Cz��gꭗ��M?���,B���Z���6穵�}��L���E�!�zG=&s|B��9>!�����i�Cc�Oȼ!����i�Cc�Oȴ��1�'dZ�И��[k?�v�zd틦C�3��!�4���Ls|B�M?4���Ls|B��9>!�������1�'dZ�И��Wk?�v�zd틦C�3��z�*4���Ls|B��9>!������R�1�'dZ�И�2-ph��	�84���<k�g�.=So��}�t�z����g����i�Cc�O���И�2-ph��	�84���Ls|B&�����i�Cc�N�w��Mc�N�7-p��n?S��= �97-p�К�3}�>�97-p�КS����M�����_@k�M���Z�ٷjsh����2�-nstB�i�Cc�N���ch��	���9:!��1G'�84��\�X����oZ�И�2�fnstB�i��>0G'�z�34��|�����ytӘ��MstB��HCc�N�7-ph��	��O7�9:!ߴ��1G'�zp54��|�7}b�N�<�i��	���9:!ף��1G'�84���3�����oZ�И�r=�stB�i�Cc�N�<ջi��	��n�����q�И��MstB�9�Mc�N�7-ph��	�@�9:!ߴ��1G'd�\�4��|������Z�ٷ��Իi��^�����Y�M@m-p�P�ï��'�6�8��͡���3�nZ���6�7��/�6�8���yj�g�n?S�n����y{
�9>!�����i�Cc�Oȴ��1�'d�Cc�Oȴ��1�'dZ�И�2-ph��	����}��L����s|B��9>!�����y��9>!�����i�Cc�Oȴ��1�'dbFh��	�84������Ͼ�~��M��9>!lBc�Oȴ��1�'dZ�И�2-ph��	�(s|B��9>!�����i�Cc�Oȳ�~���3�nZ�'���Ls|B��9>!Cc�Oȴ��1�'dZ�И�2-ph��	��s|B��9:!?�7�9:!?��Es��L�:�"� ��<���@k�^l���<���/@kN�z��g�=���@k�ll���<���?@mΨ��}��L���i:d?S��=6�9:!?���1G'�:$4��������9KdӘ��CstB�CHBc�N�-ph��	��K6�9:!?��M�!��zu�Ih��	���9:!s^ʦ1G'�84��\�����Z�И�2'    �lstB~h�Cc�N�u�Kh��	��n�����L�Mc�N�-ph��	��	�9:!?���1G'dN��4�����������И��CstB�ܛMc�N�-p�t�~�^�stB~h�Cc�NȜ��i��	���9:!�=�1G'�84����>����Z�И��]k?�v��z-p�t�~��	mz jsh�C��~u�>�9���/@m-p�e������~ �9�Y�~�9���?@m�Sk?�v��z-p�t�~�^�s|B��9>!�����i�Cc�Oȼ!����i�Cc�Oȴ��1�'dZ�И��[k?�v��z-p�t�~��Pms|B��9>!�s|B��9>!�����i�Cc�O�ČИ�2-ph��	����}��L���i:d?S��
�9>!�����i�Cc�Oȴ��1�'d�Th��	�84���Ls|B��9>!�Z�ٷ���{h���C�3�8�lӘ�2-ph��	��s|B��9>!�����i�Cc�O��И�2-ph��	���i��	��.���g���n��5�} Zs8n�'�5�}Zs�@���?S�� Zs8�n�/�5��jsF�����g꽴�M�!��z�}�i��	���9:!סy�1G'�84���i{����_Z�И�r�stB~i�Cc�NȜ�i��	��n���ԫ�Cc�N�/-ph��	�7�9:!����1G'�:�04��������9�pӘ��KstB��Cc�N�/-p�t�~��&nstB~i�Cc�N�u�bh��	���9:!sN�1G'�84��\<����_Z�И�2'CnstB~i���C�3��H�И��KstB�,�Mc�N�/-ph��	���9:!����1G'dN��4���������Z�ٷ���{i���C�3�8os�P�C� ���;�	�͡}jsh�C/s�L��8�����"��͡�js�Z�ٷ���{i���C�3��0�И�2-ph��	�84���Ls|B�14���Ls|B��9>!������Z�ٷ���{i���C�3�8�uӘ�2-ph��	�7�И�2-ph��	�84���Ls|B&f����i�Cc�O�_�����g꽴�M�!��zu�mh��	�84���Ls|B��9>!�Bc�Oȴ��1�'dZ�И�2-ph��	y��Ͼ�~��K�4���������i�Cc�O���И�2-ph��	�84���Ls|B&�����i�Cc�N�_��Mc�N�-p��n?S�@= �9-p�К��ɛ>�9-p�КSG.�^���z-p�К�Y͛~�9-p�P�3j�g�n?S�n�����t�Mc�N�-ph��	����9:!���1G'dΣ�4��������� �И��GstB��Mc�N�-p�t�~�^�stB�h�Cc�NȜ��i��	���9:!�aݡ1G'�84���)ߛ���?Z�И�rstB�h���C�3�8W|Ә��GstB��Cc�N�-ph��	���7�9:!���1G'�:=4��������9;}Ә��G�4���W������?Z�И�2��ostB�h�Cc�N�u�{h��	���9:!s>��1G'�84���|��Ͼ�~��G�4���ǉ����Z���6�_ݡO@m-p�P�Cz��g�}���@mo�_@m-p�P����Ͼ�~��G�4���W������i�Cc�Oȴ��1�'dZ�И�2o��1�'dZ�И�2-ph��	�84������Ͼ�~��G�4����,�Mc�Oȴ��1�'d��Cc�Oȴ��1�'dZ�И�2-ph��	��s|B��9>!���o�����7M��g�ՠ�И�2-ph��	�84���Ls|B&J����i�Cc�Oȴ��1�'dZ�И�򬵟}��L���i:d?S�)����i�Cc�O���И�2-ph��	�84���Ls|B&�����i�Cc�NȳZ�1G'�I\4���ԫ!��5g��> �9���	h͙���/@kN%	���3�&-p�К�4�M��֜I���Z�ٷ��ԛ��M�!��z�O�4��<i�Cc�N�5x%4��<i�Cc�N�Ll�4��<i�Cc�N�5�%4��<i�Cc�N�̈�4��<i���C�3�j�Lh��	y������J�i��	y�����k�Mh��	y��������i��	y�����k�Nh��	y�7M��g�1ygӘ���9:!�ȞИ���9:!3�gӘ���9:!א�И���9:!3]hӘ��n���ԫ�D�1G'�IstBf�Ѧ1G'�IstB�AH�1G'�IstBf�Ҧ1G'�Is|B�k�g�n?So�7M��g�1�i�P�C� ���;�	�͡}jsh�C/s�L�I����f������ �9O�����g�MZ���L�hs|B��9>!�����i�Cc�Oȼ!����i�Cc�Oȴ��1�'dZ�И��[k?�v��z��i:d?S�i_����i�Cc�Oȼ����i�Cc�Oȴ��1�'dZ�И�21#4���Ls|B�j�g�n?So�7M��g��(�И�2-ph��	�84���Ls|B&J����i�Cc�Oȴ��1�'dZ�И�򬵟}��L�I�4���ǜ�Mc�Oȴ��1�'d�bh��	�84���Ls|B��9>!PCc�Oȴ��1�&��Z�1�&��_�u{�L��!z��Ҝ����P�s��M��Ҝ�����P�s�_��{�6!����M?�Ҝ��M��Ҝ����������o��־�96!��ilslB^/g����O�7�96!����Mc�M�'�������Y��1�&䓅�4�؄�^��7�96!����1�&���E�c�*������Y��1�&��6�96!����Mc�M�'rnslB^/g����O��4�؄�^��7�96!��u�4�؄�@־�slB>�{�i̱	y���oslB>��i̱	y���oslB>���i̱	y���oslB>�+�i̱	y���oslB>�]�i̱	y��}��؄|�KfӘc�z9k�4�؄|��iӘc�z9k�4�؄|�kmӘc�z9k�4�؄|��pӘc�z9k�4���|��Ͼ=z��Y�����3�N~oz jsn־�P�s��M��ڜ��o���ܬ}��=So���o���ܬ}�/�6�f�� �9O���ۣg�-��/����־i��	�a����־i��	�a����־i��	�a����־i��	�a�����Z�ٷG��[ k_�9>!��}Ә����7�9>!��}Ә����7�9>!��}Ә����7�9>!��}Ә����7�9>!���o����@־�s|B�X��1�'䏵os|B�X��1�'䏵os|B�X��1�'䏵os|B�X��1�'䏵os|B����o����@־�9>!O־i��	y��Mc�Oȓ�os|B��}Ә��d����'k�4���<Y��1�'���7�9:!�j�����-p��=S�$oz Zs-p�КC���	h����/@k!|��=So���m����7�Zs-p�P�3j�g�=So�?�}�t�z����Mc�Nȃ84����Mc�Nȃ84���'�Mc�Nȃ84���G�Mc�Nȃ84���g�Mc�Nȃ�i:d=S���Ԧ1G'�AstB�Sئ1G'�AstB��ۦ1G'�AstB�sߦ1G'�AstB��1G'�A�4���w�IsӘ���9:!�uӘ���9:!��vӘ���9:!�xӘ���9:!�izӘ��n�Y��;��i��	y��������i��	y�������i��	y�����i6�9:!Z�И��]k?���zd틦C�3�N:�M@m-p�P�C������ �9����9z��z9k���͡�jsh�C�ڜ��~���3���M��g�8����i�Cc�Oȴ��1�'dZ�И�2-    ph��	�84���Ls|B��9>!����o����@־h:d=S���4���Ls|B��9>!�����i�Cc�Oȴ��1�'dZ�И�2-ph��	����}{�L���E�!�z'�ߦ1�'dZ�И�2-ph��	�84���Ls|B��9>!�����i�Cc�Oȳ�~���3���M��g�������i�Cc�Oȴ��1�'dZ�И�2-ph��	�84���Ls|B��9:!�7�9:!��Es{�L���x�Кs��> �9�͛>�9-p�КCM��e����^��6� Zs�7�ZsZ���6g��Ͼ=z��Y����L��F}Ә��AstB���4��|�������7�9:!���1G'd��Mc�N�-ph��	�o6�9:!��M�!�z'_7lstB>h�Cc�N�|O�i��	���9:!�Ǧ1G'�84���7#����Z�И�2_�lstB>h���C�3�N���4��|������gӘ��AstB�۟Mc�N�-ph��	���6�9:!���1G'd�o�4��|�7M��g�|Q�i��	���9:!�צ1G'�84���Wc����Z�И�2ߩmstB>h�Cc�O�w���ۣg�-��/�Y��;�o�P�C� ����>�9���/@m-p�e����^��7� jsh�C���Z���6穵�}{�L���E�!�z'_qns|B��9>!�����i�Cc�Oȴ��1�'dZ�И�2-ph��	�84������Ͼ=z��Y����L���7�9>!�����i�Cc�Oȴ��1�'dZ�И�2-ph��	�84���Ls|B�j�g�=So��}�t�z��ɗ����i�Cc�Oȴ��1�'dZ�И�2-ph��	�84���Ls|B��9>!�Z�ٷG��[ k_4���w�s`Ә�2-ph��	�84���Ls|B��9>!�����i�Cc�Oȴ��1G'�Z�1G'��hn���w��b�Кs��> �9����	h�9i�C_��6rlz��gꭗ��M?��v�l��朴��?@mΨ��}{�L���E�!�z'{N6�9:!����1G'd6�lstB>i�Cc�N��r�4��|�������i��	���9:!��fӘ��I�4���w�!gӘ��IstBf'Ϧ1G'�84����Mc�N�'-ph��	��C����OZ�И�2��6�9:!���M�!�z'��6�9:!����1G'd�9mstB>i�Cc�N���4��|������X�i��	���9:!�#kӘ��I�4���w��kӘ��IstBfئ1G'�84����Mc�N�'-ph��	�]g����OZ�И��]k?���zd틦C�3�N��mz jsh�C��Z��'�6�8��͡���3���Y��@m-p�P�C���<���o����@־h:d=S�d�1�'dZ�И�2-ph��	�84���Ls|B��9>!�����i�Cc�O�o���ۣg�-��/�Y��;�!�i��	�84���Ls|B��9>!�����i�Cc�Oȴ��1�'dZ�И��Wk?���zd틦C�3�N��ns|B��9>!�����i�Cc�Oȴ��1�'dZ�И�2-ph��	�84���<k�g�=So��}�t�z�����Mc�Oȴ��1�'dZ�И�2-ph��	�84���Ls|B��9>!������j�����/Zࢹ=z�����M@k�E� ��cy�'�5�}Zs���e����^��6� Zs�#�������֕,	��W�i+� ��K����;�	Fr�J��\!	l�9���o`m��=��g}��:���!�w�}}*{h�ԅ|X�C3�.d��9u!V��̩����fN]ȇ84s�B��S�a͜��}�|h�ԅ|X�7mC��������̩���fN]�>�>4s�B>����S��͜��+ph�ԅ���C3�.��
�9u!�X��̩��oچ\ߩ��y���S�a͜��}`h�ԅ|X�C3�.d� �9u!V��̩�W�fN]ȇ84s�B�����S�a޴��S���C3�.��
�9u!����̩���fN]Ⱦ^14s�B>����S��e͜��+ph���{�~��Yߩ�����m���z_���ͱ����X�C��9V���6�
�1��S��qg��X�c}ks���o`m����ڏ��S���Kې�;���&34s�B��fN_�V�����
�9}![�C3�/d+ph��l͜�����������ڏ��S���Kې�;���C44s�B��fN_�V�����
�9}![�C3�/d+ph��l͜�����������ڏ��S���Kې�;���`54s�B��fN_�V�����
�9}![�C3�/d+ph��l͜��������z�~��Yߩ�����m���z_�>�9}![�C3�/d+ph��l͜��������84s�B��fN_�V��̩�����fN]�?+�K{\��z��7�ؚ������N��_`k��
� ���2�п��g}[s|�p�ؚ�����9����~<`m�x��ԅ�{�C3�.�84s�B��ǡ�S��
�9u!����̩�g͜��}�rh�ԅ���fN]Ⱦ�94s�B�Y�7�ǜ��}�sh�ԅ���fN]Ⱦ:4s�B�Y�C3�.d_#�9u!�����S��͜��V��̩�W�fN]�?+�̩�7^�fN]�?+ph�ԅ쫲C3�.�84s�B�ۡ�S��
�9u!�r��̩�g͜��}�wh�ԅ��o�`N]Ⱦ<4s�B�Y�C3�.d�#�9u!�����S�/ ͜��V��̩�7��fN]�?+ph���{�~���ߩ��o�y\��z�+=�X�c��ͱ��ks���`m�8�cN���
���X�C_��+p�X�s�g�������Y�7}2�/d+ph��l͜��������84s�B��fN_�V�����
�9}![�C3�/��=��W���
��9}![�C3�/d+ph��l͜��������84s�B��fN_�V�����
�9}!��ٯ���;�~V�M����
�9}![�C3�/d+ph��l͜��������84s�B��fN_�V����y�g�������Y�7����84s�B��fN_�V�����
�9}![�C3�/d+ph��l͜������S�����fN]ȧ��=��N=/��l�9������9�z1�ؚsZ�C�����1��S��>��9޳1�l�9���o`m��=��W��i޴��Sϛ=�fN]ȧ84s�B�J���S�i͜���Kdh�ԅ|Z�C3�.d/!�9u!�V��̩��K�fN]ȧx�6��N=�=�9u!�V��̩��R�fN]ȧ84s�B�����S�i͜����eh�ԅ|Z�C3�.d�v�9u!�V�Mې�;��fh�ԅ|Z�C3�.d/��9u!�V��̩�[h�fN]ȧ84s�B�����S�i͜����fh�ԅ|Z�7mC������S�i͜���igh�ԅ|Z�C3�.d���9u!�V��̩ٻ}�fN]ȧ84s�B��g������;����!�w�y���`m�8��6�
��ͱ�>��9V�Џ9��z�8�	�ͱ����9V��7�6�|�~���ߩwZ�7mC���󪥡���84s�B��fN_�V�����
�9}![�C3�/d+ph��l͜������~\��z�x�6��N=��9}![�C3�/d+ph��l͜��������84s�B��fN_�V�����~�~���ߩwZ�7mC���󒮡���84s�B��fN_�V�����
�9}![�C3�/d+ph��l͜���{�k?��N��
�ir��7�͜��������84s�B��fN_�V�����
�9}![�C3�/d+ph�ԅ|�+�S�e~i���S��݆� [s.+p�?`k������\V���5��~���Ի�    ��O`k�7�}[s.+p�X��y�~���ߩwY�7mC�����S�e͜���4oh�ԅ|Y�C3�.do��9u!_V��̩�k��fN]ȗ84s�B�~���S�e޴��Sϋ�fN]ȗ84s�B�F���S�e͜����ph�ԅ|Y�C3�.d�0�9u!_V��̩���fN]ȗx�6��N=oM�9u!_V��̩���fN]ȗ84s�B��ơ�S�e͜����qh�ԅ|Y�C3�.do��9u!_V�Mې�;��Rrh�ԅ|Y�C3�.d��9u!_V��̩�K,�fN]ȗ84s�B��ˡ�S�e͜���ٯ���;�.+�m���z޷9�X�c��ͱ��ks���`m�8�cN��e}ks���/`m�8���9߳_�q�w�]V�Mې�;���th��l͜��������84s�B��fN_�V�����
�9}![�C3�/��=��W��e޴��SϛZ�fN_�V�����
�9}![�C3�/d+ph��l͜��������84s�B�߳_�q�w�]V�Mې�;���vh��l͜��������84s�B��fN_�V�����
�9}![�C3�/����ڏ��S�oچ�ߩ��C3�/d+ph��l͜��������84s�B��fN_�V�����
�9u!��
�i�ԅ|[�_�������?�֜�
�ؚ���C��9�8�l����s�;�n+p�ؚ�]�C_�֜�
���|޳_�q�w��V�Mې�;��zh�ԅ|[�C3�.d���9u!�V��̩����fN]ȷ84s�B�"롙S�m͜���{h�ԅ|[�7mC�����졙S�m͜���s{h�ԅ|[�C3�.d/��9u!�V��̩�[��fN]ȷ84s�B�z�S�m޴��S�{ŇfN]ȷ84s�B�B�S�m͜����|h�ԅ|[�C3�.d�@�9u!�V��̩ٻӇfN]ȷx�6��N=/]�9u!�V��̩��ڇfN]ȷ84s�B�����S�m͜���~h�ԅ|[�C3�/��{�k?��N��
�ir��7����X�C�ks������+p�X�c���ߩw[�C���+p�X�c}ks����~\��z�x�6��N=���9}![�C3�/d+ph��l͜��������84s�B��fN_�V�����z�~���ߩw[�7mC���s������
�9}![�C3�/d+ph��l͜��������84s�B��fN_��{�k?��N��
�ir����fN_�V�����
�9}![�C3�/d+ph��l͜��������84s�B^�ٯ���;�n+�m���zn��9}![�C3�/d+ph��l͜��������84s�B��fN_�V��̩y�+�S�����ߩ犐�?�֜e�l�q���_`kβ�>��9.%�1��SoY�C�����}[s�8�����g������[V�Mې�;�ܟ24s�B^V��̩��+C3�.�e͜����24s�B^V��̩�U/C3�.�e͜���34s�B^V�Mې�;�\.34s�B^V��̩٭4C3�.�e͜��]g34s�B^V��̩�=8C3�.�e͜��]�34s�B^V�Mې�;�ܼ34s�B^V��̩ٕ=C3�.�e͜����34s�B^V��̩�%AC3�.�e͜���.44s�B^V�Mې�;�\K44s�B^V��̩�}FC3�.�e͜��]�44s�B^V��̩�JC3�.�e͜���ٯ���;��x�6��N=w6���X�C�ks������+p�X�c���ߩ����O`m�8��ͱ����9�{�k?��N�e޴��SυVC3�/d+ph��l͜��������84s�B��fN_�V�����
�9}!_�ٯ���;��x�6��N=�}͜��������84s�B��fN_�V�����
�9}![�C3�/d+ph��|�g������[V�Mې�;�\�64s�B��fN_�V�����
�9}![�C3�/d+ph��l͜��������z�~���ߩ�����!�w�'nh��l͜��������84s�B��fN_�V�����
�9}![�C3�-���
�i洅���/�>��N��%zC��9Ϗ��,�9���_`i���C�Ҝ��������׿�O`i�����/`i������7�6���ڏ���8���0�-���C3�-��ǝ������ơ������~��i�����i��qg�i洅|8��������~��i�p�C3�-�t�/�ǜ���͜���w��fN[�ǆfN[�Ϗ;�M3�-䃜C3�-��ǝ������ꡙ�����~��i�����i���K���ΰ�������~��i�����i��qg�i洅|�/wh洅�����4s�B>�'?4s�B~~��o�9m!���9m!?���9m!���9m!??��7͜���:͜���w��fN[ȇֆfN[�Ϗ;�M3�-�ÿ�C3�-��ǝ������=��w}��:��~w}���_�?�ڜ�����6���7�������`m���o�1��S��qg��X��s�����9?g��X�s�g�����{@g��'s�B>��������7͜��Og�i��|:�M3�/���o�9}!��~����t��fN_ȧ��4s�B�޳_�q�w�=���9}!_�~����r��fN_ȗ��4s�B���������7͜��/g�i��|9�M3�/���o�9}!��ٯ���;��ٿ�͜��og�i��|;�M3�/���o�9}!��~����v��fN_ȷ��4s�B���������7͜���{�k?��N�t�/����r��fN_���o�9}!/g�i�􅼜�����r��fN_���o�9}!/g�i�􅼜���S��]�7͜��?V�����;�I<�ؚ�����h顿�֜�8�l��C?��w�=?~������/`k��
���|޳_�q�w�=��ir}�������S��
�9u!�Ech�ԅ���fN]�~C�9u!����S�_m�fN]�+ph�ԅ�w���S��
�ir}��ᗩ��S��
�9u!�-lh�ԅ���fN]�~}�9u!����S����fN]�+ph�ԅ�ơ�S��
�ir}���7͡�S��
�9u!�uh�ԅ���fN]�~��9u!����S�_��fN]�+ph�ԅ�顙S��
�ir}�����S��
�9u!��}h�ԅ���fN]�~��9u!����S��`h�ԅ���fN_ȿ���~���z��_چ\ߩw�(�� ks������9V��_`m�8��ͱ�~̩��{~��o���X�C_��+p�X�s�g�����{@g��6��N�À34s�B��fN_�V�����
�9}![�C3�/d+ph��l͜�����������ڏ��S���Kې�;�������
�9}![�C3�/d+ph��l͜��������84s�B��fN_��{�k?��N�t�/mC���;LC3�/d+ph��l͜��������84s�B��fN_�V�����
�9}!����~���z��_چ\ߩw�E�fN_�V�����
�9}![�C3�/d+ph��l͜��������84s�B�{W�M3�.�?+�K{���z��x��5��
�ؚcm�l����>��9f�s�;����}[s��C_�֜?+p�X��y�~��]ߩ�����m���z�E}h�ԅ�g͜��M�C3�.�?+ph�ԅl��9u!�Y�C3�.d���̩��
�9u!����̩��
�ir}����C3�.�?+ph�ԅ��C3�.�?+ph�ԅ�C3�.�?+ph�ԅ�/#C3�.�?+ph�ԅ�O*C3�.�?+�m���z���͜�������S�?�͜�������S���͜�������S�?͜�������S��7͜�������!�w��P54s�B���fN]���54s�B���fN]��464s�B���fN]���64s�B    ���fN_ȿ���~���z��_چ\ߩw�+��`m�8��6�
��ͱ�>��9V�Џ9��zϏ;�M���+p�X�c}ks����~���z��_چ\ߩw������
�9}![�C3�/d+ph��l͜��������84s�B��fN_��{�k?��N�t�/mC���;��wh��l͜��������84s�B��fN_�V�����
�9}![�C3�/��=��w}��:���!�w��8>4s�B��fN_�V�����
�9}![�C3�/d+ph��l͜��������z�~��]ߩ�����m���z�O͜��������84s�B��fN_�V�����
�9}![�C3�/d+ph�ԅ�}W�M3�.���=��N���*�� [s�V�������l��Z�C����1��S������'�5�'@����9_+p�X��y�~��]ߩ�����m���z�Ϝ͜���V��̩هU�fN]�_+ph�ԅ�S.C3�.�84s�B�񘡙S��
�9u!�\��̩�k޴��S������S��
�9u!�$��̩�k͜��}hh�ԅ���fN]�>;44s�B�Z�C3�.d:�9u!����!�w�>�44s�B�Z�C3�.ds�9u!����S��G͜���V��̩���fN]�_+ph�ԅ�YC3�.�x�6��N��G��fN]�_+ph�ԅ�3`C3�.�84s�B�ᱡ�S��
�9u!����̩�k͜���ٯ���;��ٿ���S��9��?��+p�?`m�8�X�c} ks���s�;��w��>��9V���6�
����ٯ���;��ٿ���S��!�����84s�B��fN_�V�����
�9}![�C3�/d+ph��l͜������~���z��_چ\ߩw�������
�9}![�C3�/d+ph��l͜��������84s�B��fN_��{�k?��N�t�/mC���;||th��l͜��������84s�B��fN_�V�����
�9}![�C3�/����ڏ��S���Kې�;����9}![�C3�/d+ph��l͜��������84s�B��fN_�V��̩�xW�M3�.��
��w}����C��9�8��5�'���[s+p�ؚ��C?��w�=?~���������5�����9����~���z��_چ\ߩw�T��̩���fN]�>�=4s�B>����S�ρ͜��+ph�ԅ��C3�.��
�9u!����̩��oچ\ߩw����̩���fN]�>�>4s�B>����S��͜��+ph�ԅ���C3�.��
�9u!�X��̩��oچ\ߩw�<��̩���fN]Ⱦ04s�B>����S�o͜��+ph�ԅ�C3�.��
�9u!����̩��oچ\ߩw����̩���fN]Ⱦ%14s�B>����S��W͜��+ph�ԅ�{C3�.��
�9}!�޳_�q�w�=��ir}��� C��9V����+p�/�6�
� ��X�C?��w�=?��7}ks���/`m�8���9߳_�q�w�=��ir}���k2C3�/d+ph��l͜��������84s�B��fN_�V�����
�9}!_�ٯ���;��ٿ���S�������84s�B��fN_�V�����
�9}![�C3�/d+ph��l͜������~���z��_چ\ߩw�������
�9}![�C3�/d+ph��l͜��������84s�B��fN_��=��w}��:���!�w��}64s�B��fN_�V�����
�9}![�C3�/d+ph��l͜������S��]�7͜��V���X��z��7�ؚ������N��_`k��
� ���2�п��g}[s|�p�ؚ�����9����~<`m�x��ԅ�{�C3�.�84s�B��ǡ�S��
�9u!����̩�g͜��}�rh�ԅ���fN]Ⱦ�94s�B�Y�7�ǜ��}�sh�ԅ���fN]Ⱦ:4s�B�Y�C3�.d_#�9u!�����S��͜��V��̩�W�fN]�?+�̩�7^�fN]�?+ph�ԅ쫲C3�.�84s�B�ۡ�S��
�9u!�r��̩�g͜��}�wh�ԅ��o�`N]Ⱦ<4s�B�Y�C3�.d�#�9u!�����S�/ ͜��V��̩�7��fN]�?+ph���{�~������Y�7�<V���J���X�C�ks������+p�X�c���ߩ���>��9V���6�
����ٯ�X��z?+�O��l͜��������84s�B��fN_�V�����
�9}![�C3�/d+ph��|�g��c�w���������84s�B��fN_�V�����
�9}![�C3�/d+ph��l͜�����������ڏ�ߩ��o�fN_�V�����
�9}![�C3�/d+ph��l͜��������84s�B��fN_��=����S�g��bN_�V�����
�9}![�C3�/d+ph��l͜��������84s�B��fN]��o�9u!�V���X��z^^1�ؚsZ�C�[s��b�/�5��>��9^�1�cN��i}[s�gc�ؚsZ�C��ڜ�{�k?V��i޴��Sϛ=�fN]ȧ84s�B�J���S�i͜���Kdh�ԅ|Z�C3�.d/!�9u!�V��̩��K�fN]ȧx�6��N=�=�9u!�V��̩��R�fN]ȧ84s�B�����S�i͜����eh�ԅ|Z�C3�.d�v�9u!�V�Mې�;��fh�ԅ|Z�C3�.d/��9u!�V��̩�[h�fN]ȧ84s�B�����S�i͜����fh�ԅ|Z�7mC������S�i͜���igh�ԅ|Z�C3�.d���9u!�V��̩ٻ}�fN]ȧ84s�B��g��c�w�V�Mې�;��Mh��6�
�X�c���X�C��+p�ǜ�N��
���X�C_��+p�X�s�g��c�w�V�Mې�;��jih��l͜��������84s�B��fN_�V�����
�9}![�C3�/��=����S�oچ�ߩ�=TC3�/d+ph��l͜��������84s�B��fN_�V�����
�9}!��ٯ�X��z�x�6��N=/��9}![�C3�/d+ph��l͜��������84s�B��fN_�V����y�g��c�w�V�Mې�;���lh��l͜��������84s�B��fN_�V�����
�9}![�C3�.��]�7͜��/+�K{��N=�w�l͹������9�7�ؚsY�C��/��1��S��>��9�D7�l͹���o`m��=����S�oچ�ߩ��wC3�.��
�9u!{i��̩���fN]�޶74s�B�����S���͜��/+ph�ԅ��~C3�.��
�ir��͜��/+ph�ԅ썂C3�.��
�9u!{��̩���fN]��a84s�B�����S��͜��/+�m���zޚ84s�B�����S��-͜��/+ph�ԅ�=�C3�.��
�9u!{���̩���fN]��94s�B�����!�w�y���̩���fN]��E94s�B�����S��X͜��/+ph�ԅ��C3�.��
�9}!�޳_���;�.+�m���z޷9�X�c��ͱ��ks���`m�8�cN��e}ks���/`m�8���9߳_���;�.+�m���z^F:4s�B��fN_�V�����
�9}![�C3�/d+ph��l͜�����������ڏ�ߩwY�7mC����֡���84s�B��fN_�V�����
�9}![�C3�/d+ph��l͜������~��N��
�ir����͜��������84s�B��fN_�V�����
�9}![�C3�/d+ph��޳_���;�.+�m���z��;4s�B��fN_�V�����
�9}![�C3�/d+ph��l� �  �������S�����fN]ȷ��=V�� ����V����oN�l͹���`k�W.���ߩw[�C����j����V��7�6���ڏ�ߩw[�7mC����v衙S�m͜���Vzh�ԅ|[�C3�.d��9u!�V��̩ً��fN]ȷ84s�B�졙S�m޴��Sϫ��fN]ȷ84s�B�����S�m͜����{h�ԅ|[�C3�.do��9u!�V��̩����fN]ȷx�6��N=��9u!�V��̩�ɇfN]ȷ84s�B�&�S�m͜���}h�ԅ|[�C3�.d�N�9u!�V�Mې�;��t}h�ԅ|[�C3�.dok�9u!�V��̩�kއfN]ȷ84s�B�~���S�m͜���ٯ�X��z�x�6��N=o���ͱ����X�C��9V���6�
�1��S��>��9V���6�
����ٯ�X��z�x�6��N=���9}![�C3�/d+ph��l͜��������84s�B��fN_�V�����z�~����Ի����!�w��`h��l͜��������84s�B��fN_�V�����
�9}![�C3�/��=����S�oچ�ߩ碇����84s�B��fN_�V�����
�9}![�C3�/d+ph��l͜���{�k?V��m޴��S�-C3�/d+ph��l͜��������84s�B��fN_�V�����
�9u!�w�4s�B^V���X��z��l�YV����w����,+p�ؚ�R��s�;��8�	l�q����5gY�C��ڜ�{�k?V�޲oچ�ߩ�����S��fN]�.^�9u!/+ph�ԅ�Ɩ��S��fN]Ȯz�9u!/+ph�ԅ쎘��S�oچ�ߩ�r���S��fN]�n��9u!/+ph�ԅ�:���S��fN]����9u!/+ph�ԅ����S�oچ�ߩ�条�S��fN]Ȯ��9u!/+ph�ԅ쮟��S��fN]�.	�9u!/+ph�ԅ�v���S�oچ�ߩ�Z���S��fN]��3�9u!/+ph�ԅ�"���S��fN]�nP�9u!/+ph���{�~�����[V�Mې�;���4�X�c��ͱ��ks���`m�8�cN�޲�>��9V���6�
����ٯ�X��z�
�ir����fN_�V�����
�9}![�C3�/d+ph��l͜��������84s�B�޳_���;��x�6��N=�}͜��������84s�B��fN_�V�����
�9}![�C3�/d+ph��|�g��c�w�-+�m���z�B�9}![�C3�/d+ph��l͜��������84s�B��fN_�V����y�g��c�w�-+�m���z��9}![�C3�/d+ph��l͜��������84s�B��fN_�V���i���w�4s�B~�Ͽ�~��֗��������?>�w�      O   F   x�3�t4"oǠNC0��"CCNS=0���4Cb[bwBh �7�"��d��4'Y�+F��� 4V(�      Q      x��Ϯܶ�����EI�HP�"M6�7��m I�>M����K�^�G�H��;��;�9�5G�;���#%Qj���T�NZ�L�%y��i}*���V��&Z�8i�;U�q�5�D�K�$S����\���I>�1n���Q�k�r��C�wHa���B��7����k�5���l��7��y?�}K�
���������d�7���k��������7�;��k��_8��~4��A�!��p�J�K�K�K�K�K�K���V�+��
~��_�(��k�5�~��_��j�o�o�o�o�o�o�T��~����o�4w�w�w�w�w�w�w�������������������.�c���7яA�!��p֔���������M���W�+��
~8K5�~��_ï�����������?ԃ����V0���~����j��������P���������������?�>���s���Ǻ�����V							���
~��_���W��ZRï���k�5�~�]�������C�l�7���~��?������~KC1��e�<�sX��%�O�T�	k��+҃.j������S(]x<fd��Qժ�*���mjU[��q���[������&a�&Ǫe\?�wQ����|�OQ�Y.�6ʒ.��)�z|ʷ���r�>�nR�&و���q���m�.Tc���=��,mی{�	O�v���G�7���l�Wm�R�^�Z�/�B)�q䢐ַG�%>o�w�(�Y|���<E=����(�ȷ���+�\�v��E�Fzǅw��Ar�*�p�f�
;EQ�Hb�7eI������������l�]�g��H��V��S��-̎|Sy�T��W��Y��Y��Y��Y��Y��Y��Y��Y��Y��Y��Yw�['靜E��GH�O&�����:NWR�M]�Ӧ��~=[:K$���{�=��<eнu�9�.)!뭭3���w���t�'̵O��Pk/3{߬��K��w?cP���׾�,��6j;�f�^+E��n��],�I��O��'�%m�{�XW�.���k�XK�s�����,�DQ����8ވk�%򦱉y*�����PԚ��3��-����w�t��ڨ�|�m���)����^�7�Q�������w�}��|R:��n�6�̈́آY�?�v�Uœoj����Z�z��������7�Q[��'ѷ+o�%�뻢m)"��Fm�;��1/�/��V�KVE�����w�@lR�'L�o��k�	}c,�,� ���|SF����-Ϗ9�Vֿ �Mm��|/E'N+}(k���oj�n�;��_YS������!t+�f��=.[�P�;y}�� ����~��|�_E���w�L{C���}�B���ڨ�����U+�*�O��{�ŏ��a���Mݢ��N��/�W�J��f�ly��Y�L�����o���<Y�lq��$-=?O��[t߫�u��e��O�7u�n�{r�f���>��2��
�'��F���v�2�ڝ$}�N����kK�H>���yc|"�#q���_7��u�`����5)��񑩜E���E���E���E���E���E���E���E���E���E���E���E���E���E���E���E���E���E���E���E���E���u�U9&�fm��eE]��P��m��|�<���h�Ԯ9	�ω�������E#s�J����p��t��DU-�U�,;�Kddճ2�zU�&�aQ����5�v���������h���g�R�j�w~��wm׮=c�M�I�n��1>�[�RۺT�ZXJ[#�8�a�tz�o��Ʒ�C����|��x�%ԓ:ی���f[��wT�{؍y&�T�{�=D�V�4�9�ʷ9���x.�V��k�Mź߶�)ܞ���q�f�Ϸ�-�$�	�	ˮ}���bm�?�1pѬ��^��o��E�-۲�n�E��|��(�;Wmi_J�p�+���w��Ѻ��օLL��?����{.���?8��>��Q�,�-�3��EN��X[�=u���ɷ�K��Y�R갦0<��mK�Cj�'�j{�S��֨cQ�j�rl���.g���u���v��߉׳~<�U�2�MźC������qPػЪ��qf|O����'�-��P�5���Ϳ�o���\�G���R�#�����̷�e��g;�|B���U�n�9;񜾟���:���x�s�Źv��^�:߼�*G�Ʒ����r��".�,I���x�������?���|�-Wq�(�^؊����KI����(��o �P|���Y��Y��Y��Y��Y��Y��Y��Y��Y��Y��Y��Y�;i�@�D�Y�`궮\jkS�{��������jXJd<�~H�j�nI���OF����6	OE�N��۸��ؼ"�3��GSw���:ݏ�����<-X�O�<�W�}?�ߺ���1�qa�di�O(9��#�V���mǷj�5�{?�v��ġ�X�����f��~,���c-~�*̸Ѝ`=�Z���w��������˘��1���rg�?�X����Z�U� q�R�j<�~�߰������s�ޡ��|�9�[�{{���"ߏ�vZ?�K��Թv���r]	F��d��F���څ�S��82��--L�3�RZ�r&DN��ྎֶ�����v�w�2�����n���o�l���aZ�~,E�3d�n��5��趎b��*�O��ε�2U��/�~�w�"��횇xD%[�QƏ���q�r=!��_����d�OF)���T���c�%U��)i�v�5|�SR<�ՄF;׍8�=�U\t-o�S�����Cm=�����c���~�|�}G�	�����G�{�ۨF����6����_�E��%&�<�[������8�����#���Y���4�ҶS��GҜ�%�=,W�}�����X���J,^�6�B|��7���9F[�۵)'I����y�wv����ݟ+��t�Es�[{E��+[h_��Y���k,����U��[����'|��[Q�4bY�.��i�wo�m��#Ww�m�����Bɐ�-SZM�{{���w�n�4����a;u���dm���d�G��<W�����5���TDmI?�_��3Q��ĭc)0���O*z�b���tLT8��>8���gN�B_5������*�zN-�IK�:x���n�6豩B�i���l�)��\���t�6�9��<���|G=˕�s��>֡��]݉:_������\���H]�c�6����N-1x�4�����]�J%=.�D]�R߶��}硿R�3ŞA�I�E�����R_��@������w���tS�k��^j��_Uq� =��>�N��h[�c[�<3Rw��H{�|Ə�~�ۉ�@V���L;�{����oΥ�x�]+�G��e#�/����ձ��wF���/��m&�%��Qq[��jΪ:V]8־�ĮS�]"�z�B�ču��V,a�=���Ƴ���%���SZ�PY���G\�Җrcw�rޒ�c��݂�=�o����`�VfBN|����9��?��W|n(��B��x2��cƑ��f��)������#j�ٴ[�vm;�M=+�k������]��`�+��Z�^���m���.�L�Z�wW/��pt�E�o*gM��ԗHQ�&���A�?�=�����+����>�zpiw���8��r�s�w��;���')�%�?��;�]Ԭ��\ԟ�Gz��ݷ[|��Yu?i��>�|��c�%�F�CoI�7�� ��#�i�q�b�=�Eu�vC�zN���㧐f|�p�d�Hn�&�h���l��ŏ�KQ�Y2�J`6�yX�[T�'9��&��|����?�*�w���bbzN�*ݓƋ=۞������N�?~?���W���jW�{�r_^��ާ�e:yH'U:Y��:��w����Z�z����Wo����Կ��n������g��ן��˗Σ*]7�n�k��ndoSX��/^����?���7�w_������:v���n��rW�v�����������W�� ,   �vo^���j_��v���v_ת�Y���j�~�w?�x��ŋ��Zs)      S      x������ � �      U   9   x�3�<�!8���)ԇ�؄Ӑˈ����)4ȝ3Əӄ˘����1ȑ�(���� ;�
�      W   :   x�3�	�9<'��ȆHWNCKsN��"�4.NWNG_G�HG�xJ*g	W� ���      Y      x������ � �      [      x������ � �      ]   h  x����v�0���S�	z��m�LB��4�-�vӍb�D��re����.��Ԃ.0����όP�9��Q�>��~�������y��8B OQ����3���V���,D ���~aU�#Q��"����H��R���O\���J�Ms#�؊̧����U��`<��=S� �����"|�gŏ^7"��Z��d ]��(���*j�B�6r�Z�P:�m�ώׅ�({��+��"w^J4��YWi�Q�\���4W�~�PJm���W�$�I�7�e��Q��t�/��w�}tlg#�1��s���Skk��s�� 2t9��a GF'�A�ГL�=8;C����ln�i�A�<�>�<��o�=6��sO��GAӠO���	�fLi��R�k-��l����S��?�v�q7 ��Aً���ٙ�1�!�&-|��7�s�*��p!�>w�W�.ˉ �*_Z�WwE�����M��:��UD�utp�R@�ΠE(���5g�1�����4d!�c@�0�ҔLs˥�fan�+��ٙ[��,��P�F�r4aoi~����jl�7	L�Z����t�mH:����i��+�?���Q���Nl,�.�K��A�ػ��N��~&�� �B:`E      _   �   x�5N�
�0<o�b?@Q���^!�!�vk��M��п7m�;3;3�9�x��t�\��~[R��Y�0�7Q_e�MD�����d(2d�"�;��C`ףt�Wa��]r����w�b�oɐ������TM�N6��<�m� �e�R��鹌�5˯����D�      a   A   x�3�9��(���T�� .#N׼����W?.cN��Ғ��W.N��ļ�T� �=... )<      b   I   x�3��t�K��,�Pp��L�L,�/(*�O�,���L��)��4���s��u���Squ�����w������ ��S      d      x��\�n#9�>g={갗���d�X�d�˰��Z�jԠ���$��G�̴[>/�o0�F�X��eNu��&�dJI&)�v�KbF|��`D0�:�N0Z��WFFw�p���"�gY0�Y�b��-Z���`�+�<M���'�/�o:�n����￳9����
��5����	��m�y*�OZȊ��S��2�)2!Quxo:'�H+��;�
`�Y�a�$d�'��)�"f��
9�$�1d	a1OH�3��g����T$<��D��r�	��ɐ�9�gZ�+����O��%����QpƊ<���� �Jg0�^�d��5��f�4$��gs2���}ʘ �Ʉe��y�[\P�Ω=�J���
ߟ������A��-F��֥36�E�߈���<�aQ�L����j�ф���=#�ͳ���CaN�l�s��~���|�+���4�%;g	;������	���e��xD]��A��Sa�ݱd�`-lD]���r�A?���n�ؔ���7ҶC��`�i�=i�,!�.<&�t���[,A�ͳ��%��D�լj�R:���Eʲy�l��~�6�Mɴ�)Uso�#Sn�90����� ���G僙R;ȴ��0�-D>��s�v��ќ�air:��1�fhs8Y�o� g<BU�マn�%�Ŷ��#c����r�V�S��^��풊������[�q$Is�,-&`�߈|�z�@m�vЪ�[[۶R)>�f�L��l� Z��Y�ڙ2B�8)� lڦ�eW�p�~�&&�0�KB�Ir�հp����mW���g'����ڒ
�n�v�ӖΔ �| �Z��ڵ@q=J0�^�z;�i�'���&;��.��S3k�N�X�0m�<�D>v�v,��*h��Z��"��L? ���G.����l�4�zf�I�<�m,�r�2n�{_�z;�!2F���7��/�>:�Om�\��\����j�b������3r7��ܝ9�M�ݧ��Q���vԻr�:�������Mn���(���7rR:���W7C�H���\�v��� �Zj���`��:�> �<3o,m�qq5�9�͕�Y��ǞS	�ƚ�ͥ��\�Oː��׿��e���9>ݞ�ܳ�mմ}���Ĝ.p>����6�?������]���?� SʣB0'�����g�7N�&�epf/s�T����Mg	��1ͤ�H�D�4�d-��eL7O�_��sQy��0D�qP������0�S2Q��5ԄNHS_.�{��pB�g���@�%�d
,���kWG�"�T����P��0���2� �XQ��'����%���.Ц& ��-Ͳ�T���
ٔ'0���fÉg�ש�
��(�P�_�V����L@��y�<m�A�G�-��G<��N`��[\}�3�o\�k�y�+�_�)����O�\ϊ���C���5�^y��C�����Y)��%6���K1hRWlϱ�V��mL��m{+*<HV�s�&� ��0�Gp�'*���5	�j���87���iA���z���SI���׹��`�=�3"T��`�d3���%":s4�� �8C�d���d�X�캻g�DGE� 8F9u$��� F�Ҋ%�Ѷ�G�<�,���������[�s6Y�M
؄�]�)��Q� V�H_�h�բ}*`CZ�ޘ�
����W�8 W�o��?�sJ�4����%lŝ�}zd	��dY�pĀg���y`�{��3����DSQ$Q�l48�h��Y��&:♨e�y�-�ڴW�*����)f;�8;6�d��OL]t�2�"����/��
�[�G��!f+��J�0qSw�&��I1)���=��$eS��1-�(M�G���]��2���ǈ���"H. �P����2S)-2�xO��۱xkh������A���J�9�9�<*G@x�c�u�<�ǔHT�T./��^��΃�|��z��	�V���rx�.�J��ܰ� �L����_:�	��a�RL�~��d6��+�`��K��*�#��mYBNv��x�0��-:&�����=�9��l���ݱE�o��dl��{D1�g�nDW�Lez��2=��4��g�8xLҩe�c�\����$t�����N�����M ���8����e�~��Z�l�L�����U
G6ĵh�cr��A�sX�|3­�T�<-� ��K%��W��3��W������͵�����>�腇�c��r�zȻvJ�0�;ˉՃ⸾��tf)�3��@��0/d4��p34\n��$�3i	'����p�J6�<\�v|a����=�=,�.�8��̞��և�������ұ�P_C'C�v>�_�+���}�+=;��K=�vٕnv���(/lEH��D;�\,�/^>6���%�y��w�'q%�=��8bŜ��h�l�����:��vY��{�	n��zT��o�:�{�m7/_Fx 뛥��,���6���`}�؈�X��K 0�l�r��U2�8?�}�� c.Z��Il��%!��d���I=K������NQ�hw�{��M�3��lA��b�F!���Hg���yA�1К��я0II�4�i�d�Q����J�������ekx@zB%H�By��3&��'t����\?y ;;	�7ϋ��!��2��ޅ�Dp*gG���Zf�����W�C��Ed2	G��PO����.����B`�$�@��^�S�)1��cQ/�����;+�K�rG��3zj��DF[DfTb�>��ڶTm>,��Q�l���pM0�~���у�����Z(���jnw���E��p�r�Y��*�����e��f���LX���H��ž��#�$��3�����F�=�k�ڥ�\�1�̚5igߴ�K��{�MBos�8U�t��XVj�dk�+��Q��"���-�B�̓F��q�8:"�$J'4��Y��������a��a�S/ҝ�3���p�B3�0��=��(�bt��~����-u]6��e/�d�iY�t�*���#�W�}{	�hDU=�i�+�J���lt!���:�����.�$���WR&t�@�յp��.��%�=��x�.��4���6�6X+?\���n�XÇ1���7��Ho�S� :>!$P���s�7��+w�$[�uql��g���,�)�OC�ꂃ_��>�*�R�o� ���"6�����V�t��F޾�f���m�r1�ww�~�l+NW�����8����.Fo�Ps��A������B�M��x���aO��aY�`�W���1��÷,+c���ø+�q��ˁ/����2����f T��|�Y�W�$��֯���I��Mj����_�x���'03ms���a��f0�=c�Ѻ�z(ۖ]5��`.^�w�ϨFk�\�T�:�e�ҰPq��7y\c蘶iK_�j�X�4�*k��ά�*I#V���VM����ى"�2�H�S���~J-h���dw0]1�G����`���ޕ�*�l�Fnk��>�ڷS��[жӣ9�N��5�N�V��������
G�y�.��r���U]���פ���mW����a_�%��Y+�yU�x�|v�3Q���v��)��I.^�����,��W{9���bYEo��Md���{�?��I+3�­m�Wg�}����+��>![�Zt��g2��-���J�7��=��G�x5#���b�|�*�=����iR�\�8B�W�HU^+=&����h��d<#4!T=�tx ��)�Hr2�"�}�'�*Ī��^QD���7�Xr�پ�+W��œ�}���gV����J��������O����a[���PD��
̎6Z��M�J��y��].�p�YZ�A�;�K�٥�K��9�w�Ҹ%6�tA��T��.	��B�_7�Q�~տ��q�󭼪���2.f����r<ȟdN32f�8X�i*tyءNoV�k�N�k�9�e9eɊ��[Ў���e,W[!ϷK���b�U��*]���m��Pw͵��կNka�vW_!Ӻ����e���G�5{�VQ�Ɋ��� �  �ۋl�K8��_HKCj�L�"Q�t�+�h�R��	X,��m1,L�Z�P���g(���7�o�͙~[�C-�S�S��>���>0!��z�U@�r������S5q��uW���i3/�C����,�V�l�Wl��V�_���5V��$3��;��m�]Q�F�d�:'k/2Y�
�W�Z���{��}b�����v�dE�X`��j�����S�%�?a#�P2�0����Tş�2�Ȭ���	�c�ac�\����h�D�B3&�+�F��7� �#�a3�w/��K9�z�]m����"������1�s3�b�'��#(�������L���e7�i�Yɋ��֕�����x8�'l�us%eԯ2�L�+��~r7G��o�T޻�p�������:p�2�9�2��Ȇ�W����r�zuʈ;�/K	�JI	j3Uj.U��*d��s$���(ғ�_��8��2;�feÃ���5:֬�!����ު΄��gI#8P�`~�9�4��w��K��Y���2=�Fp%�4xQ�E�rJ��7B����'������2�q�	�B����F�<�I�`�����y��ro[l�{��ڱ��l��O�:�Q?��e�Y�o=eӷ�B�����}�
>,��q�P��^�?����W�F� v���M����¶Y�u�������%��*�t+�B?<ھ7�'28�������D�,q_Y�n��	x���<�����ɷ%v���eǺ���\��,j�mZ��
/�8~B���c���/{P��%���^�k�{�NFt���m�����Yui�3��o�H����'���5���
n+]D�7r�O��{�ip���Y�_�4������E����@��@�B�Cx�
W��
��3\��[1�e��gy-�/o޼���֮      g   �   x�U���0����}�T@���&$bo^�T�l�)�O/����?͗N���<�,\3�Ժ.��\�_F�ܷ�F�R�?�"��̔��*<PEC���q'���C�6�t���9~0,���m�#Vx�
� ����!ՠ�qĵzf����8K��*m݃���0��p���%����3�e �ϼN �U7Wb      i   �   x�EP�m�0|SSh�B�۴y�(��퀖��\}�A;D٫��胀xw䝈�! �I���J�c�]4<��''����7>��=�>H2�ADH�[-����F�Q�&�K��?�p�Ҫ�:����B#_gI~�R�����I1��e�'������e�������O��uofz��������Y6�h� [�DR��#���9��EGv���9�Q�P&      j   E   x�3�t9���<� .#NwW?W.CN�H� � .SN� G_�p� o.3� נ`�c��o�=... 0��      m   A   x�3���N�J-S0�3�71�w�,�2�H,JTp�,���K����L�J's�q��qqq d��      o      x�3�q���L�2��%\1z\\\ 4�=      q   ^   x�3�ts�p�4�,�L�NC#s= 4�44�22�26�21�25�23�LK-�H,���I�,��5��0sH�M���K���t���\1z\\\ ��J      r   @   x�3�4�,�C7� �.#NCLqc��%��	P��zS��q3��1qs�z,����� W�$�      u   $   x�3�ts�p�4�4�34��32�31����� S�<      w   Y   x�3�tw�q�S8<'��?7� oO.�#��������zdޑ>\���ޮ!
���=}|=���2�t�)������ �0     