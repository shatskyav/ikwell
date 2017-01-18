unit Users;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sPageControl, ExtCtrls, sPanel, DBGridEhGrouping, GridsEh,
  DBGridEh, DB, DBAccess, MyAccess, MemDS, StdCtrls, sGroupBox, Buttons, sBitBtn;

type
  TfmUsers = class(TForm)
    pcUsers: TsPageControl;
    tsUsers: TsTabSheet;
    tsTip: TsTabSheet;
    spUsers: TsPanel;
    spTip: TsPanel;
    gUsers: TDBGridEh;
    gTip: TDBGridEh;
    tsRayon: TsTabSheet;
    myUser: TMyQuery;
    myTip: TMyQuery;
    dsUser: TMyDataSource;
    dsTip: TMyDataSource;
    sbtnPlus: TsBitBtn;
    sbtnMinus: TsBitBtn;
    sbtPtip: TsBitBtn;
    sbtMTip: TsBitBtn;
    grpUsers: TsGroupBox;
    gUser: TDBGridEh;
    myOtdel: TMyQuery;
    dsOtdel: TMyDataSource;
    pn1: TsPanel;
    sb1: TsBitBtn;
    sb2: TsBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcUsersChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnMinusClick(Sender: TObject);
    procedure sbtnPlusClick(Sender: TObject);
    procedure sbtMTipClick(Sender: TObject);
    procedure sbtPtipClick(Sender: TObject);
    procedure sb1Click(Sender: TObject);
    procedure sb2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmUsers: TfmUsers;

implementation

{$R *.dfm}
uses MainUnit;

procedure TfmUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     myUser.CheckBrowseMode;
     myTip.CheckBrowseMode;
     myUser.Active:=False;
     myTip.Active:=False;
     Action:= caFree;
end;

procedure TfmUsers.FormCreate(Sender: TObject);
begin
     if id_Scale=1 then
     if screen.Height<>768 then FmUsers.ChangeScale(Round(screen.Height/768*100), 100);
end;

procedure TfmUsers.FormShow(Sender: TObject);
begin
     myUser.Active:=True;
     myTip.Active:=True;
     myOtdel.Active:=True;
     LoadValues(gUsers,'tip','select id, name from tip_users');
     LoadValues(gUsers,'otdel','select id, name from otdel');


end;

procedure TfmUsers.pcUsersChange(Sender: TObject);
begin
     myUser.CheckBrowseMode;
     myTip.CheckBrowseMode;
     myOtdel.CheckBrowseMode;
     ExecSQL('delete from tip_users where (name='+kav+kav+' or name is null)');
     myTip.Refresh;
     ExecSQL('delete from otdel where (name='+kav+kav+' or name is null)');
     myOtdel.Refresh;
     ExecSQL('delete from users where (name='+kav+kav+' or name is null)');
     myUser.Refresh;
     LoadValues(gUsers,'tip','select id, name from tip_users');
     LoadValues(gUsers,'otdel','select id, name from otdel');
end;

procedure TfmUsers.sb1Click(Sender: TObject);
begin
     myOtdel.Append;
end;

procedure TfmUsers.sb2Click(Sender: TObject);
begin
     if myOtdel.RecordCount>0 then
     begin
       if DelZap then
         myOtdel.Delete;
       myOtdel.CheckBrowseMode;
     end;
end;

procedure TfmUsers.sbtMTipClick(Sender: TObject);
begin
     if myTip.RecordCount>0 then
     begin
       if DelZap then
         myTip.Delete;
       myTip.CheckBrowseMode;
     end;
end;

procedure TfmUsers.sbtnMinusClick(Sender: TObject);
begin
     if myuser.RecordCount>0 then
     begin
       if DelZap then
         myuser.Delete;
       myuser.CheckBrowseMode;
     end;
end;

procedure TfmUsers.sbtnPlusClick(Sender: TObject);
begin
      myUser.Append;
end;

procedure TfmUsers.sbtPtipClick(Sender: TObject);
begin
      myTip.Append;
end;

end.
