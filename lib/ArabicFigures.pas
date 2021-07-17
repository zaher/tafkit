unit ArabicFigures; {!$DONTTRANSUNIT}
{
/**
 * Extended Arabic figures numbers
 *
 * @license    GPL 2 (http://www.gnu.org/licenses/gpl.html)
 * @author     Zaher Dirkey <zaher@parmaja.org>
 */
}
interface

uses
  Windows, Messages, SysUtils;

const
  COUNTED_NUM = 5;

type
  TCurrencyNames = array[0..COUNTED_NUM - 1] of string;

const
  Figures: array[0..38] of string =
  (
    'واحد', //		0
    'أحد', //		1
    'اثني', //		2
    'ثلاثة', //		3
    'أربعة', //		4
    'خمسة', //		5
    'ستة', //		6
    'سبعة', //		7
    'ثمانية', //		8
    'تسعة', //		9
    'اثنين', //		10
    'واحد', //		11
    'إحدى', //		12
    'اثنتي', //		13
    'ثلاث', //		14
    'أربع', //		15
    'خمس', //		16
    'ست', //		17
    'سبع', //		18
    'ثمان', //		19
    'تسع', //		20
    'اثنتين', //		21
    'عشرة', //		22
    'عشر', //		23
    'عشرين', //		24
    'ثلاثين', //		25
    'أربعين', //		26
    'خمسين', //		27
    'ستين', //		28
    'سبعين', //		29
    'ثمانين', //		30
    'تسعين', //		31
    'مئة', //	 32
    'مئتين', //	33
    'مئتي', //	34
    'مئات', //	35
    'لاشئ', // 36
    ' ', //	37 
    ' و ' // 38
    );

  CountedFigures: array[0..29] of string =
  (
    'M', //
    'ألف', //
    'ألفين', //
    'ألفي', //
    'آلاف', //
    'M', //
    'مليون', //
    'مليونين', //
    'مليونا', //
    'ملايين', //
    'M', //
    'مليار', //
    'مليارين', //
    'مليارا', //
    'مليارات', //
    'M', //
    'بليون', //
    'بليونين', //
    'بليونا', //
    'بلايين', //
    'M', //
    'بليار', //
    'بليارين', //
    'بليارا', //
    'بليارات', //
    'M', //
    'تريليون', //
    'تريليونين', //
    'تريليونا', //
    'تريلايين' //
    );

function GetArabicFigure(Number: Int64; const CurrencyNames: TCurrencyNames): string;

implementation

function GetArabicFigurePart(Number: Int64; Counted: array of string; HasOther: Boolean; LastCount: Boolean): string;
var
  I: Integer;
  a1, a2, a3: Int64;
  f1, f2, f3: Int64;
  fa, fm, Mas, Mas11: Integer;

  Phrase: array[0..8] of Int64;

  PhraseStr: string;
  j: integer;
begin
  Result := '';

  Mas := Ord(Counted[0] = 'M');
  Mas11 := Mas * 11;
  a3 := (Number div 100);
  a2 := (Number div 10) mod 10;
  a1 := Number - a2 * 10 - a3 * 100;

  if (a1 > 2) then
    f1 := 3
  else
    f1 := a1;

  if (a2 > 1) then
    f2 := 2
  else
    f2 := a2;

  if (a3 > 2) then
    f3 := 3
  else
    f3 := a3;

  fa := (f2 * 4) + f1;

  fm := ord(fa > 0) * 4 + f3;

  for j := 0 to Length(Phrase) - 1 do
    Phrase[j] := -1;

  Phrase[0] := 1;

  case fa of
    0:
      begin
        if (a3 = 0) then
          if LastCount then
            Phrase[1] := 37
          else
            Phrase[0] := -1;
      end;
    1:
      begin
        if (not LastCount) and (not (a3 = 0)) then
        begin
          Phrase[1] := 37;
          Phrase[2] := Mas11;
        end;
      end;
    2:
      begin
        if (LastCount) or (a3 = 0) then
        begin
          Phrase[0] := 3 - ord(HasOther);
          Phrase[1] := -1;
          Phrase[2] := -1;
        end
        else
        begin
          Phrase[1] := 37;
          Phrase[2] := Mas11 + a1;
        end;
      end;
    3:
      begin
        Phrase[0] := 4;
        Phrase[1] := 37;
        Phrase[2] := Mas11 + a1;
      end;
    4:
      begin
        Phrase[0] := 4;
        Phrase[1] := 37;
        Phrase[2] := 22 + Mas;
      end;
    5, 6, 7:
      begin
        Phrase[1] := 37;
        Phrase[2] := 22 + Mas;
        Phrase[3] := 37;
        Phrase[4] := Mas11 + a1;
      end;
    8:
      begin
        Phrase[1] := 37;
        Phrase[2] := 22 + a2;
      end;
    9:
      begin
        Phrase[1] := 37;
        Phrase[2] := 22 + a2;
        Phrase[3] := 38;
        Phrase[4] := Mas11 + Mas;
      end;
    10:
      begin
        Phrase[1] := 37;
        Phrase[2] := 22 + a2;
        Phrase[3] := 38;
        Phrase[4] := Mas11 + 10;
      end;
    11:
      begin
        Phrase[1] := 37;
        Phrase[2] := 22 + a2;
        Phrase[3] := 38;
        Phrase[4] := Mas11 + a1;
      end;
  end;

  case fm of
    1:
      begin
        Phrase[5] := 37;
        Phrase[6] := 32;
      end;
    2:
      begin
        Phrase[5] := 37;
        Phrase[6] := 34;
      end;
    3:
      begin
        Phrase[5] := 37;
        Phrase[6] := 32;
        Phrase[7] := 11 + a3;
      end;
    5:
      begin
        Phrase[5] := 38;
        Phrase[6] := 32;
      end;
    6:
      begin
        Phrase[5] := 38;
        Phrase[6] := 33;
      end;
    7:
      begin
        Phrase[5] := 38;
        Phrase[6] := 32;
        Phrase[7] := 11 + a3;
      end;
  end;
  
  for I := 7 downto 1 do
    if (Phrase[i] >= 0) then
    begin
      PhraseStr := Figures[Phrase[I]];
      Result := Result + PhraseStr;
    end;

  if (Phrase[0] >= 0) then
    Result := Result + Counted[Phrase[0]];
  if (HasOther) then
    Result := Result + ' و ';
end;

function GetArabicFigure(Number: Int64; const CurrencyNames: TCurrencyNames): string;
var
  I, X: Integer;
  CurValue, ModValue: Int64;
  HasOther, LastCount: Boolean;
  Counted: TCurrencyNames;
  BufStr, StrRes: string;
  j: integer;
begin
  if Number = 0 then
    Result := Figures[36]
  else
  begin
    for j := 0 to 4 do
      Counted[j] := CurrencyNames[j];
    LastCount := True;
    StrRes := '';
    ModValue := Number;
    HasOther := False;
    CurValue := ModValue mod 1000;
    ModValue := (ModValue - CurValue) div 1000;

    StrRes := GetArabicFigurePart(CurValue, Counted, HasOther, LastCount);
    BufStr := StrRes;
    LastCount := False;
    I := 0;
    while (ModValue <> 0) do
    begin
      HasOther := (CurValue <> 0);
      CurValue := ModValue mod 1000;
      ModValue := (ModValue - CurValue) div 1000;
      X := 0;
      while X < COUNTED_NUM do
      begin
        Counted[X] := CountedFigures[I];
        X := X + 1;
        I := I + 1;
      end;
      StrRes := GetArabicFigurePart(CurValue, Counted, HasOther, LastCount);
      StrRes := StrRes + BufStr;
      BufStr := StrRes;
    end;
    Result := StrRes;
  end;
end;

end.

