library ArFigures;

uses
  ComServ,
  ArFigures_TLB in 'ArFigures_TLB.pas',
  SimpleFigures in '..\lib\SimpleFigures.pas',
  ArabicFigures in '..\lib\ArabicFigures.pas',
  ArFiguresObjects in 'ArFiguresObjects.pas' {Figure: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

{
function Internal_ExtendedFigure(Number: Extended; CurrencyName, DualName1, DualName2, PluralName: string; Gender: Boolean): string;
var
  aCurrency: TCurrencyNames;
const
  sGender: array[Boolean] of char = ('M', 'F');
begin
  aCurrency[0] := sGender[Gender];
  aCurrency[1] := CurrencyName;
  aCurrency[2] := DualName1;
  aCurrency[3] := DualName2;
  aCurrency[4] := PluralName;
  Result := GetArabicFigure(Trunc(Number), aCurrency);
end;

function SimpleFigure(Number: string; CurrencyName: string; PartName: string; Decimals: Integer; Gender: Boolean): string;
begin
  ArabicSimpleFigure(Number, Gender, Result, CurrencyName, PartName, Decimals);
end;

Result := Internal_ExtendedFigure(Number, CurrencyName, DualName1, DualName2, PluralName, Gender);
}
begin
end.
