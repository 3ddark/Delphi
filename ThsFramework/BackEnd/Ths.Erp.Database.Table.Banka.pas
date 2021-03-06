unit Ths.Erp.Database.Table.Banka;

interface

{$I ThsERP.inc}

uses
  SysUtils, Classes, Dialogs, Forms, Windows, Controls, Types, DateUtils,
  FireDAC.Stan.Param, System.Variants, Data.DB,
  Ths.Erp.Database,
  Ths.Erp.Database.Table;

type
  TBanka = class(TTable)
  private
    FAdi: TFieldDB;
    FSwiftKodu: TFieldDB;
    FIsActive: TFieldDB;
  protected
  published
    constructor Create(OwnerDatabase:TDatabase);override;
  public
    procedure SelectToDatasource(pFilter: string; pPermissionControl: Boolean=True); override;
    procedure SelectToList(pFilter: string; pLock: Boolean; pPermissionControl: Boolean=True); override;
    procedure Insert(out pID: Integer; pPermissionControl: Boolean=True); override;
    procedure Update(pPermissionControl: Boolean=True); override;

    function Clone():TTable;override;

    Property Adi: TFieldDB read FAdi write FAdi;
    Property SwiftKodu: TFieldDB read FSwiftKodu write FSwiftKodu;
    Property IsActive: TFieldDB read FIsActive write FIsActive;
  end;

implementation

uses
  Ths.Erp.Constants,
  Ths.Erp.Database.Singleton;

constructor TBanka.Create(OwnerDatabase:TDatabase);
begin
  inherited Create(OwnerDatabase);
  TableName := 'banka';
  SourceCode := '1010';

  FAdi := TFieldDB.Create('adi', ftString, '');
  FSwiftKodu := TFieldDB.Create('swift_kodu', ftString, '');
  FIsActive := TFieldDB.Create('is_active', ftBoolean, 0);
end;

procedure TBanka.SelectToDatasource(pFilter: string; pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptRead, pPermissionControl) then
  begin
    with QueryOfDS do
    begin
      Close;
      SQL.Clear;
      SQL.Text := Database.GetSQLSelectCmd(TableName, [
        TableName + '.' + Self.Id.FieldName,
        TableName + '.' + FAdi.FieldName,
        TableName + '.' + FSwiftKodu.FieldName,
        TableName + '.' + FIsActive.FieldName
      ]) +
      'WHERE 1=1 ' + pFilter;
      Open;
      Active := True;

      Self.DataSource.DataSet.FindField(Self.Id.FieldName).DisplayLabel := 'ID';
      Self.DataSource.DataSet.FindField(FAdi.FieldName).DisplayLabel := 'Ad�';
      Self.DataSource.DataSet.FindField(FSwiftKodu.FieldName).DisplayLabel := 'Swift Kodu';
      Self.DataSource.DataSet.FindField(FIsActive.FieldName).DisplayLabel := 'Aktif?';
    end;
  end;
end;

procedure TBanka.SelectToList(pFilter: string; pLock: Boolean; pPermissionControl: Boolean=True);
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
        TableName + '.' + FAdi.FieldName,
        TableName + '.' + FSwiftKodu.FieldName,
        TableName + '.' + FIsActive.FieldName
      ]) +
      'WHERE 1=1 ' + pFilter;
      Open;

      FreeListContent();
      List.Clear;
      while NOT EOF do
      begin
        Self.Id.Value := FormatedVariantVal(FieldByName(Self.Id.FieldName).DataType, FieldByName(Self.Id.FieldName).Value);

        FAdi.Value := FormatedVariantVal(FieldByName(FAdi.FieldName).DataType, FieldByName(FAdi.FieldName).Value);
        FSwiftKodu.Value := FormatedVariantVal(FieldByName(FSwiftKodu.FieldName).DataType, FieldByName(FSwiftKodu.FieldName).Value);
        FIsActive.Value := FormatedVariantVal(FieldByName(FIsActive.FieldName).DataType, FieldByName(FIsActive.FieldName).Value);

        List.Add(Self.Clone());

        Next;
      end;
      Close;
    end;
  end;
end;

procedure TBanka.Insert(out pID: Integer; pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptAddRecord, pPermissionControl) then
  begin
    with QueryOfInsert do
    begin
      Close;
      SQL.Clear;
      SQL.Text := Database.GetSQLInsertCmd(TableName, QUERY_PARAM_CHAR, [
        FAdi.FieldName,
        FSwiftKodu.FieldName,
        FIsActive.FieldName
      ]);

      NewParamForQuery(QueryOfInsert, FAdi);
      NewParamForQuery(QueryOfInsert, FSwiftKodu);
      NewParamForQuery(QueryOfInsert, FIsActive);

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

procedure TBanka.Update(pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptUpdate, pPermissionControl) then
  begin
    with QueryOfUpdate do
    begin
      Close;
      SQL.Clear;
      SQL.Text := Database.GetSQLUpdateCmd(TableName, QUERY_PARAM_CHAR, [
        FAdi.FieldName,
        FSwiftKodu.FieldName,
        FIsActive.FieldName
      ]);

      NewParamForQuery(QueryOfUpdate, FAdi);
      NewParamForQuery(QueryOfUpdate, FSwiftKodu);
      NewParamForQuery(QueryOfUpdate, FIsActive);

      NewParamForQuery(QueryOfUpdate, Id);

      ExecSQL;
      Close;
    end;
    Self.notify;
  end;
end;

function TBanka.Clone():TTable;
begin
  Result := TBanka.Create(Database);

  Self.Id.Clone(TBanka(Result).Id);

  FAdi.Clone(TBanka(Result).FAdi);
  FSwiftKodu.Clone(TBanka(Result).FSwiftKodu);
  FIsActive.Clone(TBanka(Result).FIsActive);
end;

end.
