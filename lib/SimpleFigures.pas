unit SimpleFigures; {!$DONTTRANSUNIT}
{
/**
 * Arabic figures numbers
 *
 * @license    GPL 2 (http://www.gnu.org/licenses/gpl.html)
 * @author     Jihad Khalifa <jihad@parmaja.com>
 */
}
interface

uses
  SysUtils;

function ArabicSimpleFigure(const Number: string; const CurrencyName, PartName: string; Decimals: Integer = 2; Gender: Boolean = False): string;

implementation

function NoDoubleSpace(vStr: string): string;
var
  i: integer;
begin
  i := 0;
  while i < length(vStr) do
  begin
    i := i + 1;
    if (vStr[i] = ' ') and (vStr[i + 1] = ' ') then
      Delete(vStr, i + 1, 1);
  end;
  Result := vStr;
end;

const
  FirstArray: array[1..9, 0..1] of string = (('واحد', 'إحدى'), ('اثنان', 'اثنا'), ('ثلاثة', 'ثلاث'), ('أربعة', 'أربع'),
    ('خمسة', 'خمس'), ('ستة', 'ست'), ('سبعة', 'سبع'), ('ثمانية', 'ثمان'), ('تسعة', 'تسع'));
  FirstArray1: array[1..2, 0..1] of string = (('أحد', 'إحدى'), ('اثنا', 'اثنتا'));
  SecondArray: array[1..9, 0..1] of string = (('عشرة', 'عشر'), ('عشرون', 'عشرون'), ('ثلاثون', 'ثلاثون'), ('أربعون', 'أربعون'), ('خمسون', 'خمسون'),
    ('ستون', 'ستون'), ('سبعون', 'سبعون'), ('ثمانون', 'ثمانون'), ('تسعون', 'تسعون'));
  ThirdArray: array[1..9] of string = ('مائة', 'مائتان', 'ثلاثمائة', 'أربعمائة', 'خمسمائة', 'ستمائة',
    'سبعمائة', 'ثمانمائة', 'تسعمائة');

function GetNum(var S: string; Index: integer; Gender: Boolean): string;
var
  StrLen: integer;
  Indx: array[1..3] of integer;
  TmpArray: array[0..2] of string;
  TmpStr: string;
begin
  Indx[1] := -1;
  Indx[2] := -1;
  Indx[3] := -1;
  StrLen := Length(S);
  Indx[1] := StrToInt(Copy(S, StrLen, 1));
  if (Indx[1] <> 0) then
    TmpArray[0] := FirstArray[Indx[1], Ord(Gender)] + ' ';
  Dec(StrLen);
  
  if StrLen > 0 then
  begin
    Indx[2] := StrToInt(Copy(S, StrLen, 1));
    if (Indx[2] <> 0) then
      if (TmpArray[0] <> '') then
        TmpArray[1] := SecondArray[Indx[2], Ord(not Gender)] {}
      else
        TmpArray[1] := SecondArray[Indx[2], Ord(Gender)];
  end;
  
  if (Indx[2] > 1) and (TmpArray[0] <> '') then
    TmpArray[0] := TmpArray[0] + 'و '
  else if (Indx[1] = 1) and (Indx[2] = 1) then
    TmpArray[0] := FirstArray1[1, Ord(Gender)]
  else if (Indx[1] = 2) and (Indx[2] = 1) then
    TmpArray[0] := FirstArray1[2, Ord(Gender)];
  Dec(StrLen);
  if StrLen > 0 then
  begin
    Indx[3] := StrToInt(Copy(S, StrLen, 1));
    if (Indx[3] <> 0) then
      TmpArray[2] := ThirdArray[Indx[3]];
  end;
  if Index = -1 then
    if (Indx[3] <> -1) then
      Exit;
  if (Indx[3] > 0) and ((TmpArray[0] <> '') or (TmpArray[1] <> '')) then
    TmpArray[2] := TmpArray[2] + ' و ';

  case Index of
    -1:
      begin
        TmpStr := TmpArray[2] + TmpArray[0] + TmpArray[1];
        if (Indx[1] > 0) and (Indx[2] = -1) and (Indx[3] = -1) then
          Result := SecondArray[Indx[1], Ord(Gender)]
        else
          Result := TmpStr;
      end;

    0:
      begin
        Result := TmpArray[2] + TmpArray[0] + TmpArray[1];
      end;
    1:
      begin
        if (Indx[1] = 1) and (Indx[2] = -1) and (Indx[3] = -1) then
          Result := ' ألف'
        else if (Indx[1] = 2) and (Indx[2] = -1) and (Indx[3] = -1) then
          Result := 'ألفان'
        else if (Indx[1] > 2) and (Indx[2] = -1) and (Indx[3] = -1) then
          Result := TmpArray[0] + ' ألاف'
        else if (Indx[1] > 2) and (Indx[2] = 0) and (Indx[3] <> -1) then
          Result := TmpArray[2] + TmpArray[0] + TmpArray[1] + ' ألاف'
        else if (Indx[1] = 0) and (Indx[2] = 1) and (Indx[3] = -1) then
          Result := TmpArray[2] + TmpArray[0] + TmpArray[1] + ' ألاف'
        else if (Indx[1] = 0) and (Indx[2] = 0) and (Indx[3] = 0) then
          Result := TmpArray[2] + TmpArray[0] + TmpArray[1]
        else
          Result := TmpArray[2] + TmpArray[0] + TmpArray[1] + ' ألف';
      end;

    2:
      begin
        if (Indx[1] = 1) and (Indx[2] = -1) and (Indx[3] = -1) then
          Result := ' مليون'
        else if (Indx[1] = 2) and (Indx[2] = -1) and (Indx[3] = -1) then
          Result := 'مليونان'
        else if (Indx[1] > 2) and (Indx[2] = -1) and (Indx[3] = -1) then
          Result := TmpArray[0] + 'ملايين'
        else if (Indx[1] > 2) and (Indx[2] = 0) and (Indx[3] <> -1) then
          Result := TmpArray[2] + TmpArray[0] + TmpArray[1] + 'ملايين'
        else if (Indx[1] = 0) and (Indx[2] = 1) and (Indx[3] = -1) then
          Result := TmpArray[2] + TmpArray[0] + TmpArray[1] + 'ملايين'
        else if (Indx[1] = 0) and (Indx[2] = 0) and (Indx[3] = 0) then
          Result := TmpArray[2] + TmpArray[0] + TmpArray[1]
        else
          Result := TmpArray[2] + TmpArray[0] + TmpArray[1] + ' مليون';
      end;

    3:
      begin
        if (Indx[1] = 1) and (Indx[2] = -1) and (Indx[3] = -1) then
          Result := ' مليار'
        else if (Indx[1] = 2) and (Indx[2] = -1) and (Indx[3] = -1) then
          Result := 'ملياران'
        else if (Indx[1] > 2) and (Indx[2] = -1) and (Indx[3] = -1) then
          Result := TmpArray[0] + 'مليارات'
        else if (Indx[1] > 2) and (Indx[2] = -1) and (Indx[3] = -1) then
          Result := TmpArray[2] + TmpArray[0] + TmpArray[1] + 'مليارات'
        else if (Indx[1] = 0) and (Indx[2] = 1) and (Indx[3] = -1) then
          Result := TmpArray[2] + TmpArray[0] + TmpArray[1] + 'مليارات'
        else
          Result := TmpArray[2] + TmpArray[0] + TmpArray[1] + ' مليار';
      end;
  end;
end;

function GetArabicSimpleFigure(const Number: string; const CurrencyName: string; Gender: Boolean): string;
var
  Parts: array[0..4] of string;
  PartStr: array[0..3] of string;
  Txt, S, EndStr: string;
  i, StrLength: integer;
begin
  if Number = '0' then
  begin
    Result := ' صفر';
    Exit;
  end;
  if Number = '' then
  begin
    Result := '';
    Exit;
  end;

  Txt := '';
  i := -1;

  S := Trim(Number);
  StrLength := Length(S);
  Parts[0] := S;
  while StrLength >= 3 do
  begin
    StrLength := StrLength - 3;
    i := i + 1;
    Parts[i] := Copy(S, StrLength + 1, 3);
    S := Copy(S, 1, StrLength)
  end;

  Parts[i + 1] := S;

  for i := 0 to 3 do
    if Length(Parts[i]) > 0 then
      PartStr[i] := GetNum(Parts[i], i, Gender);
  for i := 3 downto 0 do
    if Length(PartStr[i]) > 0 then
      if (i <> 0) and (Length(PartStr[i - 1]) > 0) then
        EndStr := EndStr + ' ' + PartStr[i] + ' و '
      else
        EndStr := EndStr + ' ' + PartStr[i] + ' ' + CurrencyName;
  Result := Trim(EndStr);
  Result := NoDoubleSpace(Result);
end;

function ArabicSimpleFigure(const Number: string; const CurrencyName, PartName: string; Decimals: Integer; Gender: Boolean): string;
var
  AfterPoint, aNumber, S: string;
  L, P: Integer;
begin
  p := Pos('.', Number);
  if p > 0 then
  begin
    AfterPoint := Copy(Number, P + 1, Decimals);
    if AfterPoint <> '' then
    begin
      L := Decimals - Length(AfterPoint);
      if L > 0 then
        AfterPoint := AfterPoint + StringOfChar('0', L);
      AfterPoint := FloatToStr(StrToFloat(AfterPoint));
    end;
    aNumber := Copy(Number, 0, P - 1);
  end
  else
    aNumber := Number;

  Result := GetArabicSimpleFigure(aNumber, CurrencyName, Gender);
  if (AfterPoint <> '') then
  begin
    S := GetArabicSimpleFigure(AfterPoint, PartName, Gender);
    Result := Result + ' و ' + s;
  end;
end;

end.

