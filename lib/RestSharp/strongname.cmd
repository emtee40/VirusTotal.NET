@echo off
SET DIR=%~d0%~p0%
SET NAME=RestSharp
::%comspec% /k ""C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"" x86
::no need to ildasm/al

:: http://www.geekzilla.co.uk/ViewCE64BEF3-51A6-4F1C-90C9-6A76B015C9FB.htm
:: http://stackoverflow.com/questions/1220519/how-to-sign-a-net-assembly-dll-file-with-a-strong-name
:: http://ryanfarley.com/blog/archive/2010/04/23/sign-a-.net-assembly-with-a-strong-name-without-recompiling.aspx

call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" x86
:: the key file is the same
ildasm %DIR%%NAME%.dll /out:%DIR%%NAME%.il
rename %DIR%%NAME%.dll %NAME%.dll.orig
ilasm %DIR%%NAME%.il /dll /KEY=%DIR%..\..\chocolatey.snk
del %DIR%%NAME%.il
del %DIR%%NAME%.res