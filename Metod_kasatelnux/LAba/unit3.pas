unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Label1Click(Sender: TObject);
begin

end;

procedure TForm2.Button1Click(Sender: TObject);
 var file2:textfile;
begin
  assignFile(file2,'Klienty.txt');
 append(file2);
 write(file2,#13+'Статус: '+ '  '+'Куплено');
 closefile(file2);
 form2.Visible:=false;
end;

procedure TForm2.Button2Click(Sender: TObject);
var file2:textfile;
begin
  assignFile(file2,'Klienty.txt');
 Append(file2);
 write(file2,#13+'Cтатус: '+ '  '+'Ні');
 closefile(file2);
 form2.Visible:=false;
end;

end.

