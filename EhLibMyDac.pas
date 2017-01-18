{*******************************************************}
{                                                       }
{                        EhLib                          }
{    Copyright (c) 2002 - 2016 by Dmitry V. Bolshakov   }
{                                                       }
{  Register object that sort and filtering data in      }
{ TMyQuery, TMyTable & TVirtualTable from CoreLab MyDac }
{      Copyright (c) 2004 by Andrew Holubovski          }
{                                                       }
{*******************************************************}

{*******************************************************}
{ Add this unit to 'uses' clause of any unit of your    }
{ project to allow TDBGridEh to sort data in TMyQuery   }
{ and TMyTable automatically after sorting markers      }
{ will be changed.                                      }
{*******************************************************}
{                    Attention!!!                       }
{ 1. Limitation for not local filter. In FROM you can't }
{    use table aliases. Sample:                         }
{   Instead                                             }
{     SELECT t1.ID, NAME                                }
{     FROM Table1 t1, Table2 t2                         }
{     WHERE t1.ID=t2.ID                                 }
{   you need                                            }
{     SELECT Table1.ID, NAME                            }
{     FROM Table1, Table2                               }
{     WHERE Table1.ID=Table1.ID                         }
{ 2. TVirtualTable it's impossible to sort              }
{    (only filtering)                                   }
{                                                       }
{ The recommendation.  If you don't use TVirtualTable,  }
{ then remove VirtualTable from uses and                }
{ TVirtualTableSQLDatasetFeaturesEh definition          }
{*******************************************************}

unit EhLibMyDac;

{$I EhLib.Inc}

interface

uses
  DbUtilsEh, DBGridEh, Db, MyAccess, VirtualTable,
  ToolCtrlsEh, SysUtils, Classes;

type
  TMyQuerySQLDatasetFeaturesEh = class(TSQLDatasetFeaturesEh)
  public
    constructor Create; override;
    procedure ApplyFilter(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean); override;
    procedure FillSTFilterListDataValues(AGrid: TCustomDBGridEh; Column: TColumnEh; Items: TStrings); override;

  end;

  TMyTableSQLDatasetFeaturesEh = class(TDatasetFeaturesEh)
  public
    procedure ApplySorting(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean); override;
    procedure ApplyFilter(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean); override;
  end;

  TVirtualTableSQLDatasetFeaturesEh = class(TDatasetFeaturesEh)
  public
    procedure ApplyFilter(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean); override;
  end;

implementation

function DateValueToMyDacSQLStringProc(DataSet: TDataSet; Value: Variant): String;
begin
  Result := DateValueToDataBaseSQLString('MYSQL', Value)
end;

{ TMyQuerySQLDatasetFeaturesEh }

constructor TMyQuerySQLDatasetFeaturesEh.Create;
begin
  inherited Create;
  SortUsingFieldName := True;
  DateValueToSQLString := DateValueToMyDacSQLStringProc;
end;

procedure TMyQuerySQLDatasetFeaturesEh.ApplyFilter(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean);
begin
  if TDBGridEh(Sender).STFilter.Local
   then DataSet.Filter := GetExpressionAsFilterString(TDBGridEh(Sender), GetOneExpressionAsLocalFilterString, nil)
  else (DataSet as TCustomMyDataSet).FilterSQL := GetExpressionAsFilterString(TDBGridEh(Sender), GetOneExpressionAsSQLWhereString, DateValueToMyDacSQLStringProc, True)
end;

procedure TMyQuerySQLDatasetFeaturesEh.FillSTFilterListDataValues(AGrid: TCustomDBGridEh; Column: TColumnEh; Items: TStrings);
 Var
  ds: TMyQuery;
  Field: TField;
  bm: TBookmark;
  slData, slTemp: TStringList;
  sFilter: String;
  i,k: Integer;
begin
 ds := TMyQuery(AGrid.DataSource.DataSet);
 If (Column.STFilter.ListSource = nil) and (not ds.IsEmpty) then
  begin
   Field := ds.FindField(Column.FieldName);
   If Field <> nil then
    Try
     slTemp := TStringList.Create;
     For i := 0 to Items.Count - 1 do
      slTemp.AddObject(Items.Strings[i], Items.Objects[i]);


    if Column.KeyList.Count> 0 then
    begin
       items.AddObject('-', PopupListboxItemEhLine);
       for I := 0 to Column.KeyList.Count - 1 do
         Items.AddObject(Column.PickList.Strings[i], PopupListboxItemEhData);


       slData := TStringList.Create;
    end
    else
    begin
     slData := TStringList.Create;
     slData.Sorted := True;
     slData.CaseSensitive := True;
     ds.DisableControls;
     bm := ds.GetBookmark;
     sFilter := ds.Filter;
     ds.Filter := '';
     ds.FetchAll;
     ds.First;
     While not ds.Eof do
      begin
       slData.Add(Field.AsString);
       ds.Next;
      end;
     ds.Filter := sFilter;
     ds.GotoBookmark(bm);
     ds.FreeBookmark(bm);
     ds.EnableControls;
    end;

    Finally

     if Items.Count=0 then
     For i := 0 to slTemp.Count - 1 do
      Items.AddObject(slTemp.Strings[i], slTemp.Objects[i]);
     slTemp.Free;
     if slData.Count>0 then
      begin
       Items.AddObject('-', PopupListboxItemEhLine);
       Items.AddStrings(slData);
      end;
     slData.Free;
    End;
  end;
end;


{ TMyTableSQLDatasetFeaturesEh }

procedure TMyTableSQLDatasetFeaturesEh.ApplySorting(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean);
var
  i: Integer;
  sOrderFields: String;
begin
  If Sender is TCustomDBGridEh then
   With TCustomDBGridEh(Sender) do
    begin
     sOrderFields := '';
     If SortMarkedColumns.Count>0 then
      For i := 0 to SortMarkedColumns.Count - 1 do
       begin
        sOrderFields := sOrderFields + SortMarkedColumns[i].FieldName;
        If SortMarkedColumns[i].Title.SortMarker = smUpEh then
         sOrderFields := sOrderFields + ' DESC';
        sOrderFields := sOrderFields + ','
      end;
     Delete(sOrderFields,Length(sOrderFields),1);
     (DataSet as TMyTable).OrderFields := sOrderFields;
    End
end;

procedure TMyTableSQLDatasetFeaturesEh.ApplyFilter(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean);
begin
  if TDBGridEh(Sender).STFilter.Local
   then DataSet.Filter := GetExpressionAsFilterString(TDBGridEh(Sender), GetOneExpressionAsLocalFilterString, nil)
   else (DataSet as TCustomMyDataSet).FilterSQL := GetExpressionAsFilterString(TDBGridEh(Sender), GetOneExpressionAsSQLWhereString, DateValueToMyDacSQLStringProc, True)
end;

{ TVirtualTableSQLDatasetFeaturesEh }

procedure TVirtualTableSQLDatasetFeaturesEh.ApplyFilter(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean);
begin
 DataSet.Filter := GetExpressionAsFilterString(TDBGridEh(Sender), GetOneExpressionAsLocalFilterString, nil)
end;

initialization
  RegisterDatasetFeaturesEh(TMyQuerySQLDatasetFeaturesEh, TMyQuery);
  RegisterDatasetFeaturesEh(TMyTableSQLDatasetFeaturesEh, TMyTable);
  RegisterDatasetFeaturesEh(TVirtualTableSQLDatasetFeaturesEh, TVirtualTable);
end.
