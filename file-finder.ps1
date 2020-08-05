Write-Output "Welcome to the file finder"
Write-Output "You will be asked for file types, please enter one per line, then press return"
Write-Output ""

$inputPath = Read-Host "Enter a directory to search from"
Do {
    $inputFound = $true
    $inputValue = Read-Host "Enter a file to search for"
    
    If ( $inputValue -eq "" ) {
            $inputFound = $false    
    }
    Else {
        $inputValues = $inputValues  + $inputValue + ','
    }
}
While ($inputFound -eq $true)

$inputValues = $inputValues.Substring(0,$inputValues.Length-1)

Write-Output "Will process the following"
$inputValues
##
Write-Output "Files are being scanned..."
# $files = Get-Childitem -Path $inputPath -Include $inputValues -File -Recurse -ErrorAction SilentlyContinue
$files = Get-Childitem -Path $inputPath -Include *.WPD,*.WB3,*.WP,*.WPT,*.WPG,*.WB -File -Recurse -ErrorAction SilentlyContinue

##
# Get-Childitem -Path X:\ -Include *.WP,*.WPD,*.WB3 -File -Recurse -ErrorAction SilentlyContinue

$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$scriptDir = $scriptDir + "\found-files.txt"

$files | Out-File $scriptDir

Write-Output "Done Processing"