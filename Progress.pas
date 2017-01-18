unit Progress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sGauge, StdCtrls, sLabel;

type
  TFmProgress = class(TForm)
    TextLabel: TsLabel;
    ProgressBar: TsGauge;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmProgress: TFmProgress;

implementation

{$R *.dfm}

procedure TFmProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     action := caFree;
     fmProgress := nil;
end;

initialization

  fmProgress := nil;

end.
