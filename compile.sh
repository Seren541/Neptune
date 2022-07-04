#!/bin/bash
filename=src/Neptune.AppDir/usr/bin/appimageupdatetool-x86_64.AppImage
if [ -f "$filename" ];
then
    :
else
    wget https://github.com/AppImage/AppImageUpdate/releases/download/2.0.0-alpha-1-20220124/appimageupdatetool-x86_64.AppImage -P src/Neptune.AppDir/usr/bin
    chmod +x src/Neptune.AppDir/usr/bin/appimageupdatetool-x86_64.AppImage
fi
filename=src/Neptune.AppDir/usr/bin/aisap-0.6.6-alpha-x86_64.AppImage
if [ -f "$filename" ];
then
    :
else
    wget https://github.com/mgord9518/aisap/releases/download/v0.6.6-alpha/aisap-0.6.6-alpha-x86_64.AppImage -P src/Neptune.AppDir/usr/bin
    #wget https://github.com/mgord9518/aisap/releases/download/continuous/aisap-0.6.7-alpha-x86_64.AppImage -P src/Neptune.AppDir/usr/bin
    chmod +x src/Neptune.AppDir/usr/bin/aisap-0.6.6-alpha-x86_64.AppImage
fi
cp /usr/local/lib/libneptune.so src/Neptune.AppDir/usr/lib
gcc src/AppRun.c -o src/Neptune.AppDir/AppRun -Wno-format-truncation
gcc src/main.c -lappimage -liup -lneptune -o src/Neptune.AppDir/usr/bin/Neptune
gcc src/installer.c -o src/Neptune.AppDir/usr/bin/installer
appimagetool src/Neptune.AppDir/ > build.output
