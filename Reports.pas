unit Reports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, GMClasses, GMMap, GMMapVCL;

type
  TfmReport = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmReport: TfmReport;

implementation

{$R *.dfm}
uses MainUnit;

procedure TfmReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action := caFree;
end;

procedure TfmReport.FormCreate(Sender: TObject);
begin
   if id_Scale=1 then
   if screen.Height<>768 then fmReport.ChangeScale(Round(screen.Height/768*100), 100);
   top:=1; left:=1;
   Width:=fmMain.ClientWidth-25;
   Height:=fmMain.ClientHeight-75;
end;

end.
