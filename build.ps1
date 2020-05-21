#!/usr/bin/pwsh

#region INIT
function Invoke-Sudo { 
    & /usr/bin/env sudo pwsh -command "& $args" 
}

set-alias sudo Invoke-Sudo

$BUILD_VERSION = "2.20.4.27"

Write-Output "Script version: $BUILD_VERSION"

$OUTPUTDIR = $PSScriptRoot + "/output/" 

New-Item  $OUTPUTDIR -ItemType Directory -Force 

Set-Location $PSScriptRoot 

#endregion

#region MSBUILD BUILD

Invoke-Expression  "msbuild ./GUTL/GUT.sln /nologo /t:build /p:Configuration=Release"
Remove-Item  $PSScriptRoot/GUTL/bin/Release/*.pdb 
#endregion

#region WINDOWS

$FILENAME = "GUTL"
Invoke-Expression "makensis -DPRODUCT_VERSION='$BUILD_VERSION' -DPRODUCT_FILENAME='$FILENAME' -DPRODUCT_BRAND='' -DOUTPUT_DIR='$OUTPUTDIR' $FILENAME.nsi"

#endregion

#region DEBIAN

$DEBIAN_PATH = "DebianPackage/gutl/debian/gutl/usr/lib/GUTL/"

Invoke-Sudo New-Item -ItemType Directory -Force $DEBIAN_PATH
 
Invoke-Sudo Copy-Item "GUTL/bin/Release/GUTL.exe" -Destination $DEBIAN_PATH  -Force -Verbose

Set-Location "DebianPackage/gutl"
    
Invoke-Sudo "chmod 777 debian/gutl/DEBIAN/"
    
Invoke-Sudo Remove-Item "debian/gutl/DEBIAN/control"
Invoke-Sudo "sed 's/GUTL_VERSION/$BUILD_VERSION/' control.sed > debian/gutl/DEBIAN/control"
    
Invoke-Sudo dh_md5sums
Invoke-Sudo dh_fixperms
Invoke-Sudo "dh_builddeb --destdir=$OUTPUTDIR"
#endregion 

#region MacOSX

Set-Location $PSScriptRoot 
    
$MAC_FOLDER_PATH = "MacOSX/GUTL/GUTL.app/Contents/MacOS/"

Copy-Item -Path "GUTL/bin/Release/GUTL.exe" -Destination $MAC_FOLDER_PATH -Recurse -Force -Verbose

Set-Location "MacOSX/GUTL/"
   

$OUTPUT_FILENAME = "$OUTPUTDIR" + "GUTL-macOSX-$BUILD_VERSION.dmg"

Invoke-Expression "mkisofs -J -R -apple -v -part -z -V GUTL -o $OUTPUT_FILENAME ./"

Set-Location $PSScriptRoot 

#endregion


