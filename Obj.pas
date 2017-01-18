unit Obj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sPageControl, DB, DBAccess, MyAccess, DBCtrlsEh, StdCtrls,
  sLabel, Mask, Buttons, ExtCtrls, sPanel, DBCtrls, MemDS, sBitBtn, sButton,
  ExtDlgs, DBGridEh, DBLookupEh, DBGridEhGrouping, GridsEh, sGroupBox, ShellAPI,
  frxClass, frxDBSet, frxExportRTF, frxExportPDF, frxRich;

type
  TfmObject = class(TForm)
    dsOb: TMyDataSource;
    id: TDBNumberEditEh;
    l1: TsLabel;
    dt: TDBDateTimeEditEh;
    tip_ob: TDBComboBoxEh;
    status: TDBComboBoxEh;
    region: TDBComboBoxEh;
    rayon: TDBComboBoxEh;
    street: TDBComboBoxEh;
    dom: TDBEditEh;
    orientir: TDBEditEh;
    sp1: TsPanel;
    sp2: TsPanel;
    btn3: TBitBtn;
    btn1: TBitBtn;
    pcOb: TsPageControl;
    tsInfo: TsTabSheet;
    tsArendodatel: TsTabSheet;
    tsFoto: TsTabSheet;
    tsVideo: TsTabSheet;
    tsDocum: TsTabSheet;
    myOb: TMyQuery;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    sLabel9: TsLabel;
    arenda_beg: TDBDateTimeEditEh;
    arenda_end: TDBDateTimeEditEh;
    sLabel10: TsLabel;
    sLabel11: TsLabel;
    sLabel12: TsLabel;
    floor: TDBNumberEditEh;
    sLabel13: TsLabel;
    floors: TDBNumberEditEh;
    pl: TDBNumberEditEh;
    pl_t: TDBNumberEditEh;
    pl_m: TDBNumberEditEh;
    sLabel14: TsLabel;
    sLabel15: TsLabel;
    sLabel16: TsLabel;
    pandus: TDBCheckBoxEh;
    sLabel17: TsLabel;
    stupen: TDBNumberEditEh;
    sLabel18: TsLabel;
    sLabel19: TsLabel;
    dt_prov: TDBDateTimeEditEh;
    dt_osm: TDBDateTimeEditEh;
    voda: TDBCheckBoxEh;
    kanal: TDBCheckBoxEh;
    sanuzel: TDBCheckBoxEh;
    teplo: TDBCheckBoxEh;
    vent: TDBCheckBoxEh;
    kond: TDBCheckBoxEh;
    sLabel20: TsLabel;
    electro_kvt: TDBNumberEditEh;
    sLabel21: TsLabel;
    electro_faz: TDBNumberEditEh;
    sLabel22: TsLabel;
    price: TDBNumberEditEh;
    sLabel23: TsLabel;
    kvm: TDBNumberEditEh;
    img1: TImage;
    btn4: TsButton;
    btnPr: TsButton;
    btnNext: TsButton;
    btn2: TsButton;
    btNew: TsBitBtn;
    btDel: TsBitBtn;
    dlgOpenPic1: TOpenPictureDialog;
    myFoto: TMyQuery;
    dsMyFoto: TMyDataSource;
    sLabel24: TsLabel;
    sLabel25: TsLabel;
    sLabel26: TsLabel;
    edtINN: TDBEditEh;
    sLabel27: TsLabel;
    edtpasport: TDBEditEh;
    sLabel28: TsLabel;
    nalog: TDBLookupComboboxEh;
    sLabel29: TsLabel;
    edtnom_reg: TDBEditEh;
    sLabel30: TsLabel;
    edtfio: TDBEditEh;
    sLabel31: TsLabel;
    edttel: TDBEditEh;
    edtAdres: TDBEditEh;
    sLabel32: TsLabel;
    sLabel33: TsLabel;
    edtemail: TDBEditEh;
    myArenda: TMyQuery;
    dsArenda: TMyDataSource;
    tip_ur: TDBComboBoxEh;
    edtName: TDBEditEh;
    sLabel34: TsLabel;
    arendodatel: TDBComboBoxEh;
    spUsers: TsPanel;
    sbPlusVideo: TsBitBtn;
    sbDelVideo: TsBitBtn;
    gVideo: TDBGridEh;
    btn5: TBitBtn;
    btn6: TBitBtn;
    grp1: TsGroupBox;
    sLabel35: TsLabel;
    sLabel36: TsLabel;
    pr_close: TDBComboBoxEh;
    my1: TMyQuery;
    date_close: TDBDateTimeEditEh;
    pnDoc: TsPanel;
    sbInsDoc: TsBitBtn;
    sbDelDoc: TsBitBtn;
    OpenDialog1: TOpenDialog;
    DBEditEh1: TDBEditEh;
    gDoc: TDBGridEh;
    City: TDBComboBoxEh;
    sLabel37: TsLabel;
    stena: TDBComboBoxEh;
    sLabel38: TsLabel;
    istok: TDBComboBoxEh;
    sLabel39: TsLabel;
    users: TDBComboBoxEh;
    bt1: TsBitBtn;
    sLabel40: TsLabel;
    edt_arenda: TDBEditEh;
    RepOb: TfrxReport;
    btn7: TsButton;
    RepDB: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    RepDBA: TfrxDBDataset;
    bti: TDBCheckBoxEh;
    dbmmoinfo: TDBMemo;
    sLabel41: TsLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure regionChange(Sender: TObject);
    procedure priceChange(Sender: TObject);
    procedure plChange(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btnPrClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure pcObChange(Sender: TObject);
    procedure tsFotoExit(Sender: TObject);
    procedure tsArendodatelExit(Sender: TObject);
    procedure arendodatelEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure arendodatelCloseUp(Sender: TObject; Accept: Boolean);
    procedure regionEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure sbPlusVideoClick(Sender: TObject);
    procedure DBEditEh1Exit(Sender: TObject);
    procedure sbDelVideoClick(Sender: TObject);
    procedure gVideoExit(Sender: TObject);
    procedure gVideoDblClick(Sender: TObject);
    procedure CityChange(Sender: TObject);
    procedure sbInsDocClick(Sender: TObject);
    procedure sbDelDocClick(Sender: TObject);
    procedure CityEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure rayonEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure streetEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure img1DblClick(Sender: TObject);
    procedure bt1Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure RepObGetValue(const VarName: string; var Value: Variant);
    procedure edt_arendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_arendaEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    new_ob:Boolean;
  end;

var
  fmObject: TfmObject;

implementation

{$R *.dfm}
Uses MainUnit,maps;

procedure TfmObject.arendodatelCloseUp(Sender: TObject; Accept: Boolean);
begin
     myArenda.Active := false;
     myArenda.ParamByName('id').AsInteger := arendodatel.Value;
     myArenda.Active := true;
end;

procedure TfmObject.arendodatelEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var nn:Integer;
begin
     ShowMessage('Новый Арендодатель');
     nn:=ReturnSQL('select ifnull(max(id),0)+1 from arendodatel');
     ExecSQL('insert into arendodatel (id,name) values('+inttostr(nn)+','+kav+'Новый арендодатель'+kav+')');
     LoadValues(Arendodatel,'select id,name from arendodatel');
     arendodatel.Value:=nn;
     myArenda.Active:=False;
     myArenda.ParamByName('id').AsInteger := arendodatel.Value;
     myArenda.Active:=True;
     edtName.SetFocus;
end;

procedure TfmObject.bt1Click(Sender: TObject);
begin
      id_obj:=id.Value;
      if FormExists(TfmMaps) then exit;
      LockWindowUpdate(Application.MainForm.Handle);
      Application.CreateForm(TfmMaps,fmMaps);
      LockWindowUpdate(0);
      fmMaps.ShowModal;
      if id_obj<>id.Value then
      begin
        myOb.ParamByName('id').AsInteger:=id_obj;
        myOb.Active:=False;
        myOb.Active:=True;
      {  if City.Text<>'' then
        begin
         LoadValues(street,'select id,if(old_name>'+kav+kav+',concat(name,'+kav+'/'+kav+',old_name),name) from street where city='+inttostr(city.Value));
         street.Value:=street.Value;
        end;
        if dt.Value=null then dt.Value:=Now();
        if users.Value=0 then users.Value:=user;}
      end;
end;

procedure TfmObject.btDelClick(Sender: TObject);
begin
   if not myFoto.Active then Exit;
   if myFoto.RecordCount=0 then Exit;

   if DelZap then
   try
     DeleteFile(dir_file+myFoto.FieldByName('name').AsString);
     myFoto.Delete;
   finally
     myFoto.CheckBrowseMode;
   end;
   if myFoto.RecordCount>0 then
     img1.Picture.LoadFromFile(dir_file+myFoto.FieldByName('name').AsString)
   else
     img1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'no_foto.jpg');
end;

procedure TfmObject.btn1Click(Sender: TObject);
begin
      Close;
end;

procedure TfmObject.btn2Click(Sender: TObject);
begin
     if myFoto.Active then
      begin
       myFoto.Last;
       img1.Picture.LoadFromFile(dir_file+myFoto.FieldByName('name').AsString);
      end;
end;

procedure TfmObject.btn3Click(Sender: TObject);
begin
      if myArenda.Active then myArenda.CheckBrowseMode;
      myOb.CheckBrowseMode;
      new_ob:=False;
      Close;
end;

procedure TfmObject.btn4Click(Sender: TObject);
begin
    if myFoto.Active then
     begin
      myFoto.First;
      img1.Picture.LoadFromFile(dir_file+myFoto.FieldByName('name').AsString);
     end;
end;

procedure TfmObject.btn5Click(Sender: TObject);
begin
     if tip_user<3 then
     status.Value:=3;
end;

procedure TfmObject.btn6Click(Sender: TObject);
begin
     if tip_user<3 then
     status.Value:=5;
end;

procedure TfmObject.btn7Click(Sender: TObject);
begin
      myArenda.Active:=False;
      myArenda.ParamByName('id').AsInteger := arendodatel.Value;
      myArenda.Active:=True;
      RepOb.ShowReport();
end;

procedure TfmObject.btNewClick(Sender: TObject);
var id_foto:integer;
    name_foto:string;
begin
    if dlgOpenPic1.Execute then
    begin
        id_foto:=ReturnSQL('select ifnull(max(id_file),0)+1 from file where id='+id.Text);
        name_foto:=dlgOpenPic1.FileName;
        while Pos('.',name_foto)>0 do
           name_foto:=Copy(name_foto,Pos('.',name_foto)+1,Length(name_foto)-Pos('.',name_foto));
        name_foto:=ID.Text+'_'+inttostr(id_foto)+'.'+name_foto;

        try
         CopyFile(PChar(dlgOpenPic1.FileName),PChar(dir_file+name_foto),false);
         img1.Picture.LoadFromFile(dir_file+name_foto);
         myFoto.Insert;
         myFoto.FieldByName('id').AsInteger:=ID.Value;
         myFoto.FieldByName('id_file').AsInteger:=id_foto;
         myFoto.FieldByName('name').AsString:=name_foto;
         myFoto.FieldByName('tip').AsInteger:=1;
         myFoto.FieldByName('nfile').AsString:=dlgOpenPic1.FileName;
         myFoto.Post;
        finally
         myFoto.CheckBrowseMode;
        end;
    end;
end;

procedure TfmObject.btnNextClick(Sender: TObject);
begin
     if myFoto.Active then
      begin
       myFoto.Next;
       img1.Picture.LoadFromFile(dir_file+myFoto.FieldByName('name').AsString);
      end;
end;

procedure TfmObject.btnPrClick(Sender: TObject);
begin
     if myFoto.Active then
      begin
       myFoto.Prior;
       img1.Picture.LoadFromFile(dir_file+myFoto.FieldByName('name').AsString);
      end;
end;

procedure TfmObject.CityChange(Sender: TObject);
begin
      if (City.Text<>'') and (City.Focused) then
       LoadValues(street,'select id,if(old_name>'+kav+kav+',concat(name,'+kav+'/'+kav+',old_name),name) from street where city='+inttostr(city.Value));
   // ShowMessage(region.Text+ City.Text);

end;

procedure TfmObject.CityEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var s:string;
    nn:Integer;
begin
  if region.Value=0 then
  begin
     ShowMessage('Выберите область');
     region.SetFocus;
     Exit;
  end;
  s:='';
  if (InputQuery('Область '+Region.Text, 'Новый город', s)) and (s<>'') then
   begin
     nn:=ReturnID('city',s);
     if nn=0 then
     begin
         nn := ReturnSQL('select ifnull(max(id),0)+1 from city');
         My1.Active:=false;
         My1.SQL.Clear;
         My1.Params.Clear;
         my1.SQL.Text:='insert into city (id,region,name) values(:id,:region,:name)';
         my1.Params.CreateParam(ftInteger,'id',ptInput);
         my1.Params.CreateParam(ftInteger,'region',ptInput);
         my1.Params.CreateParam(ftString,'name',ptInput);
         my1.ParamByName('id').AsInteger:=nn;
         my1.ParamByName('region').AsInteger:=region.Value;
         my1.ParamByName('name').AsString:=s;
         my1.Execute;
         my1.Active:=False;
         LoadValues(city,'select id, name from city where region = '+inttostr(region.Value));
         city.Value:=nn;
     end;
         LoadValues(city,'select id, name from city where region = '+inttostr(region.Value));
     City.Value:=nn;
   end;
end;

procedure TfmObject.DBEditEh1Exit(Sender: TObject);
begin
     if myFoto.Active then myFoto.CheckBrowseMode;
end;

procedure TfmObject.edt_arendaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
        if ReturnSQL('select count(*) from arendodatel where name like '+kav+'%'+edt_arenda.Text+'%'+kav)>0 then
        begin
         LoadValues(arendodatel,'select id,name from arendodatel where name like '+kav+'%'+edt_arenda.Text+'%'+kav);
         arendodatel.SetFocus;
         arendodatel.DropDown;
        end;
end;

procedure TfmObject.edt_arendaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=13)and(edt_arenda.Text<>'')  then
     begin
        if ReturnSQL('select count(*) from arendodatel where name like '+kav+'%'+edt_arenda.Text+'%'+kav+
                     ' or tel like '+kav+'%'+edt_arenda.Text+'%'+kav )>0 then
        begin
        LoadValues(arendodatel,'select id,concat(name,'+kav+' тел. '+kav+',tel) from arendodatel where name like '+kav+'%'+edt_arenda.Text+'%'+kav+
                                ' or tel like '+kav+'%'+edt_arenda.Text+'%'+kav);
        arendodatel.SetFocus;
        arendodatel.DropDown;
        end;
     end;

end;

procedure TfmObject.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if new_ob then
      begin
       myOb.Delete;
 //      myOb.CheckBrowseMode;
      end;
      Action := caFree;
end;

procedure TfmObject.FormCreate(Sender: TObject);
begin
     if id_Scale=1 then
     if screen.Height<>768 then fmObject.ChangeScale(Round(screen.Height/768*100), 100);
     top:=1; left:=1;
     Width:=fmMain.ClientWidth-10;
     Height:=fmMain.ClientHeight-75;
     RemoveAll(dfile);

end;

procedure TfmObject.FormShow(Sender: TObject);
begin
      myOb.Active:=False;
      LoadValues(tip_ob,'select id, name from tip_ob');
      LoadValues(status,'select id, name from status_ob');
      LoadValues(region,'select id, name from region');
      LoadValues(city,'select id, name from city');
      LoadValues(rayon,'select id, name from rayon');
      LoadValues(street,'select id,if(old_name>'+kav+kav+',concat(name,'+kav+'/'+kav+',old_name),name) from street');
      LoadValues(Arendodatel,'select id,concat(name,'+kav+' тел. '+kav+',tel) from arendodatel');
      LoadValues(pr_close,'select id, name from otkaz');
      LoadValues(stena,'select id, name from tip_stena');
      LoadValues(istok,'select id, name from istok');
      LoadValues(users,'select id, name from users');
      LoadValues(tip_ur,'select id,name from tip_ur');

      myOb.Active:=True;
      if City.Text<>'' then
      begin
       LoadValues(street,'select id,if(old_name>'+kav+kav+',concat(name,'+kav+'/'+kav+',old_name),name) from street where city = '+IntToStr(City.Value));
       street.Value:=street.Value;
      end;

      if dt.Value=null then dt.Value:=Now();
      if users.Value=0 then users.Value:=user;

      sp1.Height := fmObject.Height - (price.Top + 70);

end;

procedure TfmObject.gVideoDblClick(Sender: TObject);
begin
     if myFoto.Active=false then Exit;
     if myFoto.RecordCount=0 then Exit;
     try
     CopyFile(PChar(dir_file+myFoto.FieldByName('name').AsString),PChar(dfile+myFoto.FieldByName('name').AsString),false);
     ShellExecute(Handle, 'open', PChar(dfile+myFoto.FieldByName('name').AsString), nil, nil, SW_SHOWNORMAL);
     except

     end;
end;

procedure TfmObject.gVideoExit(Sender: TObject);
begin
      if myFoto.Active then myFoto.CheckBrowseMode;

end;

procedure TfmObject.img1DblClick(Sender: TObject);

begin
     if myFoto.Active=false then Exit;
     if myFoto.RecordCount=0 then Exit;
     try
     CopyFile(PChar(dir_file+myFoto.FieldByName('name').AsString),PChar(dfile+myFoto.FieldByName('name').AsString),false);
     ShellExecute(Handle, 'open', PChar(dfile+myFoto.FieldByName('name').AsString), nil, nil, SW_SHOWNORMAL);
     except

     end;
end;

procedure TfmObject.pcObChange(Sender: TObject);
begin
     myFoto.Active:=False;
     myArenda.Active:=False;

     if pcOb.ActivePage=TsFoto then
     begin
        myFoto.ParamByName('tip').AsInteger:=1;
        if ID.Text<>'' then  myFoto.ParamByName('id').AsInteger := ID.Value
        else                 myFoto.ParamByName('id').AsInteger := 0;
        myFoto.Active:=True;
        if myFoto.RecordCount=0 then img1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'no_foto.jpg')
        else                         img1.Picture.LoadFromFile(dir_file+myFoto.FieldByName('name').AsString);
     end;

     if pcOb.ActivePage=tsArendodatel then
     begin
        if arendodatel.Value<>0 then  myArenda.ParamByName('id').AsInteger := arendodatel.Value
        else                          myArenda.ParamByName('id').AsInteger := 0;
        myArenda.Active:=True;
        if myArenda.RecordCount=0  then myArenda.Active:=False;
          arendodatel.SetFocus;
     end;

     if pcOb.ActivePage = tsVideo then
     begin
        myFoto.ParamByName('tip').AsInteger:=2;
        myFoto.ParamByName('id').AsInteger := ID.Value;
        myFoto.Active:=True;
        OpenDialog1.Filter:='Видео|*.avi;*.wmv;*.3gp;*.flv;*.mp4;*.mov|Все|*.*';
     end;

     if pcOb.ActivePage = tsDocum then
     begin
        myFoto.ParamByName('tip').AsInteger:=3;
        myFoto.ParamByName('id').AsInteger := ID.Value;
        myFoto.Active:=True;
        OpenDialog1.Filter:='Документы|*.doc;*.docx;*.xls;*.xlsx;*.ppt;*.pptx;*.pdf|Все|*.*';

     end;

end;

procedure TfmObject.plChange(Sender: TObject);
begin
     if (price.Text<>'') and (price.value<>0) then
      if (pl.Text<>'') and (pl.Value<>0) then kvm.Value:=price.Value/pl.Value;
end;

procedure TfmObject.priceChange(Sender: TObject);
begin
     if (price.Text<>'') and (price.value<>0) then
      if (pl.Text<>'') and (pl.Value<>0) then kvm.Value:=price.Value/pl.Value;
end;

procedure TfmObject.rayonEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var s:string;
    nn:Integer;
begin
     s:='';
  if (InputQuery('Новый район', 'Наименование', s)) and (s<>'') then
   begin
     nn:=ReturnID('rayon',s);
     if nn=0 then
     begin
         nn := ReturnSQL('select ifnull(max(id),0)+1 from rayon');
         My1.Active:=false;
         My1.SQL.Clear;
         My1.Params.Clear;
         my1.SQL.Text:='insert into rayon (id,name) values(:id,:name)';
         my1.Params.CreateParam(ftInteger,'id',ptInput);
         my1.Params.CreateParam(ftString,'name',ptInput);
         my1.ParamByName('id').AsInteger:=nn;
         my1.ParamByName('name').AsString:=s;
         my1.Execute;
         my1.Active:=False;
         LoadValues(rayon,'select id, name from rayon');
         rayon.Value:=nn;
     end;
     LoadValues(rayon,'select id, name from rayon');
     rayon.Value:=nn;

   end;
end;

procedure TfmObject.regionChange(Sender: TObject);
begin
      if region.Text<>'' then
       LoadValues(city,'select id, name from city where region='+inttostr(region.Value));
 //     city.Value:=city.Value;

end;

procedure TfmObject.regionEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var s:string;
    nn:Integer;
begin
     s:='';
  if (InputQuery('Новая область', 'Наименование', s)) and (s<>'') then
   begin
     nn:=ReturnID('region',s);
     if nn=0 then
     begin
         nn := ReturnSQL('select ifnull(max(id),0)+1 from region');
         My1.Active:=false;
         My1.SQL.Clear;
         My1.Params.Clear;
         my1.SQL.Text:='insert into region (id,name) values(:id,:name)';
         my1.Params.CreateParam(ftInteger,'id',ptInput);
         my1.Params.CreateParam(ftString,'name',ptInput);
         my1.ParamByName('id').AsInteger:=nn;
         my1.ParamByName('name').AsString:=s;
         my1.Execute;
         my1.Active:=False;
         LoadValues(region,'select id, name from region');
         region.Value:=nn;
     end;
     LoadValues(region,'select id, name from region');
     region.Value:=nn;

   end;

end;

procedure TfmObject.RepObGetValue(const VarName: string; var Value: Variant);
begin
      if VarName='region' then Value:=region.Text;
      if VarName='city' then Value:=city.Text;
      if VarName='street' then Value:=street.Text;

      if VarName='fio_ur' then
       begin
         Value := edtfio.Text;
       end;
      if VarName='tip_ur' then
       begin
         Value := tip_ur.Text;
         Value := Value+'  '+EdtName.Text;
       end;

      if VarName='tel' then
       begin
         Value := 'тел. '+edtTel.Text;
         if edtemail.Text<>'' then
           Value := Value+'  email:'+edtemail.Text;
       end;

      if VarName='tip_ob' then Value:=tip_ob.Text;

      if VarName='bti' then
        if bti.Checked then Value := 'Есть' else Value := 'Нет';

      if VarName='electro' then
       begin
         Value := Electro_kvt.Text+' кВт ';
         Value := Value+'  фаз - '+Electro_faz.Text;
       end;

      if VarName='teplo' then
        if teplo.Checked then Value := 'Есть' else Value := 'Нет';

      if VarName='vent' then
       begin
          if kond.Checked then Value := 'Есть' else Value := 'Нет';
          if vent.Checked then Value := Value +' / Есть' else Value := Value + ' / Нет';
       end;

      if VarName='sanuzel' then
       begin
          if kanal.Checked then Value := 'Есть' else Value := 'Нет';
          if sanuzel.Checked then Value := Value +' / Есть' else Value := Value + ' / Нет';
       end;

      if VarName='stupen' then if stupen.Value>0 then Value:=stupen.Text else Value:='Нет';

      if VarName='pandus' then
        if pandus.Checked then Value := 'Есть' else Value := 'Нет';

      if VarName='stena' then Value:=stena.Text;

end;

procedure TfmObject.sbDelDocClick(Sender: TObject);
begin
   if not myFoto.Active then Exit;
   if myFoto.RecordCount=0 then Exit;

   if DelZap then
   try
     DeleteFile(dir_file+myFoto.FieldByName('name').AsString);
     myFoto.Delete;
   finally
     myFoto.CheckBrowseMode;
   end;
end;

procedure TfmObject.sbDelVideoClick(Sender: TObject);
begin
   if not myFoto.Active then Exit;
   if myFoto.RecordCount=0 then Exit;

   if DelZap then
   try
     DeleteFile(dir_file+myFoto.FieldByName('name').AsString);
     myFoto.Delete;
   finally
     myFoto.CheckBrowseMode;
   end;

end;

procedure TfmObject.sbInsDocClick(Sender: TObject);
var id_foto:integer;
    name_foto:string;
begin
    if OpenDialog1.Execute then
    begin
        id_foto:=ReturnSQL('select ifnull(max(id_file),0)+1 from file where id='+id.Text);
        name_foto:=OpenDialog1.FileName;
        while Pos('.',name_foto)>0 do
           name_foto:=Copy(name_foto,Pos('.',name_foto)+1,Length(name_foto)-Pos('.',name_foto));
        name_foto:=ID.Text+'_'+inttostr(id_foto)+'.'+name_foto;

        try
         ShowProgress('Загрузка файла....',50,100);
         CopyFile(PChar(OpenDialog1.FileName),PChar(dir_file+name_foto),false);
         myFoto.Append;
         myFoto.FieldByName('id').AsInteger:=ID.Value;
         myFoto.FieldByName('id_file').AsInteger:=id_foto;
         myFoto.FieldByName('name').AsString:=name_foto;
         myFoto.FieldByName('tip').AsInteger:=3;
         myFoto.FieldByName('fname').AsString:=OpenDialog1.FileName;
         myFoto.Post;
         CloseProgress;
        finally
         myFoto.CheckBrowseMode;
         CloseProgress;
        end;
    end;
end;

procedure TfmObject.sbPlusVideoClick(Sender: TObject);
var id_foto:integer;
    name_foto:string;
begin
    if OpenDialog1.Execute then
    begin
        id_foto:=ReturnSQL('select ifnull(max(id_file),0)+1 from file where id='+id.Text);
        name_foto:=OpenDialog1.FileName;
        while Pos('.',name_foto)>0 do
           name_foto:=Copy(name_foto,Pos('.',name_foto)+1,Length(name_foto)-Pos('.',name_foto));
        name_foto:=ID.Text+'_'+inttostr(id_foto)+'.'+name_foto;

        try
         ShowProgress('Загрузка файла....',50,100);
         CopyFile(PChar(OpenDialog1.FileName),PChar(dir_file+name_foto),false);
         myFoto.Append;
         myFoto.FieldByName('id').AsInteger:=ID.Value;
         myFoto.FieldByName('id_file').AsInteger:=id_foto;
         myFoto.FieldByName('name').AsString:=name_foto;
         myFoto.FieldByName('tip').AsInteger:=2;
         myFoto.FieldByName('fname').AsString:=OpenDialog1.FileName;
         myFoto.Post;
         CloseProgress;
        finally
         myFoto.CheckBrowseMode;
         CloseProgress;
        end;
    end;
end;

procedure TfmObject.streetEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var s:string;
    nn:Integer;
begin
  if (city.Value=0) or (City.Text='') then
  begin
     ShowMessage('Выберите город');
     City.SetFocus;
     Exit;
  end;
  s:='';
  if (InputQuery('Город '+City.Text, 'Новая улица', s)) and (s<>'') then
   begin
     nn:=ReturnID('street',s);
     if nn=0 then
     begin
         nn := ReturnSQL('select ifnull(max(id),0)+1 from street');
         My1.Active:=false;
         My1.SQL.Clear;
         My1.Params.Clear;
         my1.SQL.Text:='insert into street (id,city,name) values(:id,:city,:name)';
         my1.Params.CreateParam(ftInteger,'id',ptInput);
         my1.Params.CreateParam(ftInteger,'city',ptInput);
         my1.Params.CreateParam(ftString,'name',ptInput);
         my1.ParamByName('id').AsInteger:=nn;
         my1.ParamByName('city').AsInteger:=city.Value;
         my1.ParamByName('name').AsString:=s;
         my1.Execute;
         my1.Active:=False;
         LoadValues(street,'select id,if(old_name>'+kav+kav+',concat(name,'+kav+'/'+kav+',old_name),name) from street where city = '+IntToStr(City.Value));
         street.Value:=nn;
     end;
     LoadValues(street,'select id,if(old_name>'+kav+kav+',concat(name,'+kav+'/'+kav+',old_name),name) from street where city = '+IntToStr(City.Value));
     street.Value:=nn;
   end;end;

procedure TfmObject.tsArendodatelExit(Sender: TObject);
begin
     if myArenda.Active then myArenda.CheckBrowseMode;
end;

procedure TfmObject.tsFotoExit(Sender: TObject);
begin
     if myFoto.Active then myFoto.CheckBrowseMode;
end;

end.
