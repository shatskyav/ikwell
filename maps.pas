unit maps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GMMap, GMMapVCL, GMClasses, GMLinkedComponents, GMMarker,
  GMMarkerVCL, OleCtrls, SHDocVw, ExtCtrls, sPanel, DB, DBAccess, MyAccess,
  MemDS;

type
  TfmMaps = class(TForm)
    sPanel1: TsPanel;
    wb1: TWebBrowser;
    gmm1: TGMMarker;
    gmp1: TGMMap;
    myMaps: TMyQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gmp1AfterPageLoaded(Sender: TObject; First: Boolean);
    procedure gmp1RightClick(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMaps: TfmMaps;

implementation

{$R *.dfm}
uses MainUnit;

procedure TfmMaps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfmMaps.FormCreate(Sender: TObject);
begin
     top:=1; left:=1;
     Width:=fmMain.ClientWidth-10;
     Height:=fmMain.ClientHeight-75;
end;

procedure TfmMaps.FormShow(Sender: TObject);
begin
     myMaps.Active := False;
     myMaps.ParamByName('id').AsInteger := id_obj;
     myMaps.Active := True;

     gmp1.Active:=True;

     if myMaps.RecordCount>0 then
      gmm1.LoadFromDataSet(myMaps,'Lat','Lng','Title');

     if myMaps.RecordCount=1 then
      begin
        gmp1.RequiredProp.Center.Lat:=myMaps.FieldByName('Lat').AsFloat;
        gmp1.RequiredProp.Center.Lng:=myMaps.FieldByName('Lng').AsFloat;
        gmp1.RequiredProp.Zoom:=myMaps.FieldByName('Zoom').AsInteger;

      end;


end;

procedure TfmMaps.gmp1AfterPageLoaded(Sender: TObject; First: Boolean);
begin
  if First then
  begin
    GMp1.DoMap;
  end;
end;

procedure TfmMaps.gmp1RightClick(Sender: TObject; LatLng: TLatLng; X,
  Y: Double);
begin
       if messagedlg('Указать координаты обьекта?',mtConfirmation,[mbYes,mbNo],0,mbYes)=mrYes then
       begin
        if myMaps.RecordCount=0 then
         begin
           myMaps.CheckBrowseMode;
           myMaps.Append;
           myMaps.FieldByName('id').AsInteger:= id_obj;
           myMaps.FieldByName('Lat').AsFloat:=LatLng.Lat;
           myMaps.FieldByName('Lng').AsFloat:=LatLng.Lng;
           myMaps.FieldByName('Zoom').AsInteger:=gmp1.RequiredProp.Zoom;
           myMaps.FieldByName('Title').AsString:='Обьект № '+Inttostr(id_obj);
           myMaps.Post;
         end
        else
         begin
           myMaps.CheckBrowseMode;
           myMaps.Edit;
           myMaps.FieldByName('Lat').AsFloat:=LatLng.Lat;
           myMaps.FieldByName('Lng').AsFloat:=LatLng.Lng;
           myMaps.FieldByName('Zoom').AsInteger:=gmp1.RequiredProp.Zoom;
           myMaps.Post;
         end;
         gmm1.LoadFromDataSet(myMaps,'Lat','Lng','Title');
       end;
//       ShowMessage(LatLng.LatToStr(GMp1.Precision)+' - '+LatLng.LngToStr(GMp1.Precision));
end;

end.
