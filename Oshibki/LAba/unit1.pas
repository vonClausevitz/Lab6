unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Unit2, unit3,
  StdCtrls, Buttons, ExtCtrls,dateUtils;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    Image1: TImage;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

    procedure FormActivate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  i, k: byte;
  mashiny: array [1..21] of proba;
  file1: Text;
  file2: textfile;
  marka: string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  n_m: byte;
  marka, typ, korobka_per, god_vip, Marka_ben, obyem_dv: string;
  bool: boolean = False;
begin
  marka := Combobox1.Items.Strings[ComboBox1.ItemIndex];
  typ := Combobox2.Items.Strings[ComboBox2.ItemIndex];
  God_vip := Combobox3.Items.Strings[ComboBox3.ItemIndex];
  Obyem_Dv := Combobox4.Items.Strings[ComboBox4.ItemIndex];
  Marka_Ben := Combobox5.Items.Strings[ComboBox5.ItemIndex];
  Korobka_Per := Combobox6.Items.Strings[ComboBox6.ItemIndex];
  for i := 1 to 20 do
    if (mashiny[i].marka = marka) and (typ = mashiny[i].typ) and
      (mashiny[i].God_vip = God_vip) and (mashiny[i].Obyem_Dv = Obyem_Dv) and
      (mashiny[i].Marka_ben = Marka_ben) and (mashiny[i].Korobka_Per = Korobka_Per) then
    begin
      bool := True;
      n_m := i;
    end;

  if bool then
  begin
    Form2.Label1.Caption := (PChar('Марка авто:   ' +
      ComboBox1.Items.Strings[ComboBox1.ItemIndex] + #13 +
      'Модель:   ' + mashiny[n_m].model + #13 + 'Тип кузова:   ' +
      ComboBox2.Items.Strings[ComboBox2.ItemIndex] + #13 +
      'Рік вупуску:   ' + ComboBox3.Items.Strings[ComboBox3.ItemIndex] +
      #13 + 'Об''єм двигуна:   ' +
      ComboBox4.Items.Strings[ComboBox4.ItemIndex] + #13 +
      'Марка бензину:   ' + ComboBox5.Items.Strings[ComboBox5.ItemIndex] +
      #13 + 'Коробка передач:   ' +
      ComboBox6.Items.Strings[ComboBox6.ItemIndex] + #13 + #13 +
      'Ціна:   ' + mashiny[n_m].price));
    Form2.Show;
  end
  else
    ShowMessage('Нічого не знайдено за данними критеріями');

  if bool then begin
  assignFile(file2,'Klienty.txt');
 rewrite(file2);
 write(file2,'Дата: '#13+datetostr(Date)+#13+
 'Марка авто:   '+mashiny[k].marka      +#13  +
 'Модель:   '+    mashiny[n_m].model      +#13  +
 'Тип кузова:   '+    mashiny[n_m].typ     + #13  +
 'Рік вупуску:   '+    mashiny[n_m].God_vip + #13  +
 'Об''єм двигуна:   '+    mashiny[n_m].Obyem_Dv + #13  +
 'Марка бензину:   '+    mashiny[n_m].Marka_Ben + #13  +
 'Коробка передач:   '+    mashiny[n_m].Korobka_Per+ #13  +
 'Ціна:   '+    mashiny[n_m].price);
 closefile(file2);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then  Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
     memo1.visible:=true;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  assignFile(file1, 'Avto_mob.txt');
  reset(file1);
  k := 1;
  for  i := 1 to 20 do
  begin
    readln(file1, mashiny[k].marka);
    readln(file1, mashiny[k].model);
    readln(file1, mashiny[k].typ);
    readln(file1, mashiny[k].God_vip);
    readln(file1, mashiny[k].Obyem_Dv);
    readln(file1, mashiny[k].Marka_Ben);
    readln(file1, mashiny[k].Korobka_Per);
    readln(file1, mashiny[k].price);
    inc(k);
  end;
  closefile(file1);

end;

end.
