
{$i deltics.inc}

{$debuginfo OFF}


{$define ExtendedIs8Bytes}

{$if SizeOf(Extended) = 10}
  {$define ExtendedIs10Bytes}
  {$undef ExtendedIs8Bytes}
{$endif}


{$ifdef debug_DelticsMath}
  {$undef InlineMethods}
  {$debuginfo ON}
{$endif}

