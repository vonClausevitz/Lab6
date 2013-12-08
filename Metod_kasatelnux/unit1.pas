unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TASeries, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ActnList, Menus, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  Pogr: real;
  a, b, func, Pohidna, y, x,del: real;
  code: byte;
begin
  val(Edit1.Text, a, code);
  if code = 0 then
    val(Edit2.Text, b, code);
  if code = 0 then
   val(Edit3.Text, Pogr, code);
  if code = 0 then
  begin
   if a = 0 then a:=0.01 ;
    if (sin(sqrt(a))-cos(sqrt(a))+2*sqrt(a))*
    ((cos(sqrt(a))/(2*sqrt(a)))-(sin(sqrt(a))/(2*sqrt(a)))+1/sqrt(a))>0 then x:=a
    else x:=b;
 del:=1;
    while(del>pogr) do begin
       func:= sin(sqrt(x))-cos(sqrt(x))+2*sqrt(x);
       Pohidna:=  ((cos(sqrt(x))/(2*sqrt(x)))-(sin(sqrt(x))/(2*sqrt(x)))+1/sqrt(x));
     y:=x- func/pohidna;
      del:=abs(y-x);
      if y=0 then label5.caption:=floattostr(x)
      else label5.Caption:='На заданому відрізку коренів'+#13+'не знайдено!';
      Chart1LineSeries1.AddXY(X, Y, '', clYellow);
       x:=y;

   end;
    label5.visible:=true;
  end;
end;

end.
