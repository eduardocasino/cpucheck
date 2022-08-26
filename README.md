## CPUCHECK
Simple CPU identificaction program for DOS. It is the same routine I use in VMSMOUNT, but in a standalone program. Based on info from [http://www.ukcpu.net/Programming/Hardware/x86/CPUID/x86-ID.asp](http://www.ukcpu.net/Programming/Hardware/x86/CPUID/x86-ID.asp) (Now defunct)

## Usage
CPUCHECK returns errorlevel 0 if CPU is 8086/80186, 2 if 80286, 3 if 80386 or greater.
<pre>CPUCHECK
if ERRORLEVEL 3 GOTO IS-386
if ERRORLEVEL 2 GOTO IS-286

ECHO CPU IS 80(1)86
GOTO END

:IS-286
ECHO CPU IS 80286
GOTO END

:IS-386
ECHO CPU IS 80386

:END
</pre>

## License
This code is in the Public Domain
