Write-Output "Welcome to the file permission checker"
Write-Output "You will be asked for directories, please enter one per line, then press return"
Write-Output ""

Do {
    $inputFound = $true
    $inputValue = Read-Host "Enter a directory to search"
    $inputDepth = Read-Host "How many levels deep?"
    
    If ( $inputValue -eq "" ) {
            $inputFound = $false    
    }
    If ( $inputDepth -eq "" ) {
            $inputFound = $false    
    }
    If ( $inputDepth -eq "1" ) {
        [array]$inputList = $inputList + ($inputValue + "\*")
    }
    If ( $inputDepth -eq "2" ) {
        [array]$inputList = $inputList + ($inputValue + "\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*")
    }
    If ( $inputDepth -eq "3" ) {
        [array]$inputList = $inputList + ($inputValue + "\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*\*")
    }
    If ( $inputDepth -eq "4" ) {
        [array]$inputList = $inputList + ($inputValue + "\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*\*\*")
    }
    If ( $inputDepth -eq "5" ) {
        [array]$inputList = $inputList + ($inputValue + "\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*\*\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*\*\*\*")
    }
    If ( $inputDepth -eq "6" ) {
        [array]$inputList = $inputList + ($inputValue + "\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*\*\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*\*\*\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*\*\*\*\*")
    }
    If ( $inputDepth -eq "7" ) {
        [array]$inputList = $inputList + ($inputValue + "\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*\*\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*\*\*\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*\*\*\*\*")
        [array]$inputList = $inputList + ($inputValue + "\*\*\*\*\*\*\*")
    }
    # Else {
    #     [array]$inputList = $inputList + ($inputValue + "\*")
    # }
}
While ($inputFound -eq $true)

Write-Output "Will process the following"
$inputList

Write-Output "Do you want to test just directories, or files too"
Write-Output "Enter 'dirs' for just directories, or 'files' to include files"
$filedirchoice = Read-Host -Prompt "Input"

If ($filedirchoice -eq "files" ) {
    $dirs = $inputList | Get-ChildItem
}
Else {
    $dirs = $inputList | Get-ChildItem | where-object {($_.PsIsContainer)}
}

$acls = foreach($dir in $dirs)
{
    try
    {
        Get-Acl $dir -ErrorAction Stop
    }
    catch
    {
        "Failed to process $dir"
    }

}

$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$scriptDir = $scriptDir + "\permissions.txt"

$acls | Select-String -Pattern "Failed to process" | Out-File $scriptDir