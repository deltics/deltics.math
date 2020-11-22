
{$i deltics.inc}

  unit RoundTests;


interface

  uses
    Deltics.Smoketest;

  type
    TRoundTests = class(TTest)
      procedure CeilRoundsNegativeValuesCorrectly;
      procedure CeilRoundsPositiveValuesCorrectly;
      procedure FloorRoundsNegativeValuesCorrectly;
      procedure FloorRoundsPositiveValuesCorrectly;
      procedure RoundAwayFromZeroRoundsPositiveValuesCorrectly;
      procedure RoundAwayFromZeroRoundsNegativeValuesCorrectly;
      procedure RoundTowardZeroRoundsPositiveValuesCorrectly;
      procedure RoundTowardZeroRoundsNegativeValuesCorrectly;
    end;


implementation

  uses
    Deltics.Math;



  procedure TRoundTests.CeilRoundsNegativeValuesCorrectly;
  begin
    Test('Ceil(-1.0)').Assert(Ceil(-1.0)).Equals(-1);
    Test('Ceil(-1.1)').Assert(Ceil(-1.1)).Equals(-1);
    Test('Ceil(-1.5)').Assert(Ceil(-1.5)).Equals(-1);
    Test('Ceil(-1.9)').Assert(Ceil(-1.9)).Equals(-1);
    Test('Ceil(-2.0)').Assert(Ceil(-2.0)).Equals(-2);
  end;


  procedure TRoundTests.CeilRoundsPositiveValuesCorrectly;
  begin
    Test('Ceil(1.0)').Assert(Ceil(1.0)).Equals(1);
    Test('Ceil(1.1)').Assert(Ceil(1.1)).Equals(2);
    Test('Ceil(1.5)').Assert(Ceil(1.5)).Equals(2);
    Test('Ceil(1.9)').Assert(Ceil(1.9)).Equals(2);
    Test('Ceil(2.0)').Assert(Ceil(2.0)).Equals(2);
  end;


  procedure TRoundTests.FloorRoundsNegativeValuesCorrectly;
  begin
    Test('Floor(-1.0)').Assert(Floor(-1.0)).Equals(-1);
    Test('Floor(-1.1)').Assert(Floor(-1.1)).Equals(-2);
    Test('Floor(-1.5)').Assert(Floor(-1.5)).Equals(-2);
    Test('Floor(-1.9)').Assert(Floor(-1.9)).Equals(-2);
    Test('Floor(-2.0)').Assert(Floor(-2.0)).Equals(-2);
  end;


  procedure TRoundTests.FloorRoundsPositiveValuesCorrectly;
  begin
    Test('Floor(1.0)').Assert(Floor(1.0)).Equals(1);
    Test('Floor(1.1)').Assert(Floor(1.1)).Equals(1);
    Test('Floor(1.5)').Assert(Floor(1.5)).Equals(1);
    Test('Floor(1.9)').Assert(Floor(1.9)).Equals(1);
    Test('Floor(2.0)').Assert(Floor(2.0)).Equals(2);
  end;


{ TRoundTests }

  procedure TRoundTests.RoundAwayFromZeroRoundsNegativeValuesCorrectly;
  begin
    Test('Round(-1.0)').Assert(Round(-1.0, rdAwayFromZero)).Equals(-1);
    Test('Round(-1.1)').Assert(Round(-1.1, rdAwayFromZero)).Equals(-2);
    Test('Round(-1.5)').Assert(Round(-1.5, rdAwayFromZero)).Equals(-2);
    Test('Round(-1.9)').Assert(Round(-1.9, rdAwayFromZero)).Equals(-2);
    Test('Round(-2.0)').Assert(Round(-2.0, rdAwayFromZero)).Equals(-2);
  end;


  procedure TRoundTests.RoundAwayFromZeroRoundsPositiveValuesCorrectly;
  begin
    Test('Round(1.0)').Assert(Round(1.0, rdAwayFromZero)).Equals(1);
    Test('Round(1.1)').Assert(Round(1.1, rdAwayFromZero)).Equals(2);
    Test('Round(1.5)').Assert(Round(1.5, rdAwayFromZero)).Equals(2);
    Test('Round(1.9)').Assert(Round(1.9, rdAwayFromZero)).Equals(2);
    Test('Round(2.0)').Assert(Round(2.0, rdAwayFromZero)).Equals(2);
  end;


  procedure TRoundTests.RoundTowardZeroRoundsNegativeValuesCorrectly;
  begin
    Test('Round(-1.0)').Assert(Round(-1.0, rdTowardZero)).Equals(-1);
    Test('Round(-1.1)').Assert(Round(-1.1, rdTowardZero)).Equals(-1);
    Test('Round(-1.5)').Assert(Round(-1.5, rdTowardZero)).Equals(-1);
    Test('Round(-1.9)').Assert(Round(-1.9, rdTowardZero)).Equals(-1);
    Test('Round(-2.0)').Assert(Round(-2.0, rdTowardZero)).Equals(-2);
  end;


  procedure TRoundTests.RoundTowardZeroRoundsPositiveValuesCorrectly;
  begin
    Test('Round(1.0)').Assert(Round(1.0, rdTowardZero)).Equals(1);
    Test('Round(1.1)').Assert(Round(1.1, rdTowardZero)).Equals(1);
    Test('Round(1.5)').Assert(Round(1.5, rdTowardZero)).Equals(1);
    Test('Round(1.9)').Assert(Round(1.9, rdTowardZero)).Equals(1);
    Test('Round(2.0)').Assert(Round(2.0, rdTowardZero)).Equals(2);
  end;

end.
