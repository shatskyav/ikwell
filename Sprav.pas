unit Sprav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sPageControl, DBGridEhGrouping, StdCtrls, Buttons, sBitBtn,
  DB, DBAccess, MyAccess, MemDS, GridsEh, DBGridEh, ExtCtrls, sPanel;

type
  TfmSprav = class(TForm)
    pc1: TsPageControl;
    tsObl: TsTabSheet;
    tsIstok: TsTabSheet;
    tsStatus: TsTabSheet;
    tsStena: TsTabSheet;
    tsCity: TsTabSheet;
    tsRayon: TsTabSheet;
    tsStreet: TsTabSheet;
    pn1: TsPanel;
    gRegion: TDBGridEh;
    myRegion: TMyQuery;
    dsRegion: TMyDataSource;
    sbtnPlus: TsBitBtn;
    sbtnMinus: TsBitBtn;
    gCity: TDBGridEh;
    pn2: TsPanel;
    sb1: TsBitBtn;
    sb2: TsBitBtn;
    myCity: TMyQuery;
    dsCity: TMyDataSource;
    gRayon: TDBGridEh;
    pn3: TsPanel;
    sb3: TsBitBtn;
    myRayon: TMyQuery;
    dsRayon: TMyDataSource;
    gStreet: TDBGridEh;
    pn4: TsPanel;
    sb5: TsBitBtn;
    sb6: TsBitBtn;
    myStreet: TMyQuery;
    dsStreet: TMyDataSource;
    sb4: TsBitBtn;
    tsOtkaz: TsTabSheet;
    g1: TDBGridEh;
    sPanel1: TsPanel;
    bt1: TsBitBtn;
    bt2: TsBitBtn;
    g2: TDBGridEh;
    sPanel2: TsPanel;
    bt3: TsBitBtn;
    bt4: TsBitBtn;
    g3: TDBGridEh;
    sPanel3: TsPanel;
    bt5: TsBitBtn;
    bt6: TsBitBtn;
    g4: TDBGridEh;
    sPanel4: TsPanel;
    bt7: TsBitBtn;
    bt8: TsBitBtn;
    myIstok: TMyQuery;
    dsIstok: TMyDataSource;
    myStatus: TMyQuery;
    dsStatus: TMyDataSource;
    myStena: TMyQuery;
    dsStena: TMyDataSource;
    myOtkaz: TMyQuery;
    dsOtkaz: TMyDataSource;
    tsTip: TsTabSheet;
    gTip: TDBGridEh;
    pnTip: TsPanel;
    sbInsTip: TsBitBtn;
    sbDelTip: TsBitBtn;
    myTip: TMyQuery;
    dsTip: TMyDataSource;
    tsUr: TsTabSheet;
    myUr: TMyQuery;
    dsUR: TMyDataSource;
    g5: TDBGridEh;
    sPanel5: TsPanel;
    bt9: TsBitBtn;
    bt10: TsBitBtn;
    tsProff: TsTabSheet;
    tsVuz: TsTabSheet;
    myProff: TMyQuery;
    dsProff: TMyDataSource;
    gProff: TDBGridEh;
    sPanel6: TsPanel;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    tsGorod: TsTabSheet;
    myVuz: TMyQuery;
    dsVuz: TMyDataSource;
    gVuz: TDBGridEh;
    sPanel7: TsPanel;
    sBitBtn3: TsBitBtn;
    sBitBtn4: TsBitBtn;
    myGorod: TMyQuery;
    gGorod: TDBGridEh;
    sPanel8: TsPanel;
    sBitBtn5: TsBitBtn;
    sBitBtn6: TsBitBtn;
    dsGorod: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sbtnPlusClick(Sender: TObject);
    procedure sbtnMinusClick(Sender: TObject);
    procedure sb1Click(Sender: TObject);
    procedure sb3Click(Sender: TObject);
    procedure sb5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gRegionExit(Sender: TObject);
    procedure gCityExit(Sender: TObject);
    procedure gRayonExit(Sender: TObject);
    procedure gStreetExit(Sender: TObject);
    procedure sb2Click(Sender: TObject);
    procedure sb4Click(Sender: TObject);
    procedure sb6Click(Sender: TObject);
    procedure bt1Click(Sender: TObject);
    procedure bt2Click(Sender: TObject);
    procedure bt3Click(Sender: TObject);
    procedure bt4Click(Sender: TObject);
    procedure bt5Click(Sender: TObject);
    procedure bt6Click(Sender: TObject);
    procedure bt7Click(Sender: TObject);
    procedure bt8Click(Sender: TObject);
    procedure sbInsTipClick(Sender: TObject);
    procedure sbDelTipClick(Sender: TObject);
    procedure gTipExit(Sender: TObject);
    procedure g1Exit(Sender: TObject);
    procedure g2Exit(Sender: TObject);
    procedure g3Exit(Sender: TObject);
    procedure g4Exit(Sender: TObject);
    procedure g5Exit(Sender: TObject);
    procedure bt9Click(Sender: TObject);
    procedure bt10Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure gProffExit(Sender: TObject);
    procedure gVuzExit(Sender: TObject);
    procedure gGorodExit(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
    procedure sBitBtn4Click(Sender: TObject);
    procedure sBitBtn5Click(Sender: TObject);
    procedure sBitBtn6Click(Sender: TObject);
    procedure pc1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSprav: TfmSprav;

implementation

{$R *.dfm}
uses MainUnit;

procedure TfmSprav.bt10Click(Sender: TObject);
begin
     if myUr.RecordCount>0 then
     begin
       if DelZap then
         myUr.Delete;
       myUr.CheckBrowseMode;
     end;
end;

procedure TfmSprav.bt1Click(Sender: TObject);
begin
      myIstok.Append;
end;

procedure TfmSprav.bt2Click(Sender: TObject);
begin
     if myIstok.RecordCount>0 then
     begin
       if DelZap then
         myIstok.Delete;
       myIstok.CheckBrowseMode;
     end;
end;

procedure TfmSprav.bt3Click(Sender: TObject);
begin
      myStatus.Append;
end;

procedure TfmSprav.bt4Click(Sender: TObject);
begin
     if myStatus.RecordCount>0 then
     begin
       if DelZap then
         myStatus.Delete;
       myStatus.CheckBrowseMode;
     end;
end;

procedure TfmSprav.bt5Click(Sender: TObject);
begin
      myStena.Append;
end;

procedure TfmSprav.bt6Click(Sender: TObject);
begin
     if myStena.RecordCount>0 then
     begin
       if DelZap then
         myStena.Delete;
       myStena.CheckBrowseMode;
     end;
end;

procedure TfmSprav.bt7Click(Sender: TObject);
begin
      myOtkaz.Append;
end;

procedure TfmSprav.bt8Click(Sender: TObject);
begin
     if myOtkaz.RecordCount>0 then
     begin
       if DelZap then
         myOtkaz.Delete;
       myOtkaz.CheckBrowseMode;
     end;
end;

procedure TfmSprav.bt9Click(Sender: TObject);
begin
     myUr.Append;
end;

procedure TfmSprav.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     myRegion.Active := False;
     myRayon.Active := False;
     myStreet.Active := False;
     myCity.Active := False;
     myIstok.Active := False;
     myStatus.Active := False;
     myStena.Active := False;
     myOtkaz.Active := False;
     myTip.Active := False;
     myUr.Active := False;
      Action := caFree;
end;

procedure TfmSprav.FormCreate(Sender: TObject);
begin
   if id_Scale=1 then
   if screen.Height<>768 then fmSprav.ChangeScale(Round(screen.Height/768*100), 100);
   top:=1; left:=1;
   Width:=fmMain.ClientWidth-55;
   Height:=fmMain.ClientHeight-155;
end;

procedure TfmSprav.FormShow(Sender: TObject);
begin
     myRegion.Active := True;
     myRayon.Active := True;
     myStreet.Active := True;
     myCity.Active := True;
     myIstok.Active := True;
     myStatus.Active := True;
     myStena.Active := True;
     myOtkaz.Active := True;
     myTip.Active := True;
     myUr.Active := True;
     myProff.Active := True;
     myGorod.Active := True;
     myVuz.Active := True;

     LoadValues(gCity,'region','select id,name from region');
     gCity.Columns[1].Alignment:=taLeftJustify;

     LoadValues(gStreet,'city','select id,name from city');
     gStreet.Columns[1].Alignment:=taLeftJustify;

     LoadValues(gGorod,'id_city','select id,name from gorod order by name');
     gGorod.Columns[2].Alignment:=taLeftJustify;

     LoadValues(gVuz,'id_vuz','select id,name from vuz order by name');
     gVuz.Columns[2].Alignment:=taLeftJustify;


     if otdel = 2 then
     begin
       tsObl.TabVisible := False;
       tsIstok.TabVisible := False;
       tsStatus.TabVisible := False;
       tsStena.TabVisible := False;
       tsCity.TabVisible := False;
       tsRayon.TabVisible := False;
       tsStreet.TabVisible := False;
       tsOtkaz.TabVisible := False;
       tsTip.TabVisible := False;
       tsUr.TabVisible := False;
     end;
     if otdel = 1 then
     begin
       tsProff.TabVisible := False;
       tsVuz.TabVisible := False;
       tsGorod.TabVisible := False;
     end;


end;

procedure TfmSprav.g1Exit(Sender: TObject);
begin
     myIstok.CheckBrowseMode;
end;

procedure TfmSprav.g2Exit(Sender: TObject);
begin
      myStatus.CheckBrowseMode;
end;

procedure TfmSprav.g3Exit(Sender: TObject);
begin
     myStena.CheckBrowseMode;
end;

procedure TfmSprav.g4Exit(Sender: TObject);
begin
      myOtkaz.CheckBrowseMode;
end;

procedure TfmSprav.g5Exit(Sender: TObject);
begin
     myUr.CheckBrowseMode;
end;

procedure TfmSprav.gCityExit(Sender: TObject);
begin
     myCity.CheckBrowseMode;
     LoadValues(gStreet,'city','select id,name from city');
end;

procedure TfmSprav.gGorodExit(Sender: TObject);
begin
     myGorod.CheckBrowseMode;
end;

procedure TfmSprav.gProffExit(Sender: TObject);
begin
      myProff.CheckBrowseMode;
end;

procedure TfmSprav.gRayonExit(Sender: TObject);
begin
     myRayon.CheckBrowseMode;
end;

procedure TfmSprav.gRegionExit(Sender: TObject);
begin
     myRegion.CheckBrowseMode;
     LoadValues(gCity,'region','select id,name from region');

end;

procedure TfmSprav.gStreetExit(Sender: TObject);
begin
     myStreet.CheckBrowseMode;
end;

procedure TfmSprav.gTipExit(Sender: TObject);
begin
     myTip.CheckBrowseMode;
end;

procedure TfmSprav.gVuzExit(Sender: TObject);
begin
      myVuz.CheckBrowseMode;
end;

procedure TfmSprav.pc1Change(Sender: TObject);
begin
     myRegion.Active := False;
     myRayon.Active := False;
     myStreet.Active := False;
     myCity.Active := False;
     myIstok.Active := False;
     myStatus.Active := False;
     myStena.Active := False;
     myOtkaz.Active := False;
     myTip.Active := False;
     myUr.Active := False;
     myProff.Active := False;
     myGorod.Active := False;
     myVuz.Active := False;

     myRegion.Active := True;
     myRayon.Active := True;
     myStreet.Active := True;
     myCity.Active := True;
     myIstok.Active := True;
     myStatus.Active := True;
     myStena.Active := True;
     myOtkaz.Active := True;
     myTip.Active := True;
     myUr.Active := True;
     myProff.Active := True;
     myGorod.Active := True;
     myVuz.Active := True;
end;

procedure TfmSprav.sb1Click(Sender: TObject);
begin
      myCity.Append;
end;

procedure TfmSprav.sb2Click(Sender: TObject);
begin
     if myCity.RecordCount>0 then
     begin
       if DelZap then
         myCity.Delete;
       myCity.CheckBrowseMode;
     end;
end;

procedure TfmSprav.sb3Click(Sender: TObject);
begin
     myRayon.Append;
end;

procedure TfmSprav.sb4Click(Sender: TObject);
begin
     if myRayon.RecordCount>0 then
     begin
       if DelZap then
         myRayon.Delete;
       myRayon.CheckBrowseMode;
     end;
end;

procedure TfmSprav.sb5Click(Sender: TObject);
begin
      myStreet.Append;
end;

procedure TfmSprav.sb6Click(Sender: TObject);
begin
     if myStreet.RecordCount>0 then
     begin
       if DelZap then
         myStreet.Delete;
       myStreet.CheckBrowseMode;
     end;
end;

procedure TfmSprav.sbDelTipClick(Sender: TObject);
begin
     if myTip.RecordCount>0 then
     begin
       if DelZap then
         myTip.Delete;
       myTip.CheckBrowseMode;
     end;
end;

procedure TfmSprav.sbInsTipClick(Sender: TObject);
begin
     myTip.Append;
end;

procedure TfmSprav.sBitBtn1Click(Sender: TObject);
begin
     myProff.Append;
end;

procedure TfmSprav.sBitBtn2Click(Sender: TObject);
begin
     if myProff.RecordCount>0 then
     begin
       if DelZap then
         myProff.Delete;
       myProff.CheckBrowseMode;
     end;
end;

procedure TfmSprav.sBitBtn3Click(Sender: TObject);
begin
     myVuz.Append;
end;

procedure TfmSprav.sBitBtn4Click(Sender: TObject);
begin
     if myVuz.RecordCount>0 then
     begin
       if DelZap then
         myVuz.Delete;
       myVuz.CheckBrowseMode;
     end;
end;

procedure TfmSprav.sBitBtn5Click(Sender: TObject);
begin
     myGorod.Append;
end;

procedure TfmSprav.sBitBtn6Click(Sender: TObject);
begin
     if myGorod.RecordCount>0 then
     begin
       if DelZap then
         myGorod.Delete;
       myGorod.CheckBrowseMode;
     end;
end;

procedure TfmSprav.sbtnMinusClick(Sender: TObject);
begin
     if myRegion.RecordCount>0 then
     begin
       if DelZap then
         myRegion.Delete;
       myRegion.CheckBrowseMode;
     end;

end;

procedure TfmSprav.sbtnPlusClick(Sender: TObject);
begin
      myRegion.Append;
end;

end.
