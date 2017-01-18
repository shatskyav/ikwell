unit Dostup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, Buttons, sMaskEdit, sCustomComboEdit,
  sComboEdit;

type
  TfmLogin = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    User_id: TDBComboBoxEh;
    btn3: TBitBtn;
    btn1: TBitBtn;
    user_pass: TDBEditEh;
    procedure FormCreate(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure User_passButtonClick(Sender: TObject);
    procedure DBEditEh1EditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLogin: TfmLogin;

implementation

{$R *.dfm}
uses MainUnit,pass;

procedure TfmLogin.btn1Click(Sender: TObject);
begin
     Application.Terminate;
end;

procedure TfmLogin.btn3Click(Sender: TObject);
begin
   if User_id.Value=null then User:=0 else User:=User_id.Value;
   if user>0 then
    if ReturnSQL('select pass from users where id='+IntToStr(User))=User_pass.Text
      then
      begin
        tip_user:=ReturnSQL('select tip from users where id='+IntToStr(User));
        ModalResult := mrOk;
      end
      else showmessage('Неверный пароль!');
      User_pass.Text:='';
      User_pass.SetFocus;

end;

procedure TfmLogin.DBEditEh1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
     if FmPass.ShowModal=mrOk then
     begin
       user_pass.Text:=user_p;
       btn3Click(Sender);
     end;
end;

procedure TfmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if ModalResult<>mrOk then  Application.Terminate;
end;

procedure TfmLogin.FormCreate(Sender: TObject);
begin
   if id_Scale=1 then
   if screen.Height<>768 then fmLogin.ChangeScale(Round(screen.Height/768*100), 100);
   //fmLogin.ChangeScale(150, 100);
   if FmMain.MyUser.Active then
    begin
     LoadValues(User_id,'select id,name from users where active=1 and ( (otdel = 0)  or (otdel = '+inttostr(otdel)+') )');
    end
   else Application.Terminate;
end;

procedure TfmLogin.User_passButtonClick(Sender: TObject);
begin
     if FmPass.ShowModal=mrOk then
     begin
       user_pass.Text:=user_p;
       btn3Click(Sender);
     end;

end;

end.
