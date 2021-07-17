unit ArFiguresObjects;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, ArFigures_TLB, StdVcl;

type
  TFigure = class(TAutoObject, IFigure)
  protected
    function About: WideString; safecall;
    function Extended(Number: Double; const Name, Dual1, Dual2, Plural: WideString; Gender: WordBool): WideString; safecall;
    function Simple(const Number, CurrencyName, PartName: WideString; Decimals: Integer; Gender: WordBool): WideString; safecall;
  end;

implementation

uses ComServ, ArabicFigures, SimpleFigures;

function TFigure.About: WideString;
begin
  Result := 'parmaja.org'
end;

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

function Internal_SimpleFigure(Number: string; CurrencyName: string; PartName: string; Decimals: Integer; Gender: Boolean): string;
begin
  Result := ArabicSimpleFigure(Number, CurrencyName, PartName, Decimals, Gender);
end;

function TFigure.Extended(Number: Double; const Name, Dual1, Dual2, Plural: WideString; Gender: WordBool): WideString;
begin
  Result := Internal_ExtendedFigure(Number, Name, Dual1, Dual2, Plural, Gender);
end;

function TFigure.Simple(const Number, CurrencyName, PartName: WideString; Decimals: Integer; Gender: WordBool): WideString;
begin
  Result := Internal_SimpleFigure(Number, CurrencyName, PartName, Decimals ,Gender)
end;

initialization
  TAutoObjectFactory.Create(ComServer, TFigure, Class_Figure, ciMultiInstance, tmApartment);
end.
