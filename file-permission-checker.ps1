$dirs = Get-ChildItem "X:\Sales\*", "X:\Sales\Projects\*" |
        where-object {($_.PsIsContainer)}
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
$acls | Out-File "C:\Users\Sean McMillin\Desktop\Permissions.txt"