unit Ths.Erp.Database.Table.Bolge;

interface

uses
  SysUtils, Classes, Dialogs, Forms, Windows, Controls, Types, DateUtils,
  FireDAC.Stan.Param, System.Variants, Data.DB,
  Ths.Erp.Database,
  Ths.Erp.Database.Table,
  Ths.Erp.Database.Table.Field,

  Ths.Erp.Database.Table.BolgeTuru
  ;

type
  TBolge = class(TTable)
  private
    FBolgeTuruID: TFieldDB;
    FBolgeTuru: TFieldDB;
    FBolgeAdi: TFieldDB;
  protected
    vBolgeTuru: TBolgeTuru;
  published
    constructor Create(OwnerDatabase:TDatabase);override;
  public
    procedure SelectToDatasource(pFilter: string; pPermissionControl: Boolean=True); override;
    procedure SelectToList(pFilter: string; pLock: Boolean; pPermissionControl: Boolean=True); override;
    procedure Insert(out pID: Integer; pPermissionControl: Boolean=True); override;
    procedure Update(pPermissionControl: Boolean=True); override;

    procedure Clear();override;
    function Clone():TTable;override;

    Property BolgeTuruID: TFieldDB read FBolgeTuruID write FBolgeTuruID;
    Property BolgeTuru: TFieldDB read FBolgeTuru write FBolgeTuru;
    Property BolgeAdi: TFieldDB read FBolgeAdi write FBolgeAdi;
  end;

implementation

uses
  Ths.Erp.Constants,
  Ths.Erp.Database.Singleton;

constructor TBolge.Create(OwnerDatabase:TDatabase);
begin
  inherited Create(OwnerDatabase);
  TableName := 'bolge';
  SourceCode := '1000';

  FBolgeTuruID := TFieldDB.Create('bolge_turu_id', ftInteger, 0);
  FBolgeTuru := TFieldDB.Create('bolge_turu', ftString, '');
  FBolgeAdi := TFieldDB.Create('bolge_adi', ftString, '');
end;

procedure TBolge.SelectToDatasource(pFilter: string; pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptRead, pPermissionControl) then
  begin
    with QueryOfDS do
    begin
      vBolgeTuru := TBolgeTuru.Create(Database);
      try
        Close;
        SQL.Clear;
        SQL.Text := Database.GetSQLSelectCmd(TableName, [
          TableName + '.' + Self.Id.FieldName,
          TableName + '.' + FBolgeTuruID.FieldName,
          ColumnFromIDCol(vBolgeTuru.Tur.FieldName, vBolgeTuru.TableName, FBolgeTuruID.FieldName, FBolgeTuru.FieldName, TableName),
          getRawDataByLang(TableName, FBolgeAdi.FieldName)
        ]) +
        'WHERE 1=1 ' + pFilter;
        Open;
        Active := True;

        Self.DataSource.DataSet.FindField(Self.Id.FieldName).DisplayLabel := 'ID';
        Self.DataSource.DataSet.FindField(FBolgeTuruID.FieldName).DisplayLabel := 'B�lge T�r� ID';
        Self.DataSource.DataSet.FindField(FBolgeTuru.FieldName).DisplayLabel := 'B�lge T�r�';
        Self.DataSource.DataSet.FindField(FBolgeAdi.FieldName).DisplayLabel := 'B�lge Ad�';
      finally
        vBolgeTuru.Free;
      end;
    end;
  end;
end;

procedure TBolge.SelectToList(pFilter: string; pLock: Boolean; pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptRead, pPermissionControl) then
  begin
    if (pLock) then
      pFilter := pFilter + ' FOR UPDATE NOWAIT; ';

    with QueryOfList do
    begin
      vBolgeTuru := TBolgeTuru.Create(Database);
      try
        Close;
        SQL.Text := Database.GetSQLSelectCmd(TableName, [
          TableName + '.' + Self.Id.FieldName,
          TableName + '.' + FBolgeTuruID.FieldName,
          ColumnFromIDCol(vBolgeTuru.Tur.FieldName, vBolgeTuru.TableName, FBolgeTuruID.FieldName, FBolgeTuru.FieldName, TableName),
          getRawDataByLang(TableName, FBolgeAdi.FieldName)
        ]) +
        'WHERE 1=1 ' + pFilter;
        Open;

        FreeListContent();
        List.Clear;
        while NOT EOF do
        begin
          Self.Id.Value := FormatedVariantVal(FieldByName(Self.Id.FieldName).DataType, FieldByName(Self.Id.FieldName).Value);

          FBolgeTuruID.Value := FormatedVariantVal(FieldByName(FBolgeTuruID.FieldName).DataType, FieldByName(FBolgeTuruID.FieldName).Value);
          FBolgeTuru.Value := FormatedVariantVal(FieldByName(FBolgeTuru.FieldName).DataType, FieldByName(FBolgeTuru.FieldName).Value);
          FBolgeAdi.Value := FormatedVariantVal(FieldByName(FBolgeAdi.FieldName).DataType, FieldByName(FBolgeAdi.FieldName).Value);

          List.Add(Self.Clone());

          Next;
        end;
        Close;
      finally
        vBolgeTuru.Free;
      end;
    end;
  end;
end;

procedure TBolge.Insert(out pID: Integer; pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptAddRecord, pPermissionControl) then
  begin
    with QueryOfInsert do
    begin
      Close;
      SQL.Clear;
      SQL.Text := Database.GetSQLInsertCmd(TableName, QUERY_PARAM_CHAR, [
        FBolgeTuruID.FieldName,
        FBolgeAdi.FieldName
      ]);

      NewParamForQuery(QueryOfInsert, FBolgeTuruID);
      NewParamForQuery(QueryOfInsert, FBolgeAdi);

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

procedure TBolge.Update(pPermissionControl: Boolean=True);
begin
  if IsAuthorized(ptUpdate, pPermissionControl) then
  begin
    with QueryOfUpdate do
    begin
      Close;
      SQL.Clear;
      SQL.Text := Database.GetSQLUpdateCmd(TableName, QUERY_PARAM_CHAR, [
        FBolgeTuruID.FieldName,
        FBolgeAdi.FieldName
      ]);

      NewParamForQuery(QueryOfUpdate, FBolgeTuruID);
      NewParamForQuery(QueryOfUpdate, FBolgeAdi);

      NewParamForQuery(QueryOfUpdate, Id);

      ExecSQL;
      Close;
    end;
    Self.notify;
  end;
end;

procedure TBolge.Clear();
begin
  inherited;

  FBolgeTuruID.Value := 0;
  FBolgeTuru.Value := '';
  FBolgeAdi.Value := '';
end;

function TBolge.Clone():TTable;
begin
  Result := TBolge.Create(Database);

  Self.Id.Clone(TBolge(Result).Id);

  FBolgeTuruID.Clone(TBolge(Result).FBolgeTuruID);
  FBolgeTuru.Clone(TBolge(Result).FBolgeTuru);
  FBolgeAdi.Clone(TBolge(Result).FBolgeAdi);
end;

end.
