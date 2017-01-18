unit Pass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Keyboard, StdCtrls, Mask, DBCtrlsEh, sMaskEdit;

type
  TFmPass = class(TForm)
    TouchKeyboard1: TTouchKeyboard;
    btn1: TButton;
    pass: TsMaskEdit;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmPass: TFmPass;

implementation

{$R *.dfm}
uses mainunit;

procedure TFmPass.btn1Click(Sender: TObject);
var us:integer;
begin
     user_p:=pass.Text;
     pass.Text:='';
end;

procedure TFmPass.FormCreate(Sender: TObject);
begin
   if id_Scale=1 then
   if screen.Height<>768 then fmPass.ChangeScale(Round(screen.Height/768*100), 100);

end;

end.
