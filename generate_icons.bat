@echo off
echo Generating Flutter Launcher Icons for both flavors...
echo.
echo Generating Student Icons...
dart run flutter_launcher_icons:main -f flutter_launcher_icons-student.yaml
echo.
echo Generating Doctor Icons...  
dart run flutter_launcher_icons:main -f flutter_launcher_icons-doctor.yaml
echo.
echo Done! Icons generated for both student and doctor flavors.
pause
