
{$i deltics.inc}

{$debuginfo OFF}


{$ifdef WIN32}
  {$define ExtendedIs10Bytes}
{$endif}

{$ifdef WIN64}
  {$define ExtendedIs8Bytes}
{$endif}

{$ifdef LINUX}
  {$define ExtendedIs16Bytes}
{$endif}

{$ifdef IOS32}
  {$define ExtendedIs16Bytes}
{$endif}

{$ifdef MACOS32}
  {$define ExtendedIs16Bytes}
{$endif}

{$ifdef CPUARM}
  {$define ExtendedIs8Bytes}
{$endif}

{$ifNdef ExtendedIs8Bytes}
  {$ifNdef ExtendedIs10Bytes}
    {$ifNdef ExtendedIs16Bytes}
      NO_DEFINE_FOR_EXTENDED_SIZE
    {$endif}
  {$endif}
{$endif}


{$ifdef debug_DelticsMath}
  {$undef InlineMethods}
  {$debuginfo ON}
{$endif}

