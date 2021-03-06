unit Ths.Erp.Database.Table.AyarPrsBirim;

interface

{$I ThsERP.inc}

uses
  SysUtils, Classes, Dialogs, Forms, Windows, Controls, Types, DateUtils,
  FireDAC.Stan.Param, System.Variants, Data.DB,
  Ths.Erp.Database,

  Ths.Erp.Constants,
  Ths.Erp.Database.Table,
  Ths.Erp.Database.Singleton,
  Ths.Erp.Database.Table.AyarPrsBolum;

type
  TAyarPrsBirim = class(TTable)
  private
    FBolumID: TFieldDB;
    FBirim: TFieldDB;
  protected
  published
    constructor Create(OwnerDatabase:TDatabase);override;
  public
    procedure SelectToDatasource(pFilter: string; pPermissionControl: Boolean=True); override;
    procedure SelectToList(pFilter: string; pLock: Boolean; pPermissionControl: Boolean=True); override;
    procedure Insert(out pID: Integer; pPermissionControl: Boolean=True); override;
    procedure Update(pPermissionControl: Boolean=True); override;

    function Clone():TTable;override;

    Property BolumID: TFieldDB read FBolumID write FBolumID;
    Property Birim: TFieldDB read FBirim write FBirim;
  end;

implementation

constructor TAyarPrsBirim.Create(OwnerDatabase:TDatabase);
begin
  TableName := 'ayar_prs_birim';
  SourceCode := '1020';

  inherited Create(OwnerDatabase);

  FBolumID := TFieldDB.Create('bolum_id', ftInteger, 0, 0, True);
  FBolumID.FK.FKTable := TAyarPrsBolum.Create(Database);
  FBolumID.FK.FKCol := TFieldDB.Create(TAyarPrsBolum(FBolumID.FK.FKTable).Bolum.FieldName, TAyarPrsBolum(FBolumID.FK.FKTable).Bolum.FieldType, '');
  FBirim := TFieldDB.Create('birim', ftString, '', 0, False, False);
end;

procedure TAyarPrsBirim.SelectToDatasource(pFilter: string; pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptRead, pPermissionControl) then
  begin
    with QueryOfDS do
    begin
      Close;
      SQL.Clear;
      SQL.Text := Database.GetSQLSelectCmd(TableName, [
        TableName + '.' + Self.Id.FieldName,
        TableName + '.' + FBolumID.FieldName,
        ColumnFromIDCol(TAyarPrsBolum(FBolumID.FK.FKTable).Bolum.FieldName, FBolumID.FK.FKTable.TableName, FBolumID.FieldName, FBolumID.FK.FKCol.FieldName, TableName),
        getRawDataByLang(TableName, FBirim.FieldName)
      ]) +
      'WHERE 1=1 ' + pFilter;
      Open;
      Active := True;

      Self.DataSource.DataSet.FindField(Self.Id.FieldName).DisplayLabel := 'ID';
      Self.DataSource.DataSet.FindField(FBolumID.FieldName).DisplayLabel := 'B�l�m ID';
      Self.DataSource.DataSet.FindField(FBolumID.FK.FKCol.FieldName).DisplayLabel := 'B�l�m';
      Self.DataSource.DataSet.FindField(FBirim.FieldName).DisplayLabel := 'Birim';
    end;
  end;
end;

procedure TAyarPrsBirim.SelectToList(pFilter: string; pLock: Boolean; pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptRead, pPermissionControl) then
  begin
    if (pLock) then
		  pFilter := pFilter + ' FOR UPDATE OF ' + TableName + ' NOWAIT';

    with QueryOfList do
    begin
      Close;
      SQL.Text := Database.GetSQLSelectCmd(TableName, [
        TableName + '.' + Self.Id.FieldName,
        TableName + '.' + FBolumID.FieldName,
        ColumnFromIDCol(TAyarPrsBolum(FBolumID.FK.FKTable).Bolum.FieldName, FBolumID.FK.FKTable.TableName, FBolumID.FieldName, FBolumID.FK.FKCol.FieldName, TableName),
        getRawDataByLang(TableName, FBirim.FieldName)
      ]) +
      'WHERE 1=1 ' + pFilter;
      Open;

      FreeListContent();
      List.Clear;
      while NOT EOF do
      begin
        Self.Id.Value := FormatedVariantVal(Self.Id);

        FBolumID.Value := FormatedVariantVal(FBolumID);
        FBolumID.FK.FKCol.Value := FormatedVariantVal(FBolumID.FK.FKCol);
        FBirim.Value := FormatedVariantVal(FBirim);

        List.Add(Self.Clone());

        Next;
      end;
      Close;
    end;
  end;
end;

procedure TAyarPrsBirim.Insert(out pID: Integer; pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptAddRecord, pPermissionControl) then
  begin
    {$IFDEF CRUD_MODE_SP}
      SpInsert.ExecProc;
      pID := SpInsert.ParamByName('result').AsInteger;
    {$ELSE IFDEF CRUD_MODE_PURE_SQL}
      with QueryOfInsert do
      begin
        Close;
        SQL.Clear;
        SQL.Text := Database.GetSQLInsertCmd(TableName, QUERY_PARAM_CHAR, [
          FBolumID.FieldName,
          FBirim.FieldName
        ]);

        NewParamForQuery(QueryOfInsert, FBolumID);
        NewParamForQuery(QueryOfInsert, FBirim);

        Open;
        if (Fields.Count > 0) and (not Fields.FieldByName(Self.Id.FieldName).IsNull) then
          pID := Fields.FieldByName(Self.Id.FieldName).AsInteger
        else
          pID := 0;

        EmptyDataSet;
        Close;
      end;
    {$ENDIF}
    Self.Notify;
  end;
end;

procedure TAyarPrsBirim.Update(pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptUpdate, pPermissionControl) then
  begin
    {$IFDEF CRUD_MODE_SP}
      SpUpdate.ExecProc;
    {$ELSE IFDEF CRUD_MODE_PURE_SQL}
      with QueryOfUpdate do
      begin
        Close;
        SQL.Clear;
        SQL.Text := Database.GetSQLUpdateCmd(TableName, QUERY_PARAM_CHAR, [
          FBolumID.FieldName,
          FBirim.FieldName
        ]);

        NewParamForQuery(QueryOfUpdate, FBolumID);
        NewParamForQuery(QueryOfUpdate, FBirim);

        NewParamForQuery(QueryOfUpdate, Id);

        ExecSQL;
        Close;
      end;
    {$ENDIF}
    Self.Notify;
  end;
end;

function TAyarPrsBirim.Clone():TTable;
begin
  Result := TAyarPrsBirim.Create(Database);

  Self.Id.Clone(TAyarPrsBirim(Result).Id);

  FBolumID.Clone(TAyarPrsBirim(Result).FBolumID);
  FBirim.Clone(TAyarPrsBirim(Result).FBirim);
end;

end.
