{
  * MIT LICENSE *

  Copyright © 2020 Jolyon Smith

  Permission is hereby granted, free of charge, to any person obtaining a copy of
   this software and associated documentation files (the "Software"), to deal in
   the Software without restriction, including without limitation the rights to
   use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
   of the Software, and to permit persons to whom the Software is furnished to do
   so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
   copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.


  * GPL and Other Licenses *

  The FSF deem this license to be compatible with version 3 of the GPL.
   Compatability with other licenses should be verified by reference to those
   other license terms.


  * Contact Details *

  Original author : Jolyon Direnko-Smith
  e-mail          : jsmith@deltics.co.nz
  github          : deltics/deltics.rtl
}

{$i deltics.math.inc}

  unit Deltics.Math;


interface

  type
    TValueSign = -1..1;

  const
    Negative = -1;
    Zero     = 0;
    Positive = 1;


  function Min(const aValueA, aValueB: Int64): Int64; overload; {$ifdef InlineMethods} inline; {$endif}
  function Min(const aValueA, aValueB: Cardinal): Cardinal; overload; {$ifdef InlineMethods} inline; {$endif}
  function Min(const aValueA, aValueB: Integer): Integer; overload; {$ifdef InlineMethods} inline; {$endif}

  function Max(const aValueA, aValueB: Int64): Int64; overload; {$ifdef InlineMethods} inline; {$endif}
  function Max(const aValueA, aValueB: Cardinal): Cardinal; overload; {$ifdef InlineMethods} inline; {$endif}
  function Max(const aValueA, aValueB: Integer): Integer; overload; {$ifdef InlineMethods} inline; {$endif}

  type
    TRoundDirection = (
      rdAwayFromZero,
      rdTowardNegInfinity,
      rdTowardPosInfinity,
      rdTowardZero
    );

  function Ceil(const aValue: Double): Integer; {$ifdef InlineMethods} inline; {$endif}
  function Floor(const aValue: Double): Integer; {$ifdef InlineMethods} inline; {$endif}
  function Round(const aValue: Double; const aDirection: TRoundDirection): Integer; {$ifdef InlineMethods} inline; {$endif}


  function Sign(const aValue: Integer): TValueSign; overload; {$ifdef InlineMethods} inline; {$endif}
  function Sign(const aValue: Int64): TValueSign; overload; {$ifdef InlineMethods} inline; {$endif}
  function Sign(const aValue: Single): TValueSign; overload; {$ifdef InlineMethods} inline; {$endif}
  function Sign(const aValue: Double): TValueSign; overload; {$ifdef InlineMethods} inline; {$endif}
  function Sign(const aValue: Extended): TValueSign; overload; {$ifdef InlineMethods} inline; {$endif}



implementation

  uses
    Math,
    Deltics.Exceptions;



  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Min(const aValueA, aValueB: Int64): Int64;
  begin
    if (aValueA < aValueB) then
      result := aValueA
    else
      result := aValueB;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Min(const aValueA, aValueB: Cardinal): Cardinal;
  begin
    if (aValueA < aValueB) then
      result := aValueA
    else
      result := aValueB;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Min(const aValueA, aValueB: Integer): Integer;
  begin
    if (aValueA < aValueB) then
      result := aValueA
    else
      result := aValueB;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Max(const aValueA, aValueB: Int64): Int64;
  begin
    if (aValueA > aValueB) then
      result := aValueA
    else
      result := aValueB;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Max(const aValueA, aValueB: Cardinal): Cardinal;
  begin
    if (aValueA > aValueB) then
      result := aValueA
    else
      result := aValueB;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Max(const aValueA, aValueB: Integer): Integer;
  begin
    if (aValueA > aValueB) then
      result := aValueA
    else
      result := aValueB;
  end;



  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Ceil(const aValue: Double): Integer;
  begin
    result := Trunc(aValue);

    if   (Deltics.Math.Sign(aValue) = Positive)
     and (Frac(aValue) <> 0) then
      Inc(result);
  end;



  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Floor(const aValue: Double): Integer;
  begin
    result := Trunc(aValue);

    if   (Deltics.Math.Sign(aValue) = Negative)
     and (Frac(aValue) <> 0) then
      Dec(result);
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Round(const aValue: Double;
                 const aDirection: TRoundDirection): Integer;
  begin
    case aDirection of
      rdAwayFromZero      : if Frac(aValue) = 0 then
                              result := Trunc(aValue)
                            else
                              result := Trunc(aValue) + Deltics.Math.Sign(aValue);
      rdTowardNegInfinity : result := Floor(aValue);
      rdTowardPosInfinity : result := Ceil(aValue);
      rdTowardZero        : result := Trunc(aValue);
    else
      raise ENotImplemented.Create;
    end;
  end;



  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Sign(const aValue: Integer): TValueSign;
  begin
    result := Zero;
    if aValue < 0 then
      result := Negative
    else if aValue > 0 then
      result := Positive;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Sign(const aValue: Int64): TValueSign;
  begin
    result := Zero;
    if aValue < 0 then
      result := Negative
    else if aValue > 0 then
      result := Positive;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Sign(const aValue: Single): TValueSign;
  begin
    if (PInteger(@aValue)^ and $7fffffff) = $00000000 then
      result := Zero
    else if (PInteger(@aValue)^ and $80000000) = $80000000 then
      result := Negative
    else
      result := Positive;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Sign(const aValue: Double): TValueSign;
  begin
    if ((PInt64(@aValue)^ and $7fffffffffffffff) = $0000000000000000) then
      result := Zero
    else if ((PInt64(@aValue)^ and $8000000000000000) = $8000000000000000) then
      result := Negative
    else
      result := Positive;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Sign(const aValue: Extended): TValueSign;
  begin
    result := Math.Sign(aValue);
  end;




end.
