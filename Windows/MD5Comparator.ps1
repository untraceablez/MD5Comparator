#MD5 Hash Comparator


#Select original file
Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
    InitialDirectory = [Environment]::GetFolderPath('Desktop') 
    
}
$null = $FileBrowser.ShowDialog()
+
#Store MD5 hash in variable

$og_md5 = Get-FileHash OpenFileDialog

#Select destination file

$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
    InitialDirectory = [Environment]::GetFolderPath('Desktop') 
    
}
$null = $FileBrowser.ShowDialog()

$new_md5 = Get-FileHash OpenFileDialog

#Compare Files

if(Compare-Object -ReferenceObject $(Get-Content $og_md5) -DifferenceObject $(Get-Content $new_md5))

 {[System.Windows.MessageBox]::Show('MD5 Hashes did not match, error in transfer.')}

Else {[System.Windows.MessageBox]::Show('File safely transferred, MD5 hash is identical.')}