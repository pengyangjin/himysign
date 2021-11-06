@echo off
set BAT_DIR=%~dp0

::设置变量

SET Sender1=%~1
SET Sender2=%~dp1
SET Sender3=%~n1
SET Sender4=%~x1
echo Sender %Sender2%%Sender3%_signed%Sender4%

%BAT_DIR%zipalign.exe -v 4 %Sender1%  %Sender2%%Sender3%_zipalign%Sender4%
java -jar %BAT_DIR%apksigner.jar sign --ks %BAT_DIR%development-android-debug.jks --ks-key-alias androiddebugkey --key-pass pass:android --ks-pass pass:android --v1-signing-enabled true --v2-signing-enabled true --v3-signing-enabled  false --v4-signing-enabled false --out %Sender2%%Sender3%_signed%Sender4% %Sender2%%Sender3%_zipalign%Sender4%
java -jar %BAT_DIR%apksigner.jar verify -v --print-certs %Sender2%%Sender3%_signed%Sender4%

del /a /f /s %Sender2%%Sender3%_zipalign%Sender4%