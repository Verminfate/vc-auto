cls
function Download_DATA{
    if(Test-Path -Path "DATA\VC\vcredist2022_x86.exe" -PathType Leaf){"vcredist2022_x86.exe | Already Downloaded"}else{Invoke-WebRequest -Uri "https://aka.ms/vs/17/release/vc_redist.x86.exe" -OutFile "DATA\VC\vcredist2022_x86.exe"}
    if(Test-Path -Path "DATA\VC\vcredist2022_x64.exe" -PathType Leaf){"vcredist2022_x64.exe | Already Downloaded"}else{Invoke-WebRequest -Uri "https://aka.ms/vs/17/release/vc_redist.x64.exe" -OutFile "DATA\VC\vcredist2022_x64.exe"}
    if(Test-Path -Path "DATA\VC\vcredist2013_x86.exe" -PathType Leaf){"vcredist2013_x86.exe | Already Downloaded"}else{Invoke-WebRequest -Uri "https://aka.ms/highdpimfc2013x86enu" -OutFile "DATA\VC\vcredist2013_x86.exe"}
    if(Test-Path -Path "DATA\VC\vcredist2013_x64.exe" -PathType Leaf){"vcredist2013_x64.exe | Already Downloaded"}else{Invoke-WebRequest -Uri "https://aka.ms/highdpimfc2013x64enu" -OutFile "DATA\VC\vcredist2013_x64.exe"}
    if(Test-Path -Path "DATA\VC\vcredist2012_x86.exe" -PathType Leaf){"vcredist2012_x86.exe | Already Downloaded"}else{Invoke-WebRequest -Uri "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe" -OutFile "DATA\VC\vcredist2012_x86.exe"}
    if(Test-Path -Path "DATA\VC\vcredist2012_x64.exe" -PathType Leaf){"vcredist2012_x64.exe | Already Downloaded"}else{Invoke-WebRequest -Uri "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe" -OutFile "DATA\VC\vcredist2012_x64.exe"}
    if(Test-Path -Path "DATA\VC\vcredist2010_x86.exe" -PathType Leaf){"vcredist2010_x86.exe | Already Downloaded"}else{Invoke-WebRequest -Uri "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe" -OutFile "DATA\VC\vcredist2010_x86.exe"}
    if(Test-Path -Path "DATA\VC\vcredist2010_x64.exe" -PathType Leaf){"vcredist2010_x64.exe | Already Downloaded"}else{Invoke-WebRequest -Uri "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe" -OutFile "DATA\VC\vcredist2010_x64.exe"}
    if(Test-Path -Path "DATA\VC\vcredist2008_x86.exe" -PathType Leaf){"vcredist2008_x86.exe | Already Downloaded"}else{Invoke-WebRequest -Uri "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe" -OutFile "DATA\VC\vcredist2008_x86.exe"}
    if(Test-Path -Path "DATA\VC\vcredist2008_x64.exe" -PathType Leaf){"vcredist2008_x64.exe | Already Downloaded"}else{Invoke-WebRequest -Uri "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe" -OutFile "DATA\VC\vcredist2008_x64.exe"}
}

function Download-VC {
    $FolderName = "DATA\VC\"
    if (Test-Path $FolderName) {
        Write-Host "Starting downloads [92 mb]"
        Download_DATA
    }
    else
    {
        New-Item -Path "DATA\VC\" -ItemType Directory
        cls
        Write-Host "Starting downloads [100+mb]"
        Download_DATA
    }
}

function Install-VC { 
    cd DATA\VC
    "╔══════[Microsoft Visual C++]══════╗"
    $process = start-process vcredist2022_x86.exe -ArgumentList "/install /passive /norestart" -PassThru -Wait
    if($process.ExitCode -le 0){Write-Host "║ vcredist2022_x86.exe | " -NoNewLine
        Write-Host "Installed" -ForegroundColor Black -BackgroundColor Green -NoNewLine
        Write-Host " ║" }
    $process = start-process vcredist2022_x64.exe -ArgumentList "/install /passive /norestart" -PassThru -Wait
    if($process.ExitCode -le 0){Write-Host "║ vcredist2022_x64.exe | " -NoNewLine
        Write-Host "Installed" -ForegroundColor Black -BackgroundColor Green -NoNewLine
        Write-Host " ║" }



    $process = start-process vcredist2013_x86.exe -ArgumentList "/install /passive /norestart" -PassThru -Wait
    if($process.ExitCode -le 0){Write-Host "║ vcredist2013_x86.exe | " -NoNewLine
        Write-Host "Installed" -ForegroundColor Black -BackgroundColor Green -NoNewLine
        Write-Host " ║" }
    $process = start-process vcredist2013_x64.exe -ArgumentList "/install /passive /norestart" -PassThru -Wait
    if($process.ExitCode -le 0){Write-Host "║ vcredist2013_x64.exe | " -NoNewLine
        Write-Host "Installed" -ForegroundColor Black -BackgroundColor Green -NoNewLine
        Write-Host " ║" }



    $process = start-process vcredist2012_x86.exe -ArgumentList "/install /passive /norestart" -PassThru -Wait
    if($process.ExitCode -le 0){Write-Host "║ vcredist2012_x86.exe | " -NoNewLine
        Write-Host "Installed" -ForegroundColor Black -BackgroundColor Green -NoNewLine
        Write-Host " ║" }
    $process = start-process vcredist2012_x86.exe -ArgumentList "/install /passive /norestart" -PassThru -Wait
    if($process.ExitCode -le 0){Write-Host "║ vcredist2012_x64.exe | " -NoNewLine
        Write-Host "Installed" -ForegroundColor Black -BackgroundColor Green -NoNewLine
        Write-Host " ║" }



    $process = start-process vcredist2010_x86.exe -ArgumentList "/norestart /q" -PassThru -Wait
    if($process.ExitCode -le 0){Write-Host "║ vcredist2010_x86.exe | " -NoNewLine
        Write-Host "Installed" -ForegroundColor Black -BackgroundColor Green -NoNewLine
        Write-Host " ║" }
    $process = start-process vcredist2010_x86.exe -ArgumentList "/norestart /q" -PassThru -Wait
    if($process.ExitCode -le 0){Write-Host "║ vcredist2010_x64.exe | " -NoNewLine
        Write-Host "Installed" -ForegroundColor Black -BackgroundColor Green -NoNewLine
        Write-Host " ║" }



    $process = start-process vcredist2008_x86.exe -ArgumentList "/q" -PassThru -Wait
    if($process.ExitCode -le 0){Write-Host "║ vcredist2008_x86.exe | " -NoNewLine
        Write-Host "Installed" -ForegroundColor Black -BackgroundColor Green -NoNewLine
        Write-Host " ║" }
    $process = start-process vcredist2008_x86.exe -ArgumentList "/q" -PassThru -Wait
    if($process.ExitCode -le 0){Write-Host "║ vcredist2008_x64.exe | " -NoNewLine
        Write-Host "Installed" -ForegroundColor Black -BackgroundColor Green -NoNewLine
        Write-Host " ║" }

    "╚══════════════════════════════════╝"

    cd ..\..\
}

Download-VC
Download-VC
Install-VC
