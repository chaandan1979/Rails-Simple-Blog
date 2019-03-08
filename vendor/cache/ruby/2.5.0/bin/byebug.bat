@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"E:\rubyonrails\RailsInstaller\Ruby25-x64\bin\ruby.exe" "E:/rubyonrails/ProjectApps/blog/vendor/cache/ruby/2.5.0/bin/byebug" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"E:\rubyonrails\RailsInstaller\Ruby25-x64\bin\ruby.exe" "%~dpn0" %*
