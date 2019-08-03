program ArFigures;
{
/**
 * Arabic figures numbers
 *
 * @license    GPL 2 (http://www.gnu.org/licenses/gpl.html)
 * @author     Zaher Dirkey <zaher@parmaja.com>
 */
}
uses
  Forms,
  MainForms in 'MainForms.pas' {MainForm},
  ArabicFigures in '..\lib\ArabicFigures.pas',
  SimpleFigures in '..\lib\SimpleFigures.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
