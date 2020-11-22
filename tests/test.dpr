
{$define CONSOLE}

{$i deltics.inc}

  program test;

uses
  Deltics.Smoketest,
  Deltics.Math in '..\src\Deltics.Math.pas',
  MinMaxTests in 'MinMaxTests.pas';

begin
  TestRun.Test(TMinMaxTests);
end.
