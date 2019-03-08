@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"C:\jruby-9.2.6.0\bin\jruby.exe" "E:/rubyonrails/ProjectApps/blog/vendor/cache/jruby/2.5.0/bin/rake" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"C:\jruby-9.2.6.0\bin\jruby.exe" "%~dpn0" %*
