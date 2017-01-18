unit Input;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sLabel, sEdit;

type
  TfmInput = class(TForm)
    sEdit1: TsEdit;
    sLabel1: TsLabel;
    btnOk: TBitBtn;
    btnCansel: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInput: TfmInput;

implementation

{$R *.dfm}
uses MainUnit;

procedure TfmInput.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action := caFree;
end;

procedure TfmInput.FormCreate(Sender: TObject);
begin
     if id_Scale=1 then
     if screen.Height<>768 then fmInput.ChangeScale(Round(screen.Height/768*100), 100);
end;

end.
