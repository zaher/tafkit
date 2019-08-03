unit MainForms;
{
/**
 * Arabic figures numbers
 *
 * @license    GPL 2 (http://www.gnu.org/licenses/gpl.html)
 * @author     Zaher Dirkey <zaher@parmaja.com>
 */
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Memo2: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ExtendFigureChkClick(Sender: TObject);
  private
    procedure FigureNow;
  public
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  ArabicFigures, SimpleFigures;

const
  SyriaCurrency: TCurrencyNames =
  (
    'F',
    '·Ì—…',
    '·Ì— Ì',
    '·Ì— Ì‰',
    '·Ì—« ');

  UsaCurrency: TCurrencyNames =
  (
    'M',
    'œÊ·«—',
    'œÊ·«—Ì',
    'œÊ·«—Ì‰',
    'œÊ·«—« ');

procedure TMainForm.FigureNow;
begin
  if RadioGroup1.ItemIndex = 0 then
    Memo1.Text := ArabicSimpleFigure(Edit1.Text, '·Ì—…', 'ﬁ—‘', 2, True)
  else
    Memo1.Text := ArabicSimpleFigure(Edit1.Text, 'œÊ·«—', '”‰ ', 2, False);

  if RadioGroup1.ItemIndex = 0 then
    Memo2.Text := GetArabicFigure(StrToInt64Def(Edit1.Text, 0), SyriaCurrency)
  else
    Memo2.Text := GetArabicFigure(StrToInt64Def(Edit1.Text, 0), UsaCurrency);
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  FigureNow;
end;

procedure TMainForm.ExtendFigureChkClick(Sender: TObject);
begin
  FigureNow;
end;

end.

