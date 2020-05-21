!include "MUI2.nsh"
!include "DotNetChecker.nsh"
;--------------------------------
;General

    ;Properly display all languages (Installer will not work on Windows 95, 98 or ME!)
    Unicode true
    SetCompressor /SOLID /FINAL lzma
    ; Graphical Installer Wizard common defines
    !ifndef PRODUCT_NAME
    !define PRODUCT_NAME "GUTL"
    !endif

    !ifndef PRODUCT_VERSION
    !define PRODUCT_VERSION "1.0.0.0"
    !endif

    !ifndef PRODUCT_PUBLISHER
    !define PRODUCT_PUBLISHER "AxisSoft"
    !endif

    !ifndef PRODUCT_FILENAME
    !define PRODUCT_FILENAME "GUTL"
    !endif
    
    !ifndef PRODUCT_BRAND
    !define PRODUCT_BRAND "Neo"
    !endif

    !ifndef PRODUCT_WEB_SITE
    !define PRODUCT_WEB_SITE "http://t.me/s/AxisPOS"
    !endif

    
    !ifndef OUTPUT_DIR
    !define OUTPUT_DIR ".\"
    !endif
    
    !define PRODUCT_DIR_REGKEY "Software\${PRODUCT_NAME}"
    !define PRODUCT_UNINST_KEY "Software\${PRODUCT_NAME}\Uninstall\${PRODUCT_NAME}"
    !define PRODUCT_UNINST_ROOT_KEY "HKLM"

    Name "${PRODUCT_PUBLISHER} ${PRODUCT_NAME}"
    OutFile "${OUTPUT_DIR}${PRODUCT_FILENAME}${PRODUCT_BRAND}Setup-${PRODUCT_VERSION}.exe"
    InstallDir "$PROGRAMFILES\${PRODUCT_PUBLISHER}\${PRODUCT_NAME}"
    Caption "${PRODUCT_PUBLISHER} ${PRODUCT_NAME}"
    InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
    ShowInstDetails nevershow
    ShowUninstDetails hide
    BrandingText "${PRODUCT_PUBLISHER} ${PRODUCT_NAME} - ${PRODUCT_VERSION}"
    RequestExecutionLevel admin
        
    Var StartMenuFolder

;--------------------------------
;Interface Settings

    !define MUI_COMPONENTSPAGE_SMALLDESC

    !define MUI_ABORTWARNING
    !define MUI_HEADERIMAGE
    
    !define MUI_ICON "gutl.ico"

    !define MUI_LANGDLL_ALLLANGUAGES
    !insertmacro MUI_DEFAULT MUI_TEXT_COLOR FFFFFF
    !insertmacro MUI_DEFAULT MUI_BGCOLOR F0F7Fe

    !define MUI_WELCOMEPAGE_TITLE_3LINES

    !insertmacro MUI_PAGE_WELCOME
    !insertmacro MUI_PAGE_LICENSE "copyright.txt"
    !insertmacro MUI_PAGE_COMPONENTS
    !insertmacro MUI_PAGE_DIRECTORY


    ;Start Menu Folder Page Configuration
    !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU"
    !define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_DIR_REGKEY}"
    !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"

    !insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder

    !insertmacro MUI_PAGE_INSTFILES

    !define MUI_FINISHPAGE_TITLE_3LINES
    ;!define MUI_FINISHPAGE_RUN "$INSTDIR\${PRODUCT_FILENAME}.exe"
    !insertmacro MUI_PAGE_FINISH


    !insertmacro MUI_UNPAGE_CONFIRM
    !insertmacro MUI_UNPAGE_INSTFILES
    !insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Language Selection Dialog Settings

  ;Remember the installer language
  !define MUI_LANGDLL_REGISTRY_ROOT "HKCU"
  !define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_DIR_REGKEY}"
  !define MUI_LANGDLL_REGISTRY_VALUENAME "Installer Language"

;--------------------------------
;Languages

!insertmacro MUI_LANGUAGE "English" ;first language is the default language
!insertmacro MUI_LANGUAGE "French"
!insertmacro MUI_LANGUAGE "German"
!insertmacro MUI_LANGUAGE "Spanish"
!insertmacro MUI_LANGUAGE "SpanishInternational"
!insertmacro MUI_LANGUAGE "SimpChinese"
!insertmacro MUI_LANGUAGE "TradChinese"
!insertmacro MUI_LANGUAGE "Japanese"
!insertmacro MUI_LANGUAGE "Korean"
!insertmacro MUI_LANGUAGE "Italian"
!insertmacro MUI_LANGUAGE "Dutch"
!insertmacro MUI_LANGUAGE "Russian"
!insertmacro MUI_LANGUAGE "Portuguese"
!insertmacro MUI_LANGUAGE "PortugueseBR"
!insertmacro MUI_LANGUAGE "Ukrainian"
!insertmacro MUI_LANGUAGE "Czech"
!insertmacro MUI_LANGUAGE "Bulgarian"
!insertmacro MUI_LANGUAGE "Romanian"
!insertmacro MUI_LANGUAGE "Macedonian"
!insertmacro MUI_LANGUAGE "Turkish"
!insertmacro MUI_LANGUAGE "Belarusian"
!insertmacro MUI_LANGUAGE "Armenian"

    VIProductVersion "${PRODUCT_VERSION}"
    VIFileVersion "${PRODUCT_VERSION}"
    VIAddVersionKey    /LANG=${LANG_ENGLISH} "Comments" "Point of Sale software from ${PRODUCT_PUBLISHER}"
    VIAddVersionKey    /LANG=${LANG_ENGLISH} "ProductName" "${PRODUCT_NAME}"
    VIAddVersionKey    /LANG=${LANG_ENGLISH} "ProductVersion" "${PRODUCT_VERSION}"
    VIAddVersionKey    /LANG=${LANG_ENGLISH} "CompanyName" "${PRODUCT_PUBLISHER}"
    VIAddVersionKey    /LANG=${LANG_ENGLISH} "LegalTrademarks" "${PRODUCT_NAME} is a trademark of ${PRODUCT_PUBLISHER}"
    VIAddVersionKey    /LANG=${LANG_ENGLISH} "LegalCopyright" "© ${PRODUCT_PUBLISHER} Ltd. 2015 All rights reserved."
    VIAddVersionKey    /LANG=${LANG_ENGLISH} "FileDescription" "${PRODUCT_NAME}"
    VIAddVersionKey    /LANG=${LANG_ENGLISH} "OriginalFilename" "${PRODUCT_FILENAME}${PRODUCT_BRAND}Setup-${PRODUCT_VERSION}.exe"
    VIAddVersionKey    /LANG=${LANG_ENGLISH} "FileVersion" "${PRODUCT_VERSION}"
    VIAddVersionKey    /LANG=${LANG_SPANISH} "Comments" "Terminal de Punto de Venta de ${PRODUCT_PUBLISHER}"
    VIAddVersionKey    /LANG=${LANG_SPANISH} "ProductName" "${PRODUCT_NAME}"
    VIAddVersionKey    /LANG=${LANG_SPANISH} "ProductVersion" "${PRODUCT_VERSION}"
    VIAddVersionKey    /LANG=${LANG_SPANISH} "CompanyName" "${PRODUCT_PUBLISHER}"
    VIAddVersionKey    /LANG=${LANG_SPANISH} "LegalTrademarks" "${PRODUCT_NAME} es una marca registrada de ${PRODUCT_PUBLISHER}"
    VIAddVersionKey    /LANG=${LANG_SPANISH} "LegalCopyright" "© ${PRODUCT_PUBLISHER} Ltd. 2016 Todos los derechos reservados."
    VIAddVersionKey    /LANG=${LANG_SPANISH} "FileDescription" "${PRODUCT_NAME}"
    VIAddVersionKey    /LANG=${LANG_SPANISH} "OriginalFilename" "${PRODUCT_FILENAME}${PRODUCT_BRAND}Setup-${PRODUCT_VERSION}.exe"
    VIAddVersionKey    /LANG=${LANG_SPANISH} "FileVersion" "${PRODUCT_VERSION}"
  !insertmacro MUI_RESERVEFILE_LANGDLL

;--------------------------------
;Installer Sections
;--------------------------------

SectionGroup  "!Work Station" WorkStation
    InstType "Full workstation"

      Section "!${PRODUCT_NAME}" SecWorkStation
        SectionIn 1 2
        SetOutPath "$INSTDIR"
        SetOverwrite ifnewer

        ;Store installation folder
        WriteRegStr HKCU "Software\${PRODUCT_NAME}" "" $INSTDIR


		!if "${PRODUCT_FILENAME}" == "AxisPOS" 
			File "ObfuscatedBin\AxisPOS.exe"
			File "ObfuscatedBin\MobileService.exe"
			File "ObfuscatedBin\AxisPOS.Resources.dll"
		!endif

        CreateDirectory "$SMPROGRAMS\${PRODUCT_PUBLISHER}"
        CreateDirectory "$SMPROGRAMS\${PRODUCT_PUBLISHER}\${PRODUCT_NAME}"

        WriteUninstaller "$INSTDIR\Uninstall.exe"
        CreateShortcut "$SMPROGRAMS\${PRODUCT_PUBLISHER}\${PRODUCT_NAME}\Uninstall.lnk" "$INSTDIR\Uninstall.exe"
        CreateShortcut "$SMPROGRAMS\${PRODUCT_PUBLISHER}\${PRODUCT_NAME}\${PRODUCT_NAME}.lnk" "$INSTDIR\${PRODUCT_FILENAME}.exe"

            WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
                 "DisplayName" "${PRODUCT_PUBLISHER} ${PRODUCT_NAME}"
            WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
                 "DisplayIcon" "$INSTDIR\${PRODUCT_FILENAME}.exe"
            WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
                 "Publisher" "${PRODUCT_PUBLISHER}"
            WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
                 "DisplayVersion" "${PRODUCT_VERSION}"
            WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
                 "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
            WriteRegDWORD  HKLM  "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
                "NoModify" 0x1
            WriteRegDWORD  HKLM  "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
                "NoRepair" 0x1
;    !insertmacro CheckNetFramework 40Client
    SectionEnd
    
    Section "Gtk Sharp" SecGtk
        SectionIn 1 2
        SetOutPath "$INSTDIR"
        File "InstallerComponents\gtk-sharp-2.12.30.msi"
        ExecWait 'msiexec /i "$INSTDIR\gtk-sharp-2.12.30.msi"  /qn'

        SetOutPath "$INSTDIR"
        SetRebootFlag true
    SectionEnd

    Section
        CreateShortcut "$DESKTOP\${PRODUCT_NAME}.lnk" "$INSTDIR\${PRODUCT_FILENAME}.exe"
    SectionEnd

SectionGroupEnd


;--------------------------------
;Installer Functions

Function .onInit
    System::Call 'kernel32::CreateMutex(p 0, i 0, t ${PRODUCT_FILENAME})) p .r1 ?e'
    Pop $R0
    
    StrCmp $R0 0 +3
        MessageBox MB_OK|MB_ICONEXCLAMATION "The installer is already running."
        Abort

  ;!insertmacro MUI_LANGDLL_DISPLAY

  ReadRegStr $R0 HKLM \
    "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" \
    "UninstallString"
    ExecWait '$R0 _?=$INSTDIR'
FunctionEnd

;--------------------------------
;Descriptions

  ;USE A LANGUAGE STRING IF YOU WANT YOUR DESCRIPTIONS TO BE LANGAUGE SPECIFIC

  ;Assign descriptions to sections
    !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecWorkStation} "${PRODUCT_PUBLISHER} ${PRODUCT_NAME} Back Office and Front Office, open source version only."
    !insertmacro MUI_DESCRIPTION_TEXT ${SecFrontOffice} "${PRODUCT_PUBLISHER} ${PRODUCT_NAME} Front Office modules."
    !insertmacro MUI_DESCRIPTION_TEXT ${SecBackOffice} "${PRODUCT_PUBLISHER} ${PRODUCT_NAME} Advanced Back Office modules."
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDevices} "${PRODUCT_PUBLISHER} ${PRODUCT_NAME} Devices drivers."

!if  "${PRODUCT_BRAND}" == "MariaDB"
    !insertmacro MUI_DESCRIPTION_TEXT ${SecMariaDB} "Maria DB Server is a MySQL replacement with good performance."
!endif

    !insertmacro MUI_DESCRIPTION_TEXT ${SecLocale} "Localization files for different languages."
    ;!insertmacro MUI_DESCRIPTION_TEXT ${SecHelp} "${PRODUCT_PUBLISHER} ${PRODUCT_NAME} help files."
    !insertmacro MUI_DESCRIPTION_TEXT ${SecTranslation} "Translation Helper application."
    !insertmacro MUI_DESCRIPTION_TEXT ${SecSampleData} "Images files for sample restaurant database."
    !insertmacro MUI_FUNCTION_DESCRIPTION_END
;--------------------------------
;Uninstaller Section

Section "Uninstall"

    Delete "$INSTDIR\Uninstall.exe"

    Delete "$INSTDIR\*.*"
    Delete "$SMPROGRAMS\${PRODUCT_PUBLISHER}\${PRODUCT_NAME}\*.*"
	Delete "$DESKTOP\${PRODUCT_NAME}.lnk"
	
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"

    RMDir /r "$INSTDIR"
    RMDir /r "$SMPROGRAMS\${PRODUCT_PUBLISHER}\${PRODUCT_NAME}\"
SectionEnd

