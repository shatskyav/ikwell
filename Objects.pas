unit Objects;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ExtCtrls, sPanel, GridsEh, DBGridEh, StdCtrls,
  sGroupBox, Buttons, sBitBtn, MemTableDataEh, Db, DBAccess, MyAccess, MemDS,
  DataDriverEh, MemTableEh, Mask, DBCtrlsEh, sLabel, Menus;

type
  TfmObjects = class(TForm)
    grpVibor: TsGroupBox;
    grpObjects: TsGroupBox;
    gObject: TDBGridEh;
    sp1: TsPanel;
    sBitBtn1: TsBitBtn;
    sbtNew: TsBitBtn;
    cbStatus: TDBComboBoxEh;
    mtObject: TMemTableEh;
    ddObject: TDataSetDriverEh;
    myObject: TMyQuery;
    dsObject: TMyDataSource;
    myCity: TMyQuery;
    dsCity: TMyDataSource;
    lStatus: TsLabel;
    lRegion: TsLabel;
    cbRegion: TDBComboBoxEh;
    cbCity: TDBComboBoxEh;
    sLabel1: TsLabel;
    pm1: TPopupMenu;
    N1: TMenuItem;
    bt1: TsBitBtn;
    sLabel2: TsLabel;
    cbUser: TDBComboBoxEh;
    sLabel3: TsLabel;
    cbId: TDBComboBoxEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbStatusChange(Sender: TObject);
    procedure gObjectApplyFilter(Sender: TObject);
    procedure cbRegionChange(Sender: TObject);
    procedure cbStatusDblClick(Sender: TObject);
    procedure cbRegionDblClick(Sender: TObject);
    procedure sbtNewClick(Sender: TObject);
    procedure cbCityDblClick(Sender: TObject);
    procedure cbCityChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure cbUserChange(Sender: TObject);
    procedure cbUserDblClick(Sender: TObject);
    procedure cbIdChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FilterObject;
  end;

var
  fmObjects: TfmObjects;

implementation

{$R *.dfm}
uses MainUnit, Obj;

procedure TfmObjects.FilterObject;
begin
  myObject.ParamByName('id').AsInteger := 0;
  myObject.ParamByName('status').AsInteger := 0;
  myObject.ParamByName('region').AsInteger := 0;
  myObject.ParamByName('city').AsInteger := 0;
  myObject.ParamByName('user').AsInteger := 0;


  if cbId.Text<>'' then
  begin
     myObject.ParamByName('id').AsInteger := cbId.Value;
     if True then
   if tip_user>3 then
     begin
     myObject.ParamByName('user').AsInteger := User;
     if cbUser.Value<>user then cbUser.Value := User;
     end
  end
  else
  begin
   if cbStatus.Text<>'' then
     myObject.ParamByName('status').AsInteger := cbStatus.Value;
   if cbRegion.Text<>'' then
     myObject.ParamByName('region').AsInteger := cbRegion.Value;
   if cbCity.Text<>'' then
     myObject.ParamByName('city').AsInteger := cbCity.Value;

   if cbUser.Text<>'' then
   if tip_user>3 then
     begin
     myObject.ParamByName('user').AsInteger := User;
     if cbUser.Value<>user then cbUser.Value := User;
     end
   else
     myObject.ParamByName('user').AsInteger := cbUser.Value;
  end;



end;


procedure TfmObjects.cbCityChange(Sender: TObject);
begin
     myObject.Active := False;
     FilterObject;
     myObject.Active := True;
end;

procedure TfmObjects.cbCityDblClick(Sender: TObject);
begin
     cbCity.Value := 0;
end;

procedure TfmObjects.cbIdChange(Sender: TObject);
begin
     myObject.Active := False;
     FilterObject;
     myObject.Active := True;

end;

procedure TfmObjects.cbRegionChange(Sender: TObject);
begin
     myObject.Active := False;
     if cbRegion.Value = 0  then
      LoadValues(cbCity,'select id, name from city')
     else
      LoadValues(cbCity,'select id, name from city where region = '+inttostr(cbRegion.Value));
     FilterObject;
     myObject.Active := True;
end;

procedure TfmObjects.cbRegionDblClick(Sender: TObject);
begin
      cbRegion.Value := 0;

end;

procedure TfmObjects.cbStatusChange(Sender: TObject);
begin
     myObject.Active := False;
     FilterObject;
     myObject.Active := True;
end;

procedure TfmObjects.cbStatusDblClick(Sender: TObject);
begin
     cbStatus.Value := 0;
end;

procedure TfmObjects.cbUserChange(Sender: TObject);
begin
     myObject.Active := False;
     FilterObject;
     myObject.Active := True;
end;

procedure TfmObjects.cbUserDblClick(Sender: TObject);
begin
      if tip_user>3 then Exit;
      cbUser.Value:=0;

end;

procedure TfmObjects.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action := caFree;

end;

procedure TfmObjects.FormCreate(Sender: TObject);
begin
   if id_Scale=1 then
   if screen.Height<>768 then fmObjects.ChangeScale(Round(screen.Height/768*100), 100);
   top:=1; left:=1;
   Width:=fmMain.ClientWidth-10;
   Height:=fmMain.ClientHeight-75;

end;

procedure TfmObjects.FormShow(Sender: TObject);
begin
     LoadValues(cbId,'select id,id from object order by id');
     LoadValues(cbStatus,'select id,name from status_ob');
     cbStatus.KeyItems.Add('0');
     cbStatus.Items.Add('Все');
     if tip_user=1 then
      cbStatus.KeyItems.Add('99');
      cbStatus.Items.Add('Удаленные');



     cbStatus.Value:=1;
     LoadValues(cbRegion,'select id,name from region order by name');
     LoadValues(cbCity,'select id, name from city');
     LoadValues(cbUser,'select id, name from users');
     if tip_user>3 then
      begin
        cbUser.ReadOnly:=True;
        cbUser.Value:=user;
      end;

     LoadValues(gObject,'region','select id, name from region');
     LoadValues(gObject,'city','select id, name from city');
     LoadValues(gObject,'rayon','select id, name from rayon');
     LoadValues(gObject,'street','select id,if(old_name>'+kav+kav+',concat(name,'+kav+'/'+kav+',old_name),name) from street');
     LoadValues(gObject,'arendodatel','select id, name from arendodatel');

     gObject.Columns[2].Alignment:=taLeftJustify;
     gObject.Columns[3].Alignment:=taLeftJustify;
     gObject.Columns[4].Alignment:=taLeftJustify;
     gObject.Columns[5].Alignment:=taLeftJustify;
     gObject.Columns[8].Alignment:=taLeftJustify;



     myCity.Active := True;
end;

procedure TfmObjects.gObjectApplyFilter(Sender: TObject);
begin
     GridFilter(gObject,myObject);
end;

procedure TfmObjects.N1Click(Sender: TObject);
begin
     if myObject.Active = false then Exit;
     if myObject.RecordCount = 0  then Exit;
     if DelZap then
      begin
        if tip_user=1 then
         ExecSQL('delete from object where id = '+inttostr(myObject.FieldByName('id').AsInteger))
        else
         ExecSQL('update object set status=99 where id = '+inttostr(myObject.FieldByName('id').AsInteger));

        myObject.Active := False;
        myObject.Active := True;
      end;

end;

procedure TfmObjects.sBitBtn1Click(Sender: TObject);
begin
  if myObject.RecordCount=0 then Exit;

  if FormExists(TfmObject) then exit;
  LockWindowUpdate(Application.MainForm.Handle);
  Application.CreateForm(TfmObject,fmObject);
  LockWindowUpdate(0);
  fmObject.myOb.ParamByName('id').AsInteger:=myObject.FieldByName('id').AsInteger;
  fmObject.new_ob := False;
  fmObject.ShowModal;
  myObject.Active := False;

     LoadValues(cbRegion,'select id,name from region order by name');
     LoadValues(cbCity,'select id, name from city');

     LoadValues(gObject,'region','select id, name from region');
     LoadValues(gObject,'city','select id, name from city');
     LoadValues(gObject,'rayon','select id, name from rayon');
     LoadValues(gObject,'street','select id,if(old_name>'+kav+kav+',concat(name,'+kav+'/'+kav+',old_name),name) from street');
     LoadValues(gObject,'arendodatel','select id, name from arendodatel');

     gObject.Columns[2].Alignment:=taLeftJustify;
     gObject.Columns[3].Alignment:=taLeftJustify;
     gObject.Columns[4].Alignment:=taLeftJustify;
     gObject.Columns[5].Alignment:=taLeftJustify;
     gObject.Columns[8].Alignment:=taLeftJustify;

  myObject.Active := True;
end;

procedure TfmObjects.sbtNewClick(Sender: TObject);
var i:Integer;
begin

  if Not myObject.Active then Exit;
  i:=ReturnSQL('select Max(id)+1 from object');
  ExecSQL('insert into object (id,status) values('+inttostr(i)+',1)');

  if FormExists(TfmObject) then exit;
  LockWindowUpdate(Application.MainForm.Handle);
  Application.CreateForm(TfmObject,fmObject);
  LockWindowUpdate(0);
  fmObject.myOb.ParamByName('id').AsInteger:=i;
  fmObject.new_ob := True;
  fmObject.ShowModal;
  myObject.Active := False;
  myObject.Active := True;

end;

end.
