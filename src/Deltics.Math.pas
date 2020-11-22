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

  function Min(ValueA, ValueB: Int64): Int64; overload;
  function Min(ValueA, ValueB: Cardinal): Cardinal; overload;
  function Min(ValueA, ValueB: Integer): Integer; overload;

  function Max(ValueA, ValueB: Int64): Int64; overload;
  function Max(ValueA, ValueB: Cardinal): Cardinal; overload;
  function Max(ValueA, ValueB: Integer): Integer; overload;


  type
    TRoundingStrategy = (
                         rsDefault,
                         rsAwayFromZero,
                         rsTowardsZero
                        );

  function Round(const aValue: Extended;
                 const aStrategy: TRoundingStrategy = rsDefault): Integer;



implementation


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Min(ValueA, ValueB: Int64): Int64;
  begin
    if (ValueA < ValueB) then
      result := ValueA
    else
      result := ValueB;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Min(ValueA, ValueB: Cardinal): Cardinal;
  begin
    if (ValueA < ValueB) then
      result := ValueA
    else
      result := ValueB;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Min(ValueA, ValueB: Integer): Integer;
  begin
    if (ValueA < ValueB) then
      result := ValueA
    else
      result := ValueB;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Max(ValueA, ValueB: Int64): Int64;
  begin
    if (ValueA > ValueB) then
      result := ValueA
    else
      result := ValueB;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Max(ValueA, ValueB: Cardinal): Cardinal;
  begin
    if (ValueA > ValueB) then
      result := ValueA
    else
      result := ValueB;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Max(ValueA, ValueB: Integer): Integer;
  begin
    if (ValueA > ValueB) then
      result := ValueA
    else
      result := ValueB;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function Round(const aValue: Extended;
                 const aStrategy: TRoundingStrategy = rsDefault): Integer;
  var
    remainder: Extended;
  begin
    if (aStrategy = rsDefault) then
      result := System.Round(aValue)
    else
    begin
      result    := Trunc(aValue);
      remainder := Frac(aValue);

      case aStrategy of
        rsAwayFromZero  : if (remainder < 0) then
                            Dec(result)
                          else if (remainder > 0) then
                            Inc(result);

        rsTowardsZero   : if (remainder < 0) then
                            Inc(result)
                          else if (remainder > 0) then
                            Dec(result);
      end;
    end;
  end;



end.
