unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DBGridEhGrouping, DBAccess, MyDacVcl, DB, EhLibMyDac,
  MyAccess, MemDS, DBCtrlsEh, GridsEh, DBGridEh, ToolWin, ActnMan,
  ActnCtrls, ComCtrls, ImgList, ExtCtrls, sSkinManager, StdCtrls, sEdit,
  sSpinEdit, AppEvnts, DateUtils, ShellApi, Excel2000, ActiveX, OleCtnrs, OleServer,
  DADump, MyDump,SyncObjs, acTitleBar, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, Buttons,
  sBitBtn, jpeg;

type
  TfmMain = class(TForm)
    mm1: TMainMenu;
    N1: TMenuItem;
    MyConn: TMyConnection;
    myQ: TMyQuery;
    MyUser: TMyQuery;
    N2: TMenuItem;
    SBar1: TStatusBar;
    tlb1: TToolBar;
    il1: TImageList;
    btn1: TToolButton;
    btn2: TToolButton;
    n24: TMenuItem;
    sSkinManager1: TsSkinManager;
    IdFTP1: TIdFTP;
    N4: TMenuItem;
    btn3: TToolButton;
    btn4: TToolButton;
    btn5: TToolButton;
    N3: TMenuItem;
    btn6: TToolButton;
    btn7: TToolButton;
    ToolButton1: TToolButton;
    btn8: TToolButton;
    btn9: TToolButton;
    sbt1: TsBitBtn;
    sbt2: TsBitBtn;
    sBitBtn1: TsBitBtn;
    img1: TImage;
    N5: TMenuItem;
    btn10: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mydmpServBackupProgress(Sender: TObject; ObjectName: string;
      ObjectNum, ObjectCount, Percent: Integer);
    procedure mydmpServRestoreProgress(Sender: TObject; Percent: Integer);
    procedure mydmpSBackupProgress(Sender: TObject; ObjectName: string;
      ObjectNum, ObjectCount, Percent: Integer);
    procedure mydmpSRestoreProgress(Sender: TObject; Percent: Integer);
    procedure n24Click(Sender: TObject);
    procedure MyConnError(Sender: TObject; E: EDAError; var Fail: Boolean);
    procedure btn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure sbt1Click(Sender: TObject);
    procedure sbt2Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TSync = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;




var
  fmMain: TfmMain;
  CriticalSection: TCriticalSection;
  period_start:TDateTime;
  period_end:TDateTime;
  Sync1: TSync;
  id_Scale:Integer;
  user:integer;
  user_p:string;
  tip_user:Integer;
  kav:string='''';
  dir_file:string;
  dfile : string;
  id_obj:Integer;
  otdel : Integer;

  ExcelApp: TExcelApplication;
  Excel_rus: boolean = true; //признак русской версии Excel

procedure RemoveAll(path: string);
procedure ShowProgress(Text: string; pos: integer; max: integer);
procedure CloseProgress;

//вызвращает результат SQL запроса (1 значение)
function ReturnSQL(SQL: string): Variant;
procedure ExecSQL(SQL:string);
//вызвращает результат поиска названия из справочника
function ReturnID(table,str: string): integer;
// ввод названия
function InputName(const ACaption, APrompt: string; var Value: string; AWidth:Integer= 300): Boolean;
// проверка наличия уже открытой формы данного класса
// если activate = true (по умолчанию), то делает форму активной
function FormExists(FormClass:TClass;activate:boolean = true):boolean;
//загрузка в столбец TDBGridEh значений для выбора из списка
procedure LoadValues(grid:TDBGridEh;field_name:string;sql:string);overload;
//тоже самое в TDBComboBoxEh
procedure LoadValues(combo:TDBComboBoxEh;sql:string);overload;
//Запрос на удаление записи
function DelZap:Boolean;
//Фильтрует записи в гриде
procedure GridFilter(g:TDBGridEh;T:TMyQuery);
//функция возвращает дату с часами 00:00:00
function dt_begin(dt:tdatetime):TDateTime;
//функция возвращает дату с часами 23:59:59
function dt_end(dt:tdatetime):TDateTime;
//проверка на установку Excel
function IsExcelInstalled(): boolean;
//открывает книгу Excel
function OpenExcel(FileName: string = ''): TExcelWorkbook;
// делает окно Excel видимым и интерактивным
// освобождает компоненту TExcelWorkbook
procedure ReleaseExcel(book: TExcelWorkbook);
//вывод содержимого грид в Excel или WORD
procedure ExportEh(pGrid: TDBGridEh; target: integer = 0; Selected: boolean = false);
//процедура загрузки файла с фтп
function GetFileFTP(ftpfile:string;localfile:string):boolean;
//процедура закачки файла на фтп
function PutFileFTP(ftpfile:string;localfile:string):boolean;
//функция удаляет файл с фтп
function DeleteFtp(ftpfile:string):Boolean;
{Подключение сет диска ConnectNetDrive('Y:','\\xp\c$','Vi','');}
function ConnectNetDrive(DriveName,Machine,User,Pass:string):variant;

implementation

{$R *.dfm}



uses Trans,Dostup,progress,DBGridEhImpExp,DbUtilsEh,StrUtils,
     Users, Objects, Obj, Reports, Sprav, FileCtrl, Candidat, Input;

const
  FLCID = LOCALE_USER_DEFAULT;
  msoLanguageIDUI = $00000002;

procedure RemoveAll(path: string);
var
  sr: TSearchRec;
begin
  if FindFirst(path + '\*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      if sr.Attr and faDirectory = 0 then
      begin
        DeleteFile(path + '\' + sr.name);
      end
      else
      begin
        if pos('.', sr.name) <= 0 then
          RemoveAll(path + '\' + sr.name);
      end;
    until
      FindNext(sr) <> 0;
  end;
  FindClose(sr);
end;


function DelZap:Boolean;
begin
   if messagedlg('Удалить запись?',mtConfirmation,[mbYes,mbNo],0,mbYes)=mrYes then
   Result:=True else Result:=False;

end;

procedure ShowProgress(Text: string; pos: integer; max: integer);
begin
  if fmProgress = nil then
    fmProgress := TfmProgress.Create(nil);

  if fmProgress.TextLabel.Caption <> Text then
  begin
    fmProgress.TextLabel.Caption := Text;
    fmProgress.Refresh;
  end;
  if fmProgress.ProgressBar.MaxValue <> max then fmProgress.ProgressBar.MaxValue := max;
  if fmProgress.ProgressBar.Progress <> pos then fmProgress.ProgressBar.Progress := pos;
end;

procedure CloseProgress;
begin
  if fmProgress <> nil then fmProgress.Close;
end;


procedure GridFilter(g:TDBGridEh;T:TMyQuery);
var s:string;
begin
     s:=GetExpressionAsFilterString(g,GetOneExpressionAsLocalFilterString, nil, false, false);
     s:=AnsiReplaceStr(s,'] = '+kav,'] = '+kav+'*');
     s:=AnsiReplaceStr(s,kav+' AND ','*'+kav+' AND ');
     if (length(s)>3)and(s[length(s)-1]=kav) then
     s:=copy(s,0,length(s)-2)+'*'+kav;
     showmessage(s);
     T.Filter:=s;
end;

function ReturnSQL(SQL: string): Variant;
begin
FmMain.MyQ.Active:=false;
FmMain.MyQ.SQL.Clear;
FmMain.MyQ.Params.Clear;
FmMain.MyQ.SQL.Add(sql);
FmMain.MyQ.Active:=true;
Result:=FmMain.MyQ.Fields[0].AsVariant;
FmMain.MyQ.Active:=false;
end;

procedure ExecSQL(SQL: string);
begin
  fmMain.MyConn.ExecSQL(SQL,[]);
end;

function ReturnID(table,str: string): integer;
var s:string;
begin
Result:=0;
FmMain.MyQ.Active:=false;
FmMain.MyQ.SQL.Clear;
FmMain.MyQ.Params.Clear;
FmMain.MyQ.SQL.Add('select * from '+ table);
FmMain.MyQ.Active:=true;
 while not FmMain.MyQ.Eof do
 begin
   s:=fmmain.MyQ.FieldByName('name').AsString;
   if pos(UpperCase(s),UpperCase(str))>0 then
    Result:=fmmain.MyQ.FieldByName('id').AsInteger;
   FmMain.MyQ.Next;
 end;
end;

function InputName(const ACaption, APrompt: string; var Value: string; AWidth:Integer= 300): Boolean;
begin
   Result := False;
   if FormExists(TfmInput) then exit;
   LockWindowUpdate(Application.MainForm.Handle);
   Application.CreateForm(TfmInput,fmInput);
   LockWindowUpdate(0);
   fmInput.Caption := ACaption;
   fmInput.sLabel1.Caption := APrompt;
   fmInput.sEdit1.Text := Value;
   if AWidth<300 then  fmInput.ClientWidth := 300
                 else  fmInput.ClientWidth := AWidth;
   fmInput.sEdit1.Width := fmInput.ClientWidth - fmInput.sEdit1.Left*2;
   fmInput.btnOk.Left := (fmInput.ClientWidth div 2) - 20 - fmInput.btnOk.Width;
   fmInput.btnCansel.Left := (fmInput.ClientWidth div 2) + 20;
   if fmInput.ShowModal = mrOk then
   begin
     Result := True;
     Value := fmInput.sEdit1.Text;
   end;
end;


function FormExists(FormClass:TClass;activate:boolean = true):boolean;
var
  i:integer;
  mform:TForm;
begin
  Result := false;
  mform := Application.MainForm;
  for i := 0 to mform.MDIChildCount - 1 do
    if mform.MDIChildren[i].ClassName = FormClass.ClassName then
    begin
      Result := true;
      if activate and(mform.MDIChildren[i] <> mform.ActiveMDIChild)then
      begin
        LockWindowUpdate(Application.MainForm.Handle);
        BringWindowToTop(mform.MDIChildren[i].Handle);
        LockWindowUpdate(0);
      end;
      exit;
    end;
end;

procedure LoadValues(grid:TDBGridEh;field_name:string;sql:string);
var
  col:TDBGridColumnEh;
  i:integer;
begin
  col := nil;
  for i := 0 to grid.Columns.Count - 1 do
    if AnsiCompareText(grid.Columns[i].FieldName,field_name) = 0 then col := grid.Columns[i] as TDBGridColumnEh;
  if col = nil then raise Exception.Create('Ошибка при загрузке значений для выбора из списка т.к. в указанном DBGridEh нет столбца с именем '+field_name);
  FmMain.MyQ.SQL.Clear;
  FmMain.MyQ.Params.Clear;
  FmMain.MyQ.SQL.Add(sql);
  FmMain.MyQ.Active:=true;
  col.PickList.Clear;
  col.KeyList.Clear;
  if FmMain.MyQ.Fields[0].AsVariant<>0 then
  begin
//     col.KeyList.Add('0');
//     col.PickList.Add('');
  end;
  while not FmMain.MyQ.Eof do
  begin
    col.KeyList.Add(FmMain.MyQ.Fields[0].AsVariant);
    col.PickList.Add(FmMain.MyQ.Fields[1].AsString);
    FmMain.MyQ.Next;
  end;
end;
//тоже самое в TDBComboBoxEh
procedure LoadValues(combo:TDBComboBoxEh;sql:string);
begin
  FmMain.MyQ.SQL.Clear;
  FmMain.MyQ.Params.Clear;
  FmMain.MyQ.SQL.Add(sql);
  FmMain.MyQ.Active:=true;
  combo.Items.Clear;
  combo.KeyItems.Clear;
  if FmMain.MyQ.Fields[0].AsVariant<>0 then
  begin
//     combo.KeyItems.Add('0');
//     combo.Items.Add('');
  end;

  while not FmMain.MyQ.Eof do
  begin
    combo.KeyItems.Add(FmMain.MyQ.Fields[0].AsVariant);
    combo.Items.Add(FmMain.MyQ.Fields[1].AsVariant);
    FmMain.MyQ.Next;
  end;
end;

function dt_begin(dt:tdatetime):TDateTime;
begin
  Result:=StrToDateTime(DateToStr(dt)+' 00:00:00');
  //StartOfTheMonth()
end;

function dt_end(dt:tdatetime):TDateTime;
begin
  Result:=StrToDateTime(DateToStr(dt)+' 23:59:59');
  //EndofTheMonth()
end;

function IsExcelInstalled(): boolean;
var
  ClassID: TCLSID;
  Rez: HRESULT;
begin
  Rez := CLSIDFromProgID('Excel.Application', ClassID);
  Result := (Rez = S_OK);
end;

function OpenExcel(FileName: string = ''): TExcelWorkbook;
var
  ExcelBook: TExcelWorkbook;
begin
  if not IsExcelInstalled then raise Exception.Create('На компьютере не установлен Excel.');

  //одновременно два управляемых экземпляра Excel существовать не должно
  if Assigned(ExcelApp) then
  begin
    ExcelApp.Disconnect;
    FreeAndNil(ExcelApp);
  end;

  ExcelApp := TExcelApplication.Create(Application);


  // удаленный запуск Excel
  //  ExcelApp.ConnectKind := ckRemote;
   // ExcelApp.RemoteMachineName := RemoteMachineName;

  ExcelApp.ConnectKind := ckNewInstance;
  try
    ExcelApp.Connect;
    ExcelApp.Interactive[FLCID] := false;
    ExcelApp.ScreenUpdating[FLCID] := false;
    ExcelApp.DisplayAlerts[FLCID] := false;
    ExcelApp.EnableEvents := false;
    ExcelApp.Visible[FLCID] := false;

    try
      if ExcelApp.LanguageSettings.LanguageID[msoLanguageIDUI] = 1049
        then Excel_rus := true
      else Excel_rus := false;
    except
    end;

  except
    ExcelApp.Disconnect;
    FreeAndNil(ExcelApp);
    raise Exception.Create('Excel не отвечает на запрос.');
  end;

  ExcelBook := TExcelWorkbook.Create(Application);

  try
    if FileName = '' then
      ExcelBook.ConnectTo(ExcelApp.Workbooks.Add($FFFFEFB9, FLCID))
    else
      ExcelBook.ConnectTo(ExcelApp.Workbooks.Add(FileName, FLCID));
  except
    ExcelBook.Disconnect;
    ExcelApp.Disconnect;
    ExcelBook.Free;
    FreeAndNil(ExcelApp);
    raise;
  end;

  Result := ExcelBook;
end;

procedure ReleaseExcel(book: TExcelWorkbook);
begin
  if not Assigned(ExcelApp) then raise Exception.Create('Не найдено открытого функцией OpenExcel экземпляра Excel.');
    try
      if not ExcelApp.Interactive[FLCID] then ExcelApp.Interactive[FLCID] := true;
      if not ExcelApp.ScreenUpdating[FLCID] then ExcelApp.ScreenUpdating[FLCID] := true;
      if not ExcelApp.DisplayAlerts[FLCID] then ExcelApp.DisplayAlerts[FLCID] := true;
      if not ExcelApp.EnableEvents then ExcelApp.EnableEvents := true;
      if not ExcelApp.Visible[FLCID] then ExcelApp.Visible[FLCID] := true;

    finally
      book.Disconnect;
      ExcelApp.Disconnect;

      FreeAndNil(book);
      FreeAndNil(ExcelApp);
    end;
end;


procedure ExportEh(pGrid: TDBGridEh; target: integer = 0; Selected: boolean = false);
var
  fname: string;
begin
  fname := ExtractFileDir(Application.ExeName) + '\$grid_export$';
  case target of
    0: begin
        fname := fname + '.xls';
        SaveDBGridEhToExportFile(TDBGridEhExportAsXls, pGrid, fname, not Selected);
      end;
    1: begin
        fname := fname + '.doc';
        SaveDBGridEhToExportFile(TDBGridEhExportAsRTF, pGrid, fname, not Selected);
      end;
  end;
  ShellExecute(pGrid.Handle, 'OPEN', PChar(fname), nil, nil, sw_shownormal);
end;


//процедура загрузки файла с фтп
function GetFileFTP(ftpfile:string;localfile:string):boolean;
begin
      Result := False;
      try
       fmMain.IdFTP1.Disconnect;
       FmMain.IDFTp1.Connect;
       fmMain.IdFTP1.ChangeDir('media');
       fmMain.IdFTP1.Get(ftpfile,localfile,True);
       fmMain.IdFTP1.Disconnect;
       Result := True;
      except
       Result := False;
      end;
end;
//процедура закачки файла на фтп
function PutFileFTP(ftpfile:string;localfile:string):Boolean;
begin
      Result:=False;
      try
       fmMain.IdFTP1.Disconnect;
       FmMain.IDFTp1.Connect;
       fmMain.IdFTP1.ChangeDir('media');
       fmMain.IdFTP1.Put(localfile,ftpfile,True);
       fmMain.IdFTP1.Disconnect;
       Result := True;
      except
       Result := False;
      end;
end;

//функция удаляет файл с фтп
function DeleteFtp(ftpfile:string):Boolean;
begin
      Result:=False;
      try
       fmMain.IdFTP1.Disconnect;
       FmMain.IDFTp1.Connect;
       fmMain.IdFTP1.ChangeDir('media');
       fmMain.IdFTP1.Delete(ftpfile);
       fmMain.IdFTP1.Disconnect;
       Result := True;
      except
       Result := False;
      end;
end;


{Подключение сет диска ConnectNetDrive('Y:','\\xp\c$','Vi','');}
function ConnectNetDrive(DriveName,Machine,User,Pass:string):variant;

var NRW: TNetResource;v:variant;
begin

NRW.dwType:=RESOURCETYPE_DISK;
NRW.lpLocalName:= nil;
NRW.lpRemoteName:= PChar(Machine);
NRW.lpProvider:=nil;
v:=WNetAddConnection2(NRW, PChar(pass), PChar(User), 0);
//****** CASE ******
case v of
  ERROR_ACCESS_DENIED	:result:='ERROR_ACCESS_DENIED';
  ERROR_ALREADY_ASSIGNED:result:='ERROR_ALREADY_ASSIGNED';
  ERROR_BAD_DEV_TYPE	:result:='ERROR_BAD_DEV_TYPE';
  ERROR_BAD_DEVICE      :result:='ERROR_BAD_DEVICE';
  ERROR_BAD_NET_NAME	:result:='ERROR_BAD_NET_NAME';
  ERROR_BAD_PROFILE	:result:='ERROR_BAD_PROFILE';
  ERROR_BUSY            :result:='ERROR_BUSY';
  ERROR_CANCELLED       :result:='ERROR_CANCELLED';
  ERROR_CANNOT_OPEN_PROFILE:result:='ERROR_CANNOT_OPEN_PROFILE';
  ERROR_DEVICE_ALREADY_REMEMBERED:result:='ERROR_DEVICE_ALREADY_REMEMBERED';
  ERROR_EXTENDED_ERROR		:result:='ERROR_EXTENDED_ERROR';
  ERROR_INVALID_PASSWORD	:result:='ERROR_INVALID_PASSWORD';

  ERROR_NO_NET_OR_BAD_PATH	:result:='ERROR_NO_NET_OR_BAD_PATH';
  ERROR_NO_NETWORK	:result:='ERROR_NO_NETWORK';
else result:='';//machine+' ('+DriveName+')' ;
end;
//****** END CASE ******
end;


procedure TSync.Execute;
begin
   while not Terminated do
   begin
     Sleep(900000); //15 minut
     CriticalSection.Enter;
     CriticalSection.Leave;
   end;
end;



procedure TfmMain.n24Click(Sender: TObject);
begin
     Close;
end;

procedure TfmMain.N2Click(Sender: TObject);
begin
  if FormExists(TfmSprav) then exit;
  LockWindowUpdate(Application.MainForm.Handle);
  Application.CreateForm(TfmSprav,fmSprav);
  LockWindowUpdate(0);
  fmSprav.ShowModal;
end;

procedure TfmMain.N3Click(Sender: TObject);
begin
  if FormExists(TfmReport) then exit;
  LockWindowUpdate(Application.MainForm.Handle);
  Application.CreateForm(TfmReport,fmReport);
  LockWindowUpdate(0);
end;

procedure TfmMain.N4Click(Sender: TObject);
begin
  if FormExists(TfmObjects) then exit;
  LockWindowUpdate(Application.MainForm.Handle);
  Application.CreateForm(TfmObjects,fmObjects);
  LockWindowUpdate(0);
end;

procedure TfmMain.sBitBtn1Click(Sender: TObject);
begin
      if DeleteFtp('08.avi') then
      ShowMessage('Delete');

end;

procedure TfmMain.sbt1Click(Sender: TObject);
begin
      if GetFileFTP('08.avi','08.avi') then
      ShowMessage('Get');
end;

procedure TfmMain.sbt2Click(Sender: TObject);
begin
      if PutFileFTP('08.avi','08.avi') then
      ShowMessage('Put');

end;

procedure TfmMain.btn10Click(Sender: TObject);
begin
  if FormExists(TFmCandidat) then exit;
  LockWindowUpdate(Application.MainForm.Handle);
  Application.CreateForm(TFmCandidat,FmCandidat);
  LockWindowUpdate(0);
end;

procedure TfmMain.btn2Click(Sender: TObject);
begin
    Close;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var ss:Tstrings; err,err_dump:boolean;
    i:Integer;
begin
   if id_Scale=1 then
   if screen.Height<>768 then fmMain.ChangeScale(Round(screen.Height/768*100), 100);
   Err:=false;
   ss:=TStringList.Create;
   //dir:=ExtractFilePath(Application.ExeName);
   ss.LoadFromFile(ExtractFilePath(Application.ExeName)+'ikwell.ini');
   CreateDir('file1');
   dfile :=ExtractFilePath(Application.ExeName)+'\file1\';
   if ss.Count>=5 then
    begin
     MyConn.Server:=ss.Strings[0];
     MyConn.Username:=ss.Strings[1];
     MyConn.Password:=ss.Strings[2];
     dir_file:=ss.Strings[3];
     id_Scale:=StrToInt(ss.Strings[4]);
     if ss.Count>=6 then
      otdel := StrToInt(ss.Strings[5])
     else otdel := 1;

     try
     MyConn.Connected:=true;
     except
      on E:EDAError  do
       begin err:=true; raise Exception.Create('Не найдена база данных!'); end;
      on E:Exception  do
       begin err:=true; raise Exception.Create('Не найдена база данных!'); end;
      else begin err:=true; raise Exception.Create('Не найден сервер данных!'); end;
     end;
    end
   else
    begin
      ShowMessage('Проверьте настройки!');
      Application.Terminate;
    end;

   ss.Free;
   if Err then  Application.Terminate;

   MyUser.Active:=true;

   KeyPreview:=true;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin

   if FmLogin.ShowModal=mrCancel then Exit;

   if tip_user<3  then
    begin
      //Пользователи
      btn1.Visible := True;
      N1.Visible := True;
      otdel := 0;
    end
   else
    begin
      //Пользователи
      btn1.Visible:=False;
      N1.Visible:=False;
    end;
    //Развитие
    if otdel = 1 then
    begin
        N5.Visible := False;
        btn10.Visible := False;
    end;
    //Отдел кадров
    if otdel = 2 then
    begin
        N4.Visible := False;
        N3.Visible := False;
        btn3.Visible := False;
        btn6.Visible := False;
    end;

    //ConnectNetDrive('Y','\\192.168.1.1\foto','user','user');
end;

procedure TfmMain.MyConnError(Sender: TObject; E: EDAError; var Fail: Boolean);
begin
     try
       SBar1.Panels[0].Text:='';
     except
       SBar1.Panels[0].Text:='Connect error';
     end;
end;

procedure TfmMain.mydmpSBackupProgress(Sender: TObject; ObjectName: string;
  ObjectNum, ObjectCount, Percent: Integer);
begin
//     ShowProgress('Загрузка данных '+ObjectName,percent,100);
end;

procedure TfmMain.mydmpServBackupProgress(Sender: TObject; ObjectName: string;
  ObjectNum, ObjectCount, Percent: Integer);
begin
//     ShowProgress('Загрузка справочника '+ObjectName,percent,100);
end;

procedure TfmMain.mydmpServRestoreProgress(Sender: TObject; Percent: Integer);
begin
//      ShowProgress('Обновление справочников',percent,100);
end;

procedure TfmMain.mydmpSRestoreProgress(Sender: TObject; Percent: Integer);
begin
//     ShowProgress('Обновление данных',percent,100);
end;

procedure TfmMain.N1Click(Sender: TObject);
begin
  if FormExists(TfmUsers) then exit;
  LockWindowUpdate(Application.MainForm.Handle);
  Application.CreateForm(TfmUsers,fmUsers);
  LockWindowUpdate(0);
end;

end.
