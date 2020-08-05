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
        $inputValue = $inputValue + (','+$inputValue)
    }
}
While ($inputFound -eq $true)

Write-Output "Will process the following"
$inputValue
##
Write-Output "Files are being scanned..."
$files = Get-Childitem -Path $inputPath -Include $inputValue -File -Recurse -ErrorAction SilentlyContinue

##
# Get-Childitem -Path X:\ -Include *.WP,*.WPD,*.WB3 -File -Recurse -ErrorAction SilentlyContinue

$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$scriptDir = $scriptDir + "\found-files.txt"

$files | Out-File $scriptDir

Write-Output "Done Processing"