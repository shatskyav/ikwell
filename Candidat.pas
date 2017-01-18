unit Candidat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, DBCtrlsEh, StdCtrls, sCheckBox, Mask, sLabel,  ShellAPI,
  ExtCtrls, sPanel, DB, DBAccess, MyAccess, MemDS, GridsEh, DBGridEh, sGroupBox,
  DBCtrls, Buttons, sBitBtn, EhLibMyDac;

type
  TFmCandidat = class(TForm)
    grp1: TsGroupBox;
    grp2: TsGroupBox;
    myCandidat: TMyQuery;
    dsCandidat: TMyDataSource;
    grp3: TsGroupBox;
    pn1: TsPanel;
    sLabel2: TsLabel;
    fio: TDBEditEh;
    gorod: TDBComboBoxEh;
    sLabel3: TsLabel;
    vuz: TDBComboBoxEh;
    sLabel4: TsLabel;
    DBEditEh2: TDBEditEh;
    sLabel5: TsLabel;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    sLabel6: TsLabel;
    DBCheckBoxEh1: TDBCheckBoxEh;
    sLabel7: TsLabel;
    DBCheckBoxEh2: TDBCheckBoxEh;
    DBCheckBoxEh3: TDBCheckBoxEh;
    pnDoc: TsPanel;
    sbInsDoc: TsBitBtn;
    sbDelDoc: TsBitBtn;
    myFoto: TMyQuery;
    dsMyFoto: TMyDataSource;
    OpenDialog1: TOpenDialog;
    gDoc: TDBGridEh;
    DBMemo1: TDBMemo;
    sLabel8: TsLabel;
    DBCheckBoxEh4: TDBCheckBoxEh;
    pn2: TsPanel;
    sb1: TsBitBtn;
    sb2: TsBitBtn;
    sLabel9: TsLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    sLabel10: TsLabel;
    obrazovanie: TDBComboBoxEh;
    sLabel11: TsLabel;
    sLabel12: TsLabel;
    s_fio: TDBEditEh;
    sLabel1: TsLabel;
    proff: TDBComboBoxEh;
    sLabel14: TsLabel;
    end_intern: TDBEditEh;
    gCandidat: TDBGridEh;
    sLabel13: TsLabel;
    sLabel16: TsLabel;
    s_proff: TDBComboBoxEh;
    s_gorod: TDBEditEh;
    sb3: TsBitBtn;
    my1: TMyQuery;
    kursi: TDBComboBoxEh;
    btn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pn1Exit(Sender: TObject);
    procedure myCandidatAfterScroll(DataSet: TDataSet);
    procedure sb1Click(Sender: TObject);
    procedure sb2Click(Sender: TObject);
    procedure sb3Click(Sender: TObject);
    procedure gorodEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure proffEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure vuzEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure myCandidatBeforePost(DataSet: TDataSet);
    procedure sbInsDocClick(Sender: TObject);
    procedure sbDelDocClick(Sender: TObject);
    procedure gDocDblClick(Sender: TObject);
    procedure gCandidatGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure gDocExit(Sender: TObject);
  private
    { Private declarations }
    procedure filter_rec;
  public
    { Public declarations }
  end;

var
  FmCandidat: TFmCandidat;

implementation

{$R *.dfm}
uses MainUnit;

procedure TFmCandidat.Filter_rec;
var s:string;
begin
     myCandidat.Active := False;
     s:='';
     if s_fio.Text<>'' then
      s :='where fio like '+kav+'%'+s_fio.Text+'%'+kav;
     if s_gorod.Text<>'' then
      if s='' then
       s:='where gorod  in (select id from gorod where name like '+kav+'%'+s_gorod.Text+'%'+kav+' ) '
      else
       s:=s+' and gorod  in (select id from gorod where name like '+kav+'%'+s_gorod.Text+'%'+kav+' ) ';
     if s_proff.Text<>'' then
      if s='' then
       s:=' where proff = '+inttostr(s_proff.Value)
      else
       s:=s+' and proff = '+inttostr(s_proff.Value);

      s := 'select * from candidate '+s;
      myCandidat.SQL.Text := s;
      myCandidat.Active := True;
end;


procedure TFmCandidat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if myCandidat.Active then
      if myCandidat.RecordCount>0 then
        myCandidat.CheckBrowseMode;
      Action := caFree;
end;

procedure TFmCandidat.FormCreate(Sender: TObject);
begin
     if id_Scale=1 then
     if screen.Height<>768 then FmCandidat.ChangeScale(Round(screen.Height/768*100), 100);
     top:=1; left:=1;
     Width:=fmMain.ClientWidth-10;
     Height:=fmMain.ClientHeight-75;
end;

procedure TFmCandidat.FormShow(Sender: TObject);
begin
      LoadValues(gorod,'select id, name from gorod');
      LoadValues(vuz,'select id, name from vuz');
      LoadValues(s_proff,'select id, name from proff');
      LoadValues(proff,'select id, name from proff');
      LoadValues(kursi,'select id, name from kursi');


      LoadValues(gCandidat,'gorod','select id, name from gorod');
      gCandidat.Columns[2].Alignment:=taLeftJustify;

      LoadValues(gCandidat,'proff','select id, name from proff');
      gCandidat.Columns[3].Alignment:=taLeftJustify;



       myCandidat.Active := True;
end;

procedure TFmCandidat.gCandidatGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
      if myCandidat.FieldByName('blacklist').AsInteger>0 then
       Background := clRed;

end;

procedure TFmCandidat.gDocDblClick(Sender: TObject);
var name_foto:string;
begin
     if myFoto.Active=false then Exit;
     if myFoto.RecordCount=0 then Exit;
     try
      name_foto := myFoto.FieldByName('name').AsString;
      while Pos('/',name_foto)>0 do
         name_foto:=Copy(name_foto,Pos('/',name_foto)+1,Length(name_foto)-Pos('/',name_foto));
     ShellExecute(Handle, 'open', PChar(dir_file+'ok\'+name_foto), nil, nil, SW_SHOWNORMAL);
     except

     end;
end;

procedure TFmCandidat.gDocExit(Sender: TObject);
begin
     myFoto.CheckBrowseMode;
end;

procedure TFmCandidat.gorodEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var s:string;
    nn:Integer;
begin
     s:='';
  if (InputName('Новый город', 'Название', s,500)) and (s<>'') then
   begin
     nn := ReturnID('gorod',s);
     if (nn=0) and (s<>'') then
     begin
         ExecSQL('insert into gorod (name) values ('+kav+s+kav+')');
         LoadValues(gorod,'select id, name from gorod');
         //nn :=ReturnID('product',s);
     end;
     gorod.Text := s;
   end;
end;

procedure TFmCandidat.myCandidatAfterScroll(DataSet: TDataSet);
begin
      grp2.Caption := 'Подробно № '+myCandidat.FieldByName('id').AsString;
      myFoto.Active := False;
      myFoto.ParamByName('id').AsInteger := myCandidat.FieldByName('id').AsInteger;
      myFoto.Active := True;
end;

procedure TFmCandidat.myCandidatBeforePost(DataSet: TDataSet);
begin
     myCandidat.FieldByName('dt_edit').AsDateTime := Now;
end;

procedure TFmCandidat.pn1Exit(Sender: TObject);
begin
     if myCandidat.Active then
      if myCandidat.RecordCount>0 then
        myCandidat.CheckBrowseMode;
end;

procedure TFmCandidat.proffEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var s:string;
    nn:Integer;
begin
     s:='';
  if (InputName('Новая профессия', 'Название', s,400)) and (s<>'') then
   begin
     nn := ReturnID('proff',s);
     if (nn=0) and (s<>'') then
     begin
         nn := ReturnSQL('select ifnull(max(id),0)+1 from proff');
         ExecSQL('insert into proff (id,name) values ('+inttostr(nn)+','+kav+s+kav+')');
         LoadValues(proff,'select id, name from proff');
         //nn :=ReturnID('product',s);
     end;
     proff.Text := s;
   end;
end;

procedure TFmCandidat.sb1Click(Sender: TObject);
var i:Integer;
begin
      i:= ReturnSQL('select max(id)+1 from candidate');
      myCandidat.Append;
      myCandidat.FieldByName('id').AsInteger := i;
      myCandidat.FieldByName('dt_edit').AsDateTime := Now;
      myCandidat.FieldByName('intern').AsInteger := 0;
      myCandidat.FieldByName('exp_pro').AsInteger := 0;
      myCandidat.FieldByName('exp_farm').AsInteger := 0;
      myCandidat.FieldByName('proff').AsInteger := 0;
      myCandidat.FieldByName('kursi').AsInteger := 0;
      myCandidat.FieldByName('blacklist').AsInteger := 0;
      myCandidat.FieldByName('obrazovanie').AsInteger := 0;
      myCandidat.FieldByName('gorod').AsInteger := 0;
      myCandidat.FieldByName('vuz').AsInteger := 0;

      myCandidat.CheckBrowseMode;
      myCandidat.Edit;
      grp2.Caption := 'Подробно № '+myCandidat.FieldByName('id').AsString;
      myFoto.Active := False;
      myFoto.ParamByName('id').AsInteger := myCandidat.FieldByName('id').AsInteger;
      myFoto.Active := True;
      fio.SetFocus;
end;

procedure TFmCandidat.sb2Click(Sender: TObject);
begin
     if myCandidat.Active = false then Exit;
     if myCandidat.RecordCount = 0  then Exit;
     if DelZap then
      begin
          //удалить файлы если есть
          if myFoto.RecordCount>0 then
          begin
             ShowMessage('Удалите прикрепленный файлы!');
             Exit;
          end;

          myCandidat.Delete;
          myCandidat.CheckBrowseMode;
      end;

end;

procedure TFmCandidat.sb3Click(Sender: TObject);
begin
      Filter_rec;
end;

procedure TFmCandidat.sbDelDocClick(Sender: TObject);
var name_foto:string;
begin
   if not myFoto.Active then Exit;
   if myFoto.RecordCount=0 then Exit;
   name_foto := myFoto.FieldByName('name').AsString;
   while Pos('\',name_foto)>0 do
     name_foto:=Copy(name_foto,Pos('\',name_foto)+1,Length(name_foto)-Pos('\',name_foto));

   if DelZap then
   try
     DeleteFile(dir_file+'ok\'+name_foto);
     myFoto.Delete;
   finally
     myFoto.CheckBrowseMode;
   end;

end;

procedure TFmCandidat.sbInsDocClick(Sender: TObject);
var id_foto:integer;
    name_foto:string;
begin
    if myCandidat.RecordCount=0 then Exit;

    if OpenDialog1.Execute then
    begin
        id_foto:=ReturnSQL('select ifnull(max(id),0)+1 from ru_files');
        name_foto:=OpenDialog1.FileName;
        while Pos('\',name_foto)>0 do
           name_foto:=Copy(name_foto,Pos('\',name_foto)+1,Length(name_foto)-Pos('\',name_foto));

        try
         ShowProgress('Загрузка файла....',50,100);
         CopyFile(PChar(OpenDialog1.FileName),PChar(dir_file+'ok\'+name_foto),false);
         myFoto.Append;
         myFoto.FieldByName('kss_id').AsInteger:=myCandidat.FieldByName('id').AsInteger;
         myFoto.FieldByName('id').AsInteger:=id_foto;
         myFoto.FieldByName('name').AsString:=name_foto;
         myFoto.Post;
         CloseProgress;
        finally
         myFoto.CheckBrowseMode;
         CloseProgress;
        end;
    end;
end;

procedure TFmCandidat.vuzEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var s:string;
    nn:Integer;
begin
     s:='';
  if (InputName('Новое учебное заведение', 'Название', s,700)) and (s<>'') then
   begin
     nn := ReturnID('vuz',s);
     if (nn=0) and (s<>'') then
     begin
         ExecSQL('insert into vuz (name) values ('+kav+s+kav+')');
         LoadValues(vuz,'select id, name from vuz');
         //nn :=ReturnID('product',s);
     end;
     vuz.Text := s;
   end;
end;

end.
