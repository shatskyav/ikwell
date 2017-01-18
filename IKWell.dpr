program ikwell;

uses
  Forms,
  trans,
  SysUtils,
  MainUnit in 'MainUnit.pas' {fmMain},
  Pass in 'Pass.pas' {FmPass},
  Dostup in 'Dostup.pas' {fmLogin},
  Users in 'Users.pas' {fmUsers},
  Objects in 'Objects.pas' {fmObjects},
  Obj in 'Obj.pas' {fmObject},
  Reports in 'Reports.pas' {fmReport},
  Sprav in 'Sprav.pas' {fmSprav},
  maps in 'maps.pas' {fmMaps},
  Candidat in 'Candidat.pas' {FmCandidat},
  Input in 'Input.pas' {fmInput};

{$R *.res}

var iiii:integer;
    lang:integer;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'IKWell';
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TFmPass, FmPass);
  Application.CreateForm(TfmLogin, fmLogin);
  //if Now>StrToDate('01.07.2016') then Application.Terminate;

  // for iiii:=0 to Screen.FormCount-1 do
 // TranslateForm(Screen.Forms[iiii],'BLR',ExtractFileDir(Application.EXEName)+'\trans.dic');
  Application.Run;
end.
