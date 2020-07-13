Do {
    $inputFound = $true
    $inputValue = Read-Host "Enter a directory to search"
    
    If ( $inputValue -eq "" ) {
            $inputFound = $false    
    }
    Else {
        [array]$inputList = $inputList + ($inputValue + "\*")
    }
}
While ($inputFound -eq $true)

$inputList

Write-Output "Do you want to test just directories, or files too"
Write-Output "Enter 'dirs' for just directories, or 'files' to include files"
$filedirchoice = Read-Host -Prompt ""

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

$acls | Select-String -Pattern "Failed to process" | Out-File "C:\Users\Sean McMillin\Desktop\All - Permissions - Test.txt"