
{$i deltics.inc}

  unit MinMaxTests;


interface

  uses
    Deltics.Smoketest;


  type
    TMinMaxTests = class(TTest)
      procedure MinOfTwoCardinalsYieldsCorrectResult;
      procedure MinOfTwoIntegersYieldsCorrectResult;
      procedure MinOfTwoInt64sYieldsCorrectResult;
      procedure MaxOfTwoCardinalsYieldsCorrectResult;
      procedure MaxOfTwoIntegersYieldsCorrectResult;
      procedure MaxOfTwoInt64sYieldsCorrectResult;
    end;


implementation

  uses
    Deltics.Math;





{ TMinMaxTests }

  procedure TMinMaxTests.MinOfTwoCardinalsYieldsCorrectResult;
  var
    a, b: Cardinal;
  begin
    a := 0; b := 1;
    Test('Min({a:%d}, {b:%d})', [a, b]).Assert(Min(a, b)).Equals(a);

    a := High(Cardinal) - 1; b := High(Cardinal);
    Test('Min({a:%d}, {b:%d})', [a, b]).Assert(Min(a, b)).Equals(a);

    a := Low(Cardinal); b := Low(Cardinal) + 1;
    Test('Min({a:%d}, {b:%d})', [a, b]).Assert(Min(a, b)).Equals(a);
  end;


  procedure TMinMaxTests.MinOfTwoInt64sYieldsCorrectResult;
  var
    a, b: Int64;
  begin
    a := 0; b := 1;
    Test('Min({a:%d}, {b:%d})', [a, b]).Assert(Min(a, b)).Equals(a);

    a := -1; b := 0;
    Test('Min({a:%d}, {b:%d})', [a, b]).Assert(Min(a, b)).Equals(a);

    a := High(Int64) - 1; b := High(Int64);
    Test('Min({a:%d}, {b:%d})', [a, b]).Assert(Min(a, b)).Equals(a);

    a := Low(Int64); b := Low(Int64) + 1;
    Test('Min({a:%d}, {b:%d})', [a, b]).Assert(Min(a, b)).Equals(a);
  end;


  procedure TMinMaxTests.MinOfTwoIntegersYieldsCorrectResult;
  var
    a, b: Integer;
  begin
    a := 0; b := 1;
    Test('Min({a:%d}, {b:%d})', [a, b]).Assert(Min(a, b)).Equals(a);

    a := -1; b := 0;
    Test('Min({a:%d}, {b:%d})', [a, b]).Assert(Min(a, b)).Equals(a);

    a := High(Integer) - 1; b := High(Integer);
    Test('Min({a:%d}, {b:%d})', [a, b]).Assert(Min(a, b)).Equals(a);

    a := Low(Integer); b := Low(Integer) + 1;
    Test('Min({a:%d}, {b:%d})', [a, b]).Assert(Min(a, b)).Equals(a);
  end;


  procedure TMinMaxTests.MaxOfTwoCardinalsYieldsCorrectResult;
  var
    a, b: Cardinal;
  begin
    a := 0; b := 1;
    Test('Max({a:%d}, {b:%d})', [a, b]).Assert(Max(a, b)).Equals(b);

    a := High(Cardinal) - 1; b := High(Cardinal);
    Test('Max({a:%d}, {b:%d})', [a, b]).Assert(Max(a, b)).Equals(b);

    a := Low(Cardinal); b := Low(Cardinal) + 1;
    Test('Max({a:%d}, {b:%d})', [a, b]).Assert(Max(a, b)).Equals(b);
  end;


  procedure TMinMaxTests.MaxOfTwoInt64sYieldsCorrectResult;
  var
    a, b: Int64;
  begin
    a := 0; b := 1;
    Test('Max({a:%d}, {b:%d})', [a, b]).Assert(Max(a, b)).Equals(b);

    a := -1; b := 0;
    Test('Max({a:%d}, {b:%d})', [a, b]).Assert(Max(a, b)).Equals(b);

    a := High(Int64) - 1; b := High(Int64);
    Test('Max({a:%d}, {b:%d})', [a, b]).Assert(Max(a, b)).Equals(b);

    a := Low(Int64); b := Low(Int64) + 1;
    Test('Max({a:%d}, {b:%d})', [a, b]).Assert(Max(a, b)).Equals(b);
  end;


  procedure TMinMaxTests.MaxOfTwoIntegersYieldsCorrectResult;
  var
    a, b: Integer;
  begin
    a := 0; b := 1;
    Test('Max({a:%d}, {b:%d})', [a, b]).Assert(Max(a, b)).Equals(b);

    a := -1; b := 0;
    Test('Max({a:%d}, {b:%d})', [a, b]).Assert(Max(a, b)).Equals(b);

    a := High(Integer) - 1; b := High(Integer);
    Test('Max({a:%d}, {b:%d})', [a, b]).Assert(Max(a, b)).Equals(b);

    a := Low(Integer); b := Low(Integer) + 1;
    Test('Max({a:%d}, {b:%d})', [a, b]).Assert(Max(a, b)).Equals(b);
  end;



end.
