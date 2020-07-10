# Do {
#     $inputFound = $true
#     $inputValue = Read-Host "Enter a directory to search"
    
#     If ( $inputValue -eq "" ) {
#             $inputFound = $false    
#     }
#     Else {
#         [array]$inputList = $inputList + $inputValue
#     }
# }
# While ($inputFound -eq $true)

# $inputList


$dirs = Get-ChildItem "X:\*", "X:\*\*", "X:\*\*\*" | where-object {($_.PsIsContainer)}
# $dirs = Get-ChildItem ('"{0}"' -f $($inputList -join '","')) | where-object {($_.PsIsContainer)}

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
$acls | Select-String -Pattern "Failed to process" | Out-File "C:\Users\Sean McMillin\Desktop\All - Permissions.txt"