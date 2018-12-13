unit ufrmHelperUlke;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.Menus, Vcl.AppEvnts, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBGrids, Vcl.Samples.Spin, Vcl.Grids,

  ufrmBaseHelper;

type
  TfrmHelperUlke = class(TfrmBaseHelper)
  private
  protected
  public
  published
    function getFilterEditData: string; override;
  end;

implementation

uses
  Ths.Erp.Database.Singleton,
  Ths.Erp.Database.Table.Ulke;

{$R *.dfm}

function TfrmHelperUlke.getFilterEditData: string;
begin
  Result := FormatedVariantVal(dbgrdBase.DataSource.DataSet.FindField(TUlke(Table).UlkeAdi.FieldName).DataType, dbgrdBase.DataSource.DataSet.FindField(TUlke(Table).UlkeAdi.FieldName).Value);
end;

end.
