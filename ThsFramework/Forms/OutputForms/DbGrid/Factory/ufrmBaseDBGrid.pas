unit ufrmBaseDBGrid;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants, Vcl.Menus, System.Types,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.ComCtrls, Math, System.StrUtils, Vcl.Grids,
  Vcl.DBGrids, System.UITypes, Vcl.AppEvnts, Vcl.StdCtrls, Vcl.Samples.Spin,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList,
  ufrmBase,
  ufrmBaseOutput,
  Ths.Erp.Database.Singleton,
  Ths.Erp.Database.Table.SysGridColWidth,
  Ths.Erp.Constants;

type
  TSortType = (stNone, stAsc, stDesc);

type
  THackDBGrid = class(TCustomDBGrid)
  protected
  end;

  TColColor = record
    FieldName: string;
    MinValue: Double;
    MinColor: Integer;
    MaxValue: Double;
    MaxColor: Integer;
    EqualColor: Integer;
  end;

  TColPercent = record
    FieldName: string;
    MaxValue: Double;
    ColorBar: Integer;
    ColorBarBack: Integer;
    ColorBarText: Integer;
    ColorBarTextActive: Integer;
  end;

type
  TValLowHigh = (vlLow, vlHigh, vlEqual);

type
  TfrmBaseDBGrid = class(TfrmBaseOutput)
    pnlButtons: TPanel;
    flwpnlLeft: TFlowPanel;
    flwpnlRight: TFlowPanel;
    dbgrdBase: TDBGrid;
    mniExportExcel: TMenuItem;
    mniPreview: TMenuItem;
    mniPrint: TMenuItem;
    mniSeperator1: TMenuItem;
    mniSeperator2: TMenuItem;
    mniCancelSort: TMenuItem;
    imgFilterRemove: TImage;
    btnAddNew: TButton;
    procedure FormCreate(Sender: TObject);override;
    procedure FormShow(Sender: TObject);override;
    procedure mniPreviewClick(Sender: TObject);
    procedure mniExportExcelClick(Sender: TObject);
    procedure mniPrintClick(Sender: TObject);
    procedure btnAddNewClick(Sender: TObject);
    procedure FormResize(Sender: TObject);override;
    procedure ResizeForm();virtual;
    function ResizeDBGrid(Sender: TObject):Integer;virtual;
    procedure btnSpinUpClick(Sender: TObject);override;
    procedure btnSpinDownClick(Sender: TObject);override;
    procedure dbgrdBaseCellClick(Column: TColumn);
    procedure dbgrdBaseDblClick(Sender: TObject);
    procedure dbgrdBaseKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);virtual;
    procedure DataSourceDataChange(Sender: TObject; Field: TField);virtual;
    procedure FormDestroy(Sender: TObject);override;
    procedure FormPaint(Sender: TObject);override;
    procedure FormKeyPress(Sender: TObject; var Key: Char);override;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);override;
    procedure dbgrdBaseDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrdBaseColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure dbgrdBaseTitleClick(Column: TColumn);
    procedure mniCancelSortClick(Sender: TObject);
    procedure dbgrdBaseDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure dbgrdBaseMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgrdBaseMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgrdBaseMouseLeave(Sender: TObject);
    procedure dbgrdBaseExit(Sender: TObject);
    procedure imgFilterRemoveClick(Sender: TObject);
    procedure dbgrdBaseKeyPress(Sender: TObject; var Key: Char);
  private
    FarRenkliYuzdeColNames: TArray<TColPercent>;
    FYuzdeMaxVal: Integer;
    FColorHigh: TColor;
    FColorLow: TColor;
    FColorEqual: TColor;

    FarRenkliRakamColNames: TArray<TColColor>;
    FColorBar: TColor;
    FColorBarBack: TColor;
    FColorBarText: TColor;
    FColorBarTextActive: TColor;

    function IsYuzdeCizimAlaniVar(pFieldName: string): Boolean;
    function IsRenkliRakamVar(pFieldName: string): Boolean;
  protected
    FQueryDefaultFilter, FQueryDefaultOrder, FFilterGrid: String;

    FShowHideColumns: Boolean;

    function CreateInputForm(pFormMode: TInputFormMod):TForm;virtual;
  public
    property arRenkliYuzdeColNames: TArray<TColPercent> read FarRenkliYuzdeColNames write FarRenkliYuzdeColNames;
    property YuzdeMaxVal: Integer read FYuzdeMaxVal write FYuzdeMaxVal;
    property ColorBar: TColor read FColorBar write FColorBar;
    property ColorBarBack: TColor read FColorBarBack write FColorBarBack;
    property ColorBarText: TColor read FColorBarText write FColorBarText;
    property ColorBarTextActive: TColor read FColorBarTextActive write FColorBarTextActive;

    property arRenkliRakamColNames: TArray<TColColor> read FarRenkliRakamColNames write FarRenkliRakamColNames;
    property ColorHigh: TColor read FColorHigh write FColorHigh;
    property ColorLow: TColor read FColorLow write FColorLow;
    property ColorEqual: TColor read FColorEqual write FColorEqual;
    function GetLowHighEqual(pField: TField; pDefaultColor: TColor): Integer;virtual;
    function GetPercentMaxVal(pField: TField): Double;virtual;

    property ShowHideColumns: Boolean read FShowHideColumns write FShowHideColumns;
    property QueryDefaultFilter: string read FQueryDefaultFilter write FQueryDefaultFilter;
    property QueryDefaultOrder: string read FQueryDefaultOrder write FQueryDefaultOrder;
    property FilterGrid: string read FFilterGrid write FFilterGrid;

    procedure RefreshDataFirst();
    procedure RefreshData();
    procedure RefreshGrid();virtual;

    procedure ShowInputForm(pFormType: TInputFormMod); virtual;
    procedure SetSelectedItem();virtual;
    procedure MoveUp();virtual;
    procedure MoveDown();virtual;

    function GetFieldByFieldName(pFieldName: string; pGridColumns: TDBGridColumns): TField;
    procedure SetColWidth(pFieldName: string; pWidth: Integer);
    procedure SetColVisible(pFieldName: string; pVisible: Boolean);

    procedure drawTriangleInRect(r: TRect; st: TSortType; al: TAlignment);
  published
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);override;
  end;

implementation

uses
  Ths.Erp.Database,
  Ths.Erp.SpecialFunctions, ufrmFilterDBGrid, Ths.Erp.Database.Table.SysGridColColor, Ths.Erp.Database.Table.SysGridColPercent;

{$R *.dfm}

procedure TfrmBaseDBGrid.drawTriangleInRect(r: TRect; st: TSortType; al: TAlignment);
const
  OFFSET=2;
var
  goLeft: integer;
begin
  //if IsRightToLeft then
  begin
    if al = taLeftJustify then
      goLeft := 0
    else
      goLeft := r.Right - r.Left - 17;
  end;

  // draw triangle
  dbgrdBase.Canvas.Brush.Color := clRed;
  dbgrdBase.Canvas.Pen.Color := clRed;
  if st = stAsc then
    dbgrdBase.Canvas.Polygon([point(r.Right - 2 - goLeft, r.top + 10),
      point(r.Right - 7 - goLeft, r.top + 5), point(r.Right - 12 - goLeft, r.top + 10)])

  else if st = stDesc then
    dbgrdBase.Canvas.Polygon([point(r.Right - 2 - goLeft, r.top + 5),
      point(r.Right - 7 - goLeft, r.top + 10), point(r.Right - 12 - goLeft, r.top + 5)]);
end;

procedure TfrmBaseDBGrid.btnAddNewClick(Sender: TObject);
begin
  ShowInputForm(ifmNewRecord);
end;

procedure TfrmBaseDBGrid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  //
end;

procedure TfrmBaseDBGrid.FormCreate(Sender: TObject);
begin
  inherited;
  dbgrdBase.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack];

  FShowHideColumns := False;

  dbgrdBase.DataSource := Table.DataSource;

  btnAddNew.Visible := True;
  btnAddNew.Caption := TSingletonDB.GetInstance.GetTextFromLang('ADD RECORD', TSingletonDB.GetInstance.LangFramework.ButonEkle);


  //ilk a��l��ta veri taban�ndan kay�tlar� getirmek i�in RefreshDataFirst �a��r
  //daha sonraki i�lemlerde sadece query refresh ile update yapaca��z
  //buda i�lemlerin hazlanmas� i�in gerekli bir ad�m.
  //Her zaman db den select yap�nca fazla kolon ve kay�t oldu�u durumlarda a��r� yava�lamna oluyor
  RefreshDataFirst;

  mniCancelSort.Visible := False;

  PostMessage(self.Handle, WM_AFTER_CREATE, 0, 0);
end;

procedure TfrmBaseDBGrid.FormDestroy(Sender: TObject);
begin
  SetLength(FarRenkliYuzdeColNames, 0);
  SetLength(FarRenkliRakamColNames, 0);

  while dbgrdBase.Columns.Count > 0 do
    dbgrdBase.Columns[dbgrdBase.Columns.Count-1].Free;

  inherited;
end;

procedure TfrmBaseDBGrid.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then //Enter (Return)
  begin
    if (dbgrdBase.Focused) then
    begin
      Key := 0;
      mniPreview.Click;
    end;
  end
  else
  //CTRL + SHIFT + ALT + T show all columns
  if  (Key = Ord('T')) then
  begin
    if Shift = [ssCtrl, ssShift, ssAlt] then
    begin
      Key := 0;
      FShowHideColumns := not FShowHideColumns;
      RefreshGrid;
      ResizeForm;
    end;
  end
  else
  //CTRL + F key combination show Filter form
  if (Key = Ord('F')) then
  begin
    if Shift = [ssCtrl] then
    begin
      Key := 0;
      TfrmFilterDBGrid.Create(Application, Self).ShowModal;
      if FilterGrid <> '' then
      begin
        RefreshData;
      end;
    end;
  end
  else
  //F7 Key add new record
  if Key = VK_F7 then
  begin
    Key := 0;
    if btnAddNew.Visible and btnAddNew.Enabled then
      btnAddNew.Click;
  end
  else
    inherited;
end;

procedure TfrmBaseDBGrid.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Char(VK_RETURN)) then //Enter (Return)
    Key := #0;

  inherited;
end;

procedure TfrmBaseDBGrid.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  //
end;

procedure TfrmBaseDBGrid.FormPaint(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmBaseDBGrid.btnSpinDownClick(Sender: TObject);
begin
  MoveDown();
end;

procedure TfrmBaseDBGrid.btnSpinUpClick(Sender: TObject);
begin
  MoveUp();
end;

function TfrmBaseDBGrid.CreateInputForm(pFormMode: TInputFormMod): TForm;
begin
  Result := nil;
end;

procedure TfrmBaseDBGrid.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  stbBase.Panels.Items[0].Text := {'Count: ' + }Table.DataSource.DataSet.RecordCount.ToString;
end;

procedure TfrmBaseDBGrid.dbgrdBaseCellClick(Column: TColumn);
begin
  SetSelectedItem();
end;

procedure TfrmBaseDBGrid.dbgrdBaseColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
begin
  inherited;
  //
end;

procedure TfrmBaseDBGrid.dbgrdBaseDblClick(Sender: TObject);
begin
  //if (TCustomDBGridCracker(TDBGrid( Sender)).DataLink.ActiveRecord <> 0) then
  if (Table.DataSource.DataSet.RecordCount <> 0) then
  begin
    SetSelectedItem();
    ShowInputForm(ifmRewiev);
  end;
end;

procedure TfrmBaseDBGrid.dbgrdBaseDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
const
  CtrlState: array[Boolean] of integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED) ;
  sEMPTY = '';
  chPERCENT = '%';
  SPACE_TO_CENTER_CELLTEXT = 0;
  arrow_size = 4;

var
  nValue, nWidth1, nLeft2: Integer;
  clActualPenColor, clActualBrushColor, clActualFontColor: TColor;
  bEmptyDS: Boolean;
  DrawRect: TRect;
  sValue: string;

  Bmp: TBitmap;
  AState: TGridDrawState;
begin
  AState := State;
  //Sat�r� renklendir.
  if THackDBGrid(dbgrdBase).DataLink.ActiveRecord = THackDBGrid(dbgrdBase).Row - 1 then
    dbgrdBase.Canvas.Brush.Color := $00C4ABCD
  else if dbgrdBase.DataSource.DataSet.RecNo mod 2 = 0 then
    dbgrdBase.Canvas.Brush.Color := $00CAEDC0
  else if dbgrdBase.DataSource.DataSet.RecNo mod 2 = 1 then
    dbgrdBase.Canvas.Brush.Color := $00DFF4D9;

  dbgrdBase.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  //boolean tipler i�in checkbox �iz
  if (Column.Field.DataType = ftBoolean) then
  begin
    dbgrdBase.Canvas.FillRect(Rect);

    dbgrdBase.Canvas.FillRect(Rect);
    if (VarIsNull(Column.Field.Value)) then
      DrawFrameControl(dbgrdBase.Canvas.Handle, Rect, DFC_BUTTON, DFCS_BUTTONCHECK or DFCS_INACTIVE)
    else
      DrawFrameControl(dbgrdBase.Canvas.Handle, Rect, DFC_BUTTON, CtrlState[Column.Field.AsBoolean]);
  end
  else
  if Column.Field is TGraphicField then
  begin
    Bmp := TBitmap.Create;
    try
      Bmp.Assign(Column.Field);
      dbgrdBase.Canvas.StretchDraw(Rect, Bmp);
    finally
      Bmp.Free;
    end
  end
  else
  begin
    if IsYuzdeCizimAlaniVar(Column.FieldName) then
    begin
      begin
        bEmptyDS := ((TDBGrid(Sender).DataSource.DataSet.EoF) and (TDBGrid(Sender).DataSource.DataSet.Bof));

        if (Column.Field.IsNull) then
        begin
          nValue := -1;
          sValue := sEMPTY;
        end
        else
        begin
          nValue := Column.Field.AsInteger;
          sValue := IntToStr(nValue);// + ' ' + chPERCENT;
        end;

        DrawRect := Rect;
        InflateRect(DrawRect, -1, -1);

        nWidth1 := (((DrawRect.Right - DrawRect.Left) * nValue) DIV Trunc(GetPercentMaxVal(Column.Field)) );

        clActualPenColor := TDBGrid(Sender).Canvas.Pen.Color;
        clActualBrushColor := TDBGrid(Sender).Canvas.Brush.Color;
        clActualFontColor := TDBGrid(Sender).Canvas.Font.Color;

        TDBGrid(Sender).Canvas.Pen.Color := clBlack;
        TDBGrid(Sender).Canvas.Brush.Color := ColorBarBack;
        if THackDBGrid(dbgrdBase).DataLink.ActiveRecord = THackDBGrid(dbgrdBase).Row - 1 then
          TDBGrid(Sender).Canvas.Font.Color := FColorBarTextActive// clActualFontColor
        else
          TDBGrid(Sender).Canvas.Font.Color := FColorBarText;

        TDBGrid(Sender).Canvas.Rectangle(DrawRect);

        if (nValue > 0) then
        begin
          TDBGrid(Sender).Canvas.Pen.Color := ColorBar;
          TDBGrid(Sender).Canvas.Brush.Color := ColorBar;
          DrawRect.Right := DrawRect.Left + nWidth1;
          InflateRect(DrawRect, -1, -1);
          TDBGrid(Sender).Canvas.Rectangle(DrawRect);
        end;

        if not (bEmptyDS) then
        begin
          DrawRect := Rect;
          InflateRect(DrawRect, -2, -2);
          TDBGrid(Sender).Canvas.Brush.Style := bsClear;
          nLeft2 := DrawRect.Left + (DrawRect.Right - DrawRect.Left) shr 1 -
                    (TDBGrid(Sender).Canvas.TextWidth(sValue) shr 1);
          TDBGrid(Sender).Canvas.TextRect(DrawRect, nLeft2, DrawRect.Top + SPACE_TO_CENTER_CELLTEXT, sValue);
        end;

        TDBGrid(Sender).Canvas.Pen.Color := clActualPenColor;
        TDBGrid(Sender).Canvas.Brush.Color := clActualBrushColor;
      end;
    end
    else
    if IsRenkliRakamVar(Column.FieldName) then
    begin
      clActualBrushColor := TDBGrid(Sender).Canvas.Brush.Color;

      TDBGrid(Sender).Canvas.Brush.Color := GetLowHighEqual(Column.Field, TDBGrid(Sender).Canvas.Brush.Color);

      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
      TDBGrid(Sender).Canvas.Brush.Color := clActualBrushColor;
    end;
  end;


  if  (Column.Visible)
  and (Pos(Column.FieldName, TFDQuery(dbgrdBase.DataSource.DataSet).IndexFieldNames) > 0)
  then
  begin
    sValue := '';
    if Pos(Column.FieldName + ':A', TFDQuery(dbgrdBase.DataSource.DataSet).IndexFieldNames) > 0 then
      sValue := MidStr(
        TFDQuery(dbgrdBase.DataSource.DataSet).IndexFieldNames,
        Pos(Column.FieldName + ':A', TFDQuery(dbgrdBase.DataSource.DataSet).IndexFieldNames),
        Length(Column.FieldName + ':A'))
    else if Pos(Column.FieldName + ':D', TFDQuery(dbgrdBase.DataSource.DataSet).IndexFieldNames) > 0 then
      sValue := MidStr(
        TFDQuery(dbgrdBase.DataSource.DataSet).IndexFieldNames,
        Pos(Column.FieldName + ':D', TFDQuery(dbgrdBase.DataSource.DataSet).IndexFieldNames),
        Length(Column.FieldName + ':D'));

    if Pos(':A', sValue) > 0 then //yukar� y�ndeki ok ASC
      drawTriangleInRect(THackDBGrid(dbgrdBase).CellRect(DataCol+1, 0), stAsc, taLeftJustify)
    else if Pos(':D', sValue) > 0 then  //a�a�� y�ndeki ok DESC
      drawTriangleInRect(THackDBGrid(dbgrdBase).CellRect(DataCol+1, 0), stDesc, taLeftJustify);
  end;

end;

procedure TfrmBaseDBGrid.dbgrdBaseDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  //
end;

procedure TfrmBaseDBGrid.dbgrdBaseExit(Sender: TObject);
begin
  inherited;
  dbgrdBase.Repaint;
end;

procedure TfrmBaseDBGrid.dbgrdBaseKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  //CTRL + DELETE konbinasyonu ile kay�tlar� silmeyi engellemek i�in yap�ld�. Aksi halde kontrol kay�t silme i�lemi yap�labilir.
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    Key := 0;
end;

procedure TfrmBaseDBGrid.dbgrdBaseKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //
end;

procedure TfrmBaseDBGrid.dbgrdBaseMouseLeave(Sender: TObject);
begin
  inherited;
  dbgrdBase.Repaint;
end;

procedure TfrmBaseDBGrid.dbgrdBaseMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
  dbgrdBase.Repaint;
end;

procedure TfrmBaseDBGrid.dbgrdBaseMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  dbgrdBase.Repaint;
end;

procedure TfrmBaseDBGrid.dbgrdBaseTitleClick(Column: TColumn);
var
  sl: TStringList;
  sOrderList: string;
  bOrderedColumn, bIsCTRLKeyPress: Boolean;
  nIndex: Integer;
const
  arrow_size = 4;
begin
  bOrderedColumn := False;
  bIsCTRLKeyPress := False;
  sl := TStringList.Create;
  try
    with TFDQuery(dbgrdBase.DataSource.DataSet) do
    begin
      if TSpecialFunctions.isCtrlDown then
        bIsCTRLKeyPress := True;

      sl.Delimiter := ';';
      if IndexFieldNames <> '' then
        sl.DelimitedText := IndexFieldNames;

      if bIsCTRLKeyPress then
      begin
        //CTRL tu�una bas�lm��sa
        for nIndex := 0 to sl.Count-1 do
          if (Column.FieldName + ':A' = sl.Strings[nIndex]) or (Column.FieldName + ':D' = sl.Strings[nIndex]) then
            bOrderedColumn := True;

        if bOrderedColumn then
        begin
          //listede zaten varsa ASC DESC de�i�imi yap
          for nIndex := 0 to sl.Count-1 do
          begin
            if (Column.FieldName + ':A' = sl.Strings[nIndex]) then
              sl.Strings[nIndex] := Column.FieldName + ':D'
            else if (Column.FieldName + ':D' = sl.Strings[nIndex]) then
              sl.Strings[nIndex] := Column.FieldName + ':A';
          end;
        end
        else
        begin
          //listede yoksa direkt ASC olarak ekle
          if sl.Count > 0 then
            sl.Add(Column.FieldName + ':A');
        end;
      end
      else
      begin
        //CTRL tu�una bas�lmam��sa hepsini sil ve direkt olarak ekle
        if sl.Count = 0 then
          sOrderList := Column.FieldName + ':A'
        else
        begin
          for nIndex := 0 to sl.Count-1 do
            if (Column.FieldName + ':A' = sl.Strings[nIndex]) or (Column.FieldName + ':D' = sl.Strings[nIndex]) then
              bOrderedColumn := True;

          if bOrderedColumn then
          begin
            for nIndex := 0 to sl.Count-1 do
            begin
              if (Column.FieldName + ':A' = sl.Strings[nIndex]) then
                sOrderList := Column.FieldName + ':D'
              else if (Column.FieldName + ':D' = sl.Strings[nIndex]) then
                sOrderList := Column.FieldName + ':A';
            end;
          end
          else
            sOrderList := Column.FieldName + ':A';
        end;
        sl.Clear;
        sl.Add(sOrderList);
      end;

      sOrderList := '';

      for nIndex := 0 to sl.Count-1 do
      begin
        sOrderList := sOrderList + sl.Strings[nIndex] + ';';
        if nIndex = sl.Count-1 then
          sOrderList := LeftStr(sOrderList, Length(sOrderList)-1);
      end;

      if sOrderList <> '' then
        mniCancelSort.Visible := True;

      IndexFieldNames := sOrderList;
    end;

    THackDBGrid(dbgrdBase).InvalidateTitles;

  finally
    sl.Free;
  end;
end;

procedure TfrmBaseDBGrid.FormResize(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmBaseDBGrid.FormShow(Sender: TObject);
begin
  inherited;
  //RefreshDataFirst;

  if Table.IsAuthorized(ptAddRecord, True, False) then
  begin
    btnAddNew.Visible := True;
    btnAddNew.Enabled := True;
  end
  else
  begin
    btnAddNew.Enabled := False;
  end;

  ResizeForm();

  Self.Caption := TSingletonDB.GetInstance.GetTextFromLang(Self.Caption, 'FormCaption.Output.' + Table.TableName);

  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

function TfrmBaseDBGrid.GetFieldByFieldName(pFieldName: string; pGridColumns: TDBGridColumns): TField;
var
  nIndex: Integer;
begin
  Result := nil;
  if pFieldName <> '' then
  begin
    for nIndex := 0 to pGridColumns.Count-1 do
      if pGridColumns[nIndex].FieldName = pFieldName then
        Result := pGridColumns[nIndex].Field;
  end;
end;

function TfrmBaseDBGrid.GetLowHighEqual(pField: TField; pDefaultColor: TColor): Integer;
var
  n1: Integer;
begin
  Result := pDefaultColor;
  for n1 := 0 to Length(arRenkliRakamColNames) do
  begin
    if pField.FieldName = TColColor(arRenkliRakamColNames[n1]).FieldName then
    begin
      if pField.AsInteger < TColColor(arRenkliRakamColNames[n1]).MinValue then
        Result := TColColor(arRenkliRakamColNames[n1]).MinColor
      else if pField.AsInteger > TColColor(arRenkliRakamColNames[n1]).MaxValue then
        Result := TColColor(arRenkliRakamColNames[n1]).MaxColor
      else if pField.AsInteger = TColColor(arRenkliRakamColNames[n1]).MaxValue then
        Result := TColColor(arRenkliRakamColNames[n1]).EqualColor;
      Break;
    end;
  end;
end;

function TfrmBaseDBGrid.GetPercentMaxVal(pField: TField): Double;
var
  n1: Integer;
begin
  Result := 1;
  for n1 := 0 to Length(arRenkliYuzdeColNames) do
  begin
    if pField.FieldName = TColPercent(arRenkliYuzdeColNames[n1]).FieldName then
    begin
      Result := TColPercent(arRenkliYuzdeColNames[n1]).MaxValue;
      ColorBar := TColPercent(arRenkliYuzdeColNames[n1]).ColorBar;
      ColorBarBack := TColPercent(arRenkliYuzdeColNames[n1]).ColorBarBack;
      ColorBarText := TColPercent(arRenkliYuzdeColNames[n1]).ColorBarText;
      ColorBarTextActive := TColPercent(arRenkliYuzdeColNames[n1]).ColorBarTextActive;
//      if pField.AsInteger < TColColor(arRenkliYuzdeColNames[n1]).MinValue then
//
//      else if pField.AsInteger > TColColor(arRenkliYuzdeColNames[n1]).MaxValue then
//        Result := TColColor(arRenkliYuzdeColNames[n1]).MaxColor
//      else if pField.AsInteger = TColColor(arRenkliYuzdeColNames[n1]).MaxValue then
//        Result := TColColor(arRenkliYuzdeColNames[n1]).EqualColor;
      Break;
    end;
  end;
end;

procedure TfrmBaseDBGrid.imgFilterRemoveClick(Sender: TObject);
begin
  FFilterGrid := '';
  RefreshData;
end;

function TfrmBaseDBGrid.IsRenkliRakamVar(pFieldName: string): Boolean;
var
  nIndex: Integer;
begin
  Result := False;
  for nIndex := 0 to Length(arRenkliRakamColNames)-1 do
  begin
    if pFieldName = TColColor(FarRenkliRakamColNames[nIndex]).FieldName then
    begin
      Result := True;
      Break
    end;
  end;
end;

function TfrmBaseDBGrid.IsYuzdeCizimAlaniVar(pFieldName: string): Boolean;
var
  nIndex: Integer;
begin
  Result := False;
  for nIndex := 0 to Length(arRenkliYuzdeColNames)-1 do
  begin
    if pFieldName = TColPercent(arRenkliYuzdeColNames[nIndex]).FieldName then
    begin
      Result := True;
      Break
    end;
  end;
end;

procedure TfrmBaseDBGrid.mniExportExcelClick(Sender: TObject);
begin
  ShowMessage('Prepare Export Excel Code');
end;

procedure TfrmBaseDBGrid.mniPreviewClick(Sender: TObject);
begin
  dbgrdBaseDblClick(dbgrdBase);
end;

procedure TfrmBaseDBGrid.mniCancelSortClick(Sender: TObject);
begin
  TFDQuery(dbgrdBase.DataSource.DataSet).IndexFieldNames := '';
  if TFDQuery(dbgrdBase.DataSource.DataSet).IndexFieldNames = '' then
    mniCancelSort.Visible := False;
end;

procedure TfrmBaseDBGrid.mniPrintClick(Sender: TObject);
begin
  ShowMessage('Prepare a Print Form');
end;

procedure TfrmBaseDBGrid.MoveDown;
begin
  Table.DataSource.DataSet.Prior;
  SetSelectedItem();
end;

procedure TfrmBaseDBGrid.MoveUp;
begin
  Table.DataSource.DataSet.Next;
  SetSelectedItem();
end;

procedure TfrmBaseDBGrid.RefreshData;
begin
  Table.DataSource.DataSet.Refresh;

  if Table.Id.Value > 0 then
    dbgrdBase.DataSource.DataSet.Locate(Table.Id.FieldName, Table.Id.Value,[]);

  if FFilterGrid <> '' then
  begin
    dbgrdBase.DataSource.DataSet.Filter := FFilterGrid;
    dbgrdBase.DataSource.DataSet.Filtered := True;

    il32x32.GetBitmap(IMG_CALCULATOR, imgFilterRemove.Picture.Bitmap);
    imgFilterRemove.Visible := True;
  end
  else
  begin
    dbgrdBase.DataSource.DataSet.Filtered := False;
    dbgrdBase.DataSource.DataSet.Filter := '';
    imgFilterRemove.Visible := False;
  end;

  RefreshGrid();
end;

procedure TfrmBaseDBGrid.RefreshDataFirst();
var
  nIndex: Integer;
  vGridColColor: TSysGridColColor;
  vGridColPercent: TSysGridColPercent;
  col_color: TColColor;
  col_percent: TColPercent;
begin
  Table.DataSource.OnDataChange := DataSourceDataChange;
  FQueryDefaultFilter := ' ' + Trim(FQueryDefaultFilter);

  FQueryDefaultOrder := Trim(FQueryDefaultOrder);
  if FQueryDefaultOrder <> '' then
    FQueryDefaultOrder := ' ORDER BY ' + Trim(FQueryDefaultOrder);
  Table.SelectToDatasource(FQueryDefaultFilter + FQueryDefaultOrder, True);

  if Table.Id.Value > 0 then
    dbgrdBase.DataSource.DataSet.Locate(Table.Id.FieldName, Table.Id.Value,[]);


  //todo y�zdeli olarak renklendirme i�lemini yap
  vGridColPercent := TSysGridColPercent.Create(Table.Database);
  try
    SetLength(FarRenkliYuzdeColNames, Table.DataSource.DataSet.FieldCount);
    for nIndex := 0 to Length(FarRenkliYuzdeColNames)-1 do
    begin
      col_percent.FieldName := '';
      col_percent.MaxValue := 0;
      col_percent.ColorBar := 0;
      col_percent.ColorBarBack := 0;
      col_percent.ColorBarText := 0;
      col_percent.ColorBarTextActive := 0;

      FarRenkliYuzdeColNames[nIndex] := col_percent;
    end;

    vGridColPercent.SelectToList(' and table_name=' + QuotedStr(Table.TableName), False, False);
    for nIndex := 0 to vGridColPercent.List.Count-1 do
    begin
      col_percent.FieldName := TSysGridColPercent(vGridColPercent.List[nIndex]).ColumnName.Value;
      col_percent.MaxValue := TSysGridColPercent(vGridColPercent.List[nIndex]).MaxValue.Value;
      col_percent.ColorBar := TSysGridColPercent(vGridColPercent.List[nIndex]).ColorBar.Value;
      col_percent.ColorBarBack := TSysGridColPercent(vGridColPercent.List[nIndex]).ColorBarBack.Value;
      col_percent.ColorBarText := TSysGridColPercent(vGridColPercent.List[nIndex]).ColorBarText.Value;
      col_percent.ColorBarTextActive := TSysGridColPercent(vGridColPercent.List[nIndex]).ColorBarTextActive.Value;

      FarRenkliYuzdeColNames[nIndex] := col_percent;
    end;
  finally
    vGridColPercent.Free;
  end;





  //todo say�sal renklendirme i�lemini yap
  vGridColColor := TSysGridColColor.Create(Table.Database);
  try
    SetLength(FarRenkliRakamColNames, Table.DataSource.DataSet.FieldCount);
    for nIndex := 0 to Length(FarRenkliRakamColNames)-1 do
    begin
      col_color.FieldName := '';
      col_color.MinValue := 0;
      col_color.MinColor := 0;
      col_color.MaxValue := 0;
      col_color.MaxColor := 0;
      col_color.EqualColor := 0;

      FarRenkliRakamColNames[nIndex] := col_color;
    end;

    vGridColColor.SelectToList(' and table_name=' + QuotedStr(Table.TableName), False, False);
    for nIndex := 0 to vGridColColor.List.Count-1 do
    begin
      col_color.FieldName := TSysGridColColor(vGridColColor.List[nIndex]).ColumnName.Value;
      col_color.MinValue := TSysGridColColor(vGridColColor.List[nIndex]).MinValue.Value;
      col_color.MinColor := TSysGridColColor(vGridColColor.List[nIndex]).MinColor.Value;
      col_color.MaxValue := TSysGridColColor(vGridColColor.List[nIndex]).MaxValue.Value;
      col_color.MaxColor := TSysGridColColor(vGridColColor.List[nIndex]).MaxColor.Value;
      col_color.EqualColor := clOlive;;

      FarRenkliRakamColNames[nIndex] := col_color;
    end;
//    ColorHigh := clGreen;
//    ColorLow := clRed;
//    ColorEqual := clBlue;
//    ColorRakamText := clBlack;
  finally
    vGridColColor.Free;
  end;






  for nIndex := 0 to Table.DataSource.DataSet.FieldCount - 1 do
  begin
    with dbgrdBase.Columns.Add do
    begin
      FieldName := Table.DataSource.DataSet.Fields[nIndex].FieldName;
      Title.Caption := Table.DataSource.DataSet.Fields[nIndex].DisplayName;
      Title.Caption := TSingletonDB.GetInstance.GetTextFromLang(Title.Caption, 'GridFieldCaption.' + Table.TableName + '.' + FieldName);
      Title.Color := clBlack;
      Title.Font.Color := clBlack;
      Title.Font.Style := [fsBold];
      Title.Alignment := taCenter;
      Visible := False;
//buras� kapal�
//      Color := clGreen;
//      Width := Table.DataSource.DataSet.Fields[nIndex].DataSize + 8;//
//      Width := Canvas.TextWidth(Title.Caption) + 16;
    end;
  end;

  RefreshGrid();
end;

procedure TfrmBaseDBGrid.RefreshGrid;
var
  nIndex, nIndex2: Integer;
  visible_column: TSysGridColWidth;
begin  
  //t�m kolonlar� gizle veya t�m kolonlar� g�ster
  for nIndex := 0 to dbgrdBase.Columns.Count-1 do
  begin
    dbgrdBase.Columns[nIndex].Visible := FShowHideColumns;
    dbgrdBase.Columns[nIndex].Width := 100;
  end;

  //burada g�r�nmesini istedi�imiz kolonlar� g�sterme i�lemini yap�yoruz.
  if not FShowHideColumns then
  begin
    visible_column := TSysGridColWidth.Create(Table.Database);
    try
      visible_column.SelectToList(' and table_name=' + QuotedStr(Table.TableName), False, False);
      for nIndex := 0 to visible_column.List.Count-1 do
      begin
        for nIndex2 := 0 to dbgrdBase.Columns.Count-1 do
        begin
          if dbgrdBase.Columns[nIndex2].FieldName = TSysGridColWidth(visible_column.List[nIndex]).ColumnName.Value then
          begin
            dbgrdBase.Columns[nIndex2].Visible := True;
            dbgrdBase.Columns[nIndex2].Width := TSysGridColWidth(visible_column.List[nIndex]).ColumnWidth.Value;
            break;
          end;
        end;
      end;
    finally
      visible_column.Free;
    end;
  end;

end;

function TfrmBaseDBGrid.ResizeDBGrid(Sender: TObject):Integer;
var
  nIndex, dGridWidth: Integer;
begin
  Result := 0;
  if Sender.ClassType = TDBGrid then
  begin
    with Sender as TDBGrid do
    begin
      dGridWidth := 0;
      for nIndex := 0 to Columns.Count-1 do
      begin
        if Columns[nIndex].Visible then
          dGridWidth := dGridWidth + Columns[nIndex].Width + 1;
      end;

      if AlignWithMargins then
        dGridWidth := dGridWidth + Margins.Left + Margins.Right;

      //��kan indicator i�in width bunun kontrol� eklenmeli. �imdilik sabit bilgi olarak girildi
      if dgIndicator in dbgrdBase.Options then
        dGridWidth := dGridWidth + IndicatorWidth;

      //��kan scroll i�in width bunun kontrol� eklenmeli. �imdilik sabit bilgi olarak girildi
      dGridWidth := dGridWidth + 24;

      (Sender as TDBGrid).Width := dGridWidth;
    end;

    Result := dGridWidth;
  end;
end;

procedure TfrmBaseDBGrid.ResizeForm;
var
//  nIndex, nColCountVisible, nTotalColWidth,
  nDBGridHeight, nClientWidth : Integer;
begin
  Self.Enabled := False;
  dbgrdBase.Enabled := False;
  try
    nClientWidth := ResizeDBGrid(dbgrdBase);

    if pnlContent.AlignWithMargins then
      nClientWidth := nClientWidth + pnlContent.Margins.Left + pnlContent.Margins.Right;

    if pnlLeft.Visible then
    begin
      nClientWidth := nClientWidth + pnlLeft.Width;
      if pnlLeft.AlignWithMargins then
        nClientWidth := nClientWidth + pnlLeft.Margins.Left + pnlLeft.Margins.Right;
    end;

    if splLeft.Visible then
    begin
      nClientWidth := nClientWidth + splLeft.Width;
      if splLeft.AlignWithMargins then
        nClientWidth := nClientWidth + splLeft.Margins.Left + splLeft.Margins.Right;
    end;

    if pnlMain.AlignWithMargins then
      nClientWidth := nClientWidth + pnlMain.Margins.Left + pnlMain.Margins.Right;

    //form kenarl�klar� i�in windows temadan gelen
    nClientWidth := nClientWidth + 4;

    ClientWidth := Math.Min(nClientWidth, Screen.Width-100);
    Self.Left := (Screen.Width-ClientWidth) div 2;

//    nTotalColWidth := 0;
//    nColCountVisible := 0;
//    for nIndex := 0 to dbgrdBase.Columns.Count-1 do
//    begin
//      if dbgrdBase.Columns[nIndex].Visible then
//      begin
//        nTotalColWidth := nTotalColWidth + dbgrdBase.Columns[nIndex].Width + 1;
//        nColCountVisible := nColCountVisible + 1;
//      end;
//    end;

    //32 ��kmas�n�n sebebi scroll bar + kolon kenarl�klar� + indicator i�in
//    if Math.CompareValue(nTotalColWidth, dbgrdBase.Width-34) = LessThanValue then
//      nTotalColWidth := dbgrdBase.Width - 34 - nTotalColWidth;
//
//    for nIndex := 0 to dbgrdBase.Columns.Count-1 do
//      if dbgrdBase.Columns[nIndex].Visible then
//        dbgrdBase.Columns[nIndex].Width := dbgrdBase.Columns[nIndex].Width + (nTotalColWidth div nColCountVisible);

    nDBGridHeight := 0;
    if pnlHeader.Visible then
    begin
      nDBGridHeight := nDBGridHeight + pnlHeader.Height;
      if pnlHeader.AlignWithMargins then
        nDBGridHeight := nDBGridHeight + pnlHeader.Margins.Top + pnlHeader.Margins.Bottom;
    end;

    if splHeader.Visible then
    begin
      nDBGridHeight := nDBGridHeight + splHeader.Height;
      if splHeader.AlignWithMargins then
        nDBGridHeight := nDBGridHeight + splHeader.Margins.Top + splHeader.Margins.Bottom;
    end;

    if pnlBottom.Visible then
    begin
      nDBGridHeight := nDBGridHeight + pnlBottom.Height;
      if pnlBottom.AlignWithMargins then
        nDBGridHeight := nDBGridHeight + pnlBottom.Margins.Top + pnlBottom.Margins.Bottom;
    end;

    if pnlButtons.Visible then
    begin
      nDBGridHeight := nDBGridHeight + pnlButtons.Height;
      if pnlButtons.AlignWithMargins then
        nDBGridHeight := nDBGridHeight + pnlButtons.Margins.Top + pnlButtons.Margins.Bottom;
    end;

    if stbBase.Visible then
    begin
      nDBGridHeight := nDBGridHeight + stbBase.Height;
      if stbBase.AlignWithMargins then
        nDBGridHeight := nDBGridHeight + stbBase.Margins.Top + stbBase.Margins.Bottom;
    end;

    ClientHeight := nDBGridHeight;

    //form kenarl�klar� i�in windows temadan gelen
//    ClientHeight := nDBGridHeight + 4;

    //Toplam 20 adet kay�t g�r�nmesi i�in 20+1 * 20 sat�r y�ksekli�i yap�yoruz (+1 ba�l�k i�in)
    nDBGridHeight := nDBGridHeight + (21*20);

    ClientHeight := Math.Min(nDBGridHeight, Screen.Height-100);
  finally
    dbgrdBase.Invalidate;
    dbgrdBase.Enabled := True;
    Self.Invalidate;
    Self.Enabled := True;
  end;
end;

procedure TfrmBaseDBGrid.SetColWidth(pFieldName: string; pWidth: Integer);
var
  nIndex: Integer;
begin
  for nIndex := 0 to dbgrdBase.Columns.Count-1 do
  begin
    if dbgrdBase.Columns[nIndex].FieldName = pFieldName then
    begin
      dbgrdBase.Columns[nIndex].Width := pWidth;
      break;
    end;
  end;
end;

procedure TfrmBaseDBGrid.SetColVisible(pFieldName: string; pVisible: Boolean);
var
  nIndex: Integer;
begin
  for nIndex := 0 to dbgrdBase.Columns.Count-1 do
  begin
    if dbgrdBase.Columns[nIndex].FieldName = pFieldName then
    begin
      dbgrdBase.Columns[nIndex].Visible := pVisible;
      break;
    end;
  end;
end;

procedure TfrmBaseDBGrid.SetSelectedItem;
begin
  //geri kalan bilgiler inherit eden s�n�fta doldurulur
  Table.Id.Value := Self.GetFieldByFieldName(Table.Id.FieldName, dbgrdBase.Columns).AsInteger;
end;

procedure TfrmBaseDBGrid.ShowInputForm(pFormType: TInputFormMod);
begin
  if  (pFormType = ifmRewiev) or ((not Table.Database.TranscationIsStarted)
  and (pFormType = ifmNewRecord))
  then
  begin
    CreateInputForm(pFormType).Show;
  end
  else
    raise Exception.Create('Ba�ka bir pencere giri� veya g�ncelleme i�in a��lm��, �nce bu i�lemi tamamlay�n.');
end;

end.
