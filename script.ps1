$Desktop = "C:\Users\user\Desktop"
$Downloads = "C:\Users\user\Downloads"
$Directories = $Downloads, $Desktop

$destinations = @{
    Pictures = "C:\Users\user\Pictures\downloaded"
    Documents = "C:\Users\user\Documents\downloaded"
    Videos =  "C:\Users\user\Videos\downloaded"
    Music = "C:\Users\user\Music\downloaded"
}
$extensions = @{
    Pictures = '.png', '.jpeg', '.jpg', '.gif'
    Documents = '.doc', '.docx', '.pdf', '.mht', '.html', '.xls', '.xlsx', '.csv'
    Videos = '.m4v', '.mov', '.mp4'
    Music = '.mp3', '.wma', '.wav'
}

foreach ($directory in $Directories)
{
    $Files = Get-ChildItem $directory -File -Recurse
    foreach($file in $Files)
    {
        if ($extensions.Music -contains $file.Extension)
        {
            Move-Item -Path $file.FullName -Destination $destinations.Music -Force
        }
        if ($extensions.Pictures -contains $file.Extension)
        {
            Move-Item -Path $file.FullName -Destination $destinations.Pictures -Force
        }
        if ($extensions.Videos -contains $file.Extension)
        {
            Move-Item -Path $file.FullName -Destination $destinations.Videos -Force
        }
        if ($extensions.Music -contains $file.Extension)
        {
            Move-Item -Path $file.FullName -Destination $destinations.Music -Force
        }
    }
}