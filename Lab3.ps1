<#
Scripting assignment, practice using:
    Here-strings for multi-line strings
    Piping commands
    Writing and reading files
    Conditional logic
Author: Robert Nohr
Date: 10/11//2021

#>

cls
cd $env:USERPROFILE

Get-ChildItem -filter *.txt | Format-Table -Property Name, Length
$Do = @"
What do you want to do?
1. Write a contact entry to file
2. Display all files last written to after a given date.
3. Read a specified text file
"@
$Do
$Number = Read-Host "Enter the variable you wish to use: "


If($Number -eq 1) {
$Name = Read-Host "What is the full name?"
$PhoneNumber = Read-Host "What is the Phone Number?"
$Email = Read-Host "What is the email?"
$File = Read-Host "What is the name of file? (Be Specific with extension)"
Add-Content -Path $File -Value "$Name`n$PhoneNumber`n$Email"
}

elseif ($Number -eq 2) {
$timeofDate = Read-Host "Earliest date of files to display"
Get-ChildItem | Where-Object {$_.LastWriteTime -GE "$timeofDate"}| Format-Table Name, LastWriteTime
}
elseif ($Number -eq 3) {
$TextFile = Read-Host "Name of text file on profile to read"
$real = Test-Path -Path $TextFile
    if($real -eq "True"){
        Get-Content -Path $TextFile
    }
    else {
        "The file doesn't exist"
    }
}
else {
Write-Output "You entered an invalid choice
Logged on as $env:USERPROFILE on computer $env:COMPUTERNAME"
}