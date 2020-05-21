$csvfile = "C:\User.csv"
$users = Import-CSV $csvfile
Foreach ($i in $users) {
$DisplayName = $i.FirstName + " " + $i.LastName
$OU = "ou=" + $i.Department + "," + "ou=DepartmentOU,dc=Spider,dc=com"
$Group = $i.Department + " Group"
$SecurePass = ConvertTo-SecureString -AsPlainText "Pa55w.rd" -Force
New-ADUser -Name $i.FirstName -Given $i.FirstName -Surname $i.LastName -DisplayName $DisplayName -SamAccountName $i.UPN -UserPrincipalName $i.UPN -EmailAddress $i.Email -Department $i.Department -Title $i.Title -Path $OU -AccountPassword $SecurePass -ChangePasswordAtLogon $true -Enabled $true ;
Add-ADGroupMember -Identity $Group -Members $i.UPN }