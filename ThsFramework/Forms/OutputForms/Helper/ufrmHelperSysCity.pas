unit ufrmHelperSysCity;

interface

{$I ThsERP.inc}

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.Menus, Vcl.AppEvnts, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBGrids, Vcl.Samples.Spin, Vcl.Grids,

  ufrmBase,
  ufrmBaseHelper,
  Ths.Erp.Database.Singleton,
  Ths.Erp.Database.Table,
  Ths.Erp.Database.Table.SysCity;

type
  TfrmHelperSysCity = class(TfrmBaseHelper)
  private
  protected
  public
  published
    function getFilterEditData: string; override;
    constructor Create(AOwner: TComponent; pParentForm: TForm=nil;
      pTable: TTable=nil; pIsPermissionControl: Boolean=False;
      pFormMode: TInputFormMod=ifmNone;
      pFormOndalikMode: TFormOndalikMod=fomNormal;
      pFormViewMode: TInputFormViewMod=ivmNormal); override;
  end;

implementation

{$R *.dfm}

constructor TfrmHelperSysCity.Create(AOwner: TComponent; pParentForm: TForm;
  pTable: TTable; pIsPermissionControl: Boolean; pFormMode: TInputFormMod;
  pFormOndalikMode: TFormOndalikMod; pFormViewMode: TInputFormViewMod);
begin
  pTable := TSysCity.Create(TSingletonDB.GetInstance.DataBase);
  inherited Create(AOwner, pParentForm, pTable, pIsPermissionControl, pFormMode, pFormOndalikMode, pFormViewMode);
end;

function TfrmHelperSysCity.getFilterEditData: string;
begin
  Result := FormatedVariantVal(dbgrdBase.DataSource.DataSet.FindField(TSysCity(Table).CityName.FieldName).DataType, dbgrdBase.DataSource.DataSet.FindField(TSysCity(Table).CityName.FieldName).Value);
end;

end.
