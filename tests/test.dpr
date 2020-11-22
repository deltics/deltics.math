
{$define CONSOLE}

{$i deltics.inc}

  program test;

uses
  Deltics.Smoketest,
  Deltics.Math in '..\src\Deltics.Math.pas',
  MinMaxTests in 'MinMaxTests.pas',
  RoundTests in 'RoundTests.pas';

begin
  TestRun.Test(TMinMaxTests);
  TestRun.Test(TRoundTests);
end.
