unit trans;

interface

uses SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls,
 Buttons, ComCtrls, ExtCtrls, DBCtrls, DB, DBGridEh, Menus, Grids, Mask,
 IniFiles;

function Translate(Text : string; Lang : string; Dict : TIniFile):string;
procedure TranslateForm(Form : TForm; Lang : string; DictFileName : string);

implementation

{ Непосредственный перевод текста }
function Translate(Text : string; Lang : string; Dict : TIniFile):string;
var s : string;
begin
 Result:=Text;
 S:=Dict.ReadString(Lang, Text, '');
 if S='' then Dict.WriteString(Lang, Text, '');
 if S<>'' then Result:=S;
end;

procedure TranslateForm(Form : TForm; Lang : string; DictFileName : string);
var Dict : TIniFile;
 I,J : Integer;
 Obj : TObject;
begin
{ Открываем словарь. Перед вызовом функции Translate словарь должен быть открыт! }

 Dict:=TIniFile.Create(DictFileName);

 if not fileexists(DictFileName) then
 ShowMessage('No exists' + DictFileName);

 Form.Caption:=Translate(Form.Caption, Lang, Dict);
 Application.Title:=Translate(Application.Title, Lang, Dict);

 { Переводим компоненты формы}
 For I:=0 to Form.ComponentCount-1 do
 Begin

 Obj:=Form.Components[i];
 if Obj is TMenuItem then
 begin
 TMenuItem(Obj).Caption:=Translate(TMenuItem(Obj).Caption, Lang, Dict);
 TMenuItem(Obj).Hint:=Translate(TMenuItem(Obj).Hint, Lang, Dict);
 end;

 if Obj is TButton then
 begin
 TButton(Obj).Caption:=Translate(TButton(Obj).Caption, Lang, Dict);
 TButton(Obj).Hint:=Translate(TButton(Obj).Hint, Lang, Dict);
 end;

 if Obj is TBitBtn then
 begin
 TBitBtn(Obj).Caption:=Translate(TBitBtn(Obj).Caption, Lang, Dict);
 TBitBtn(Obj).Hint:=Translate(TBitBtn(Obj).Hint, Lang, Dict);
 end;

 if Obj is TSpeedButton then
 begin
 TSpeedButton(Obj).Caption:=Translate(TSpeedButton(Obj).Caption, Lang, Dict);
 TSpeedButton(Obj).Hint:=Translate(TSpeedButton(Obj).Hint, Lang, Dict);
 end;

 if Obj is TPanel then
 begin
 TPanel(Obj).Caption:=Translate(TPanel(Obj).Caption, Lang, Dict);
 TPanel(Obj).Hint:=Translate(TPanel(Obj).Hint, Lang, Dict);
 end;

 if Obj is TGroupBox then
 begin
 TGroupBox(Obj).Caption:=Translate(TGroupBox(Obj).Caption, Lang, Dict);
 TGroupBox(Obj).Hint:=Translate(TGroupBox(Obj).Hint, Lang, Dict);
 end;

 if Obj is TLabel then
 begin
 TLabel(Obj).Caption:=Translate(TLabel(Obj).Caption, Lang, Dict);
 TLabel(Obj).Hint:=Translate(TLabel(Obj).Hint, Lang, Dict);
 end;

 if Obj is TStaticText then
 begin
 TStaticText(Obj).Caption:=Translate(TStaticText(Obj).Caption, Lang, Dict);
 TStaticText(Obj).Hint:=Translate(TStaticText(Obj).Hint, Lang, Dict);
 end;


 if Obj is TEdit then
 TEdit(Obj).Hint:=Translate(TEdit(Obj).Hint, Lang, Dict);

 if Obj is TMaskEdit then
 TMaskEdit(Obj).Hint:=Translate(TMaskEdit(Obj).Hint, Lang, Dict);

 if Obj is TMemo then
 TMemo(Obj).Hint:=Translate(TMemo(Obj).Hint, Lang, Dict);

 if Obj is TRadioGroup then
 begin
 TRadioGroup(Obj).Caption:=Translate(TRadioGroup(Obj).Caption, Lang, Dict);
 TRadioGroup(Obj).Hint:=Translate(TRadioGroup(Obj).Hint, Lang, Dict);
 for J:=0 to TRadioGroup(Obj).Items.Count-1 do
  begin
   TRadioGroup(Obj).Items[j]:=Translate(TRadioGroup(Obj).Items[j], Lang, Dict);
  end;
 end;

 if Obj is TCheckBox then
 begin
 TCheckBox(Obj).Caption:=Translate(TCheckBox(Obj).Caption, Lang, Dict);
 TCheckBox(Obj).Hint:=Translate(TCheckBox(Obj).Hint, Lang, Dict);
 end;

 if Obj is TField then
 TField(Obj).DisplayLabel:=Translate(TField(Obj).DisplayLabel, Lang, Dict);

 if Obj is TTabSheet then
 begin
 TTabSheet(Obj).Caption:=Translate(TTabSheet(Obj).Caption, Lang, Dict);
 TTabSheet(Obj).Hint:=Translate(TTabSheet(Obj).Hint, Lang, Dict);
 end;

 if Obj is TOpenDialog then
 TOpenDialog(Obj).Title:=Translate(TOpenDialog(Obj).Title, Lang, Dict);

 if Obj is TSaveDialog then
 TSaveDialog(Obj).Title:=Translate(TSaveDialog(Obj).Title, Lang, Dict);


 if Obj is  TDBGridEh then
 begin
 for J:=0 to TDBGridEh(Obj).Columns.Count-1 do
  begin
   TDBGridEh(Obj).Columns[j].Title.Caption:=Translate(TDBGridEh(Obj).Columns[j].Title.Caption, Lang, Dict);
  end;
 end;


 End;

{ освобождаем память}

 Dict.Free;
end;

end.