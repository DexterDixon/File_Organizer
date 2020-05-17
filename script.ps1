#Initializing Variables
$Desktop = "C:\Users\user\Desktop"
$Downloads = "C:\Users\user\Downloads"
$Directories = $Downloads, $Desktop

#Creating Hash Tables for Destination Directories
$destinations = @{
    Pictures = "C:\Users\user\Pictures\downloaded"
    Documents = "C:\Users\user\Documents\downloaded"
    Videos =  "C:\Users\user\Videos\downloaded"
    Music = "C:\Users\user\Music\downloaded"
}
#Creating Hash Tables for File Extensions
$extensions = @{
    Pictures = '.png', '.jpeg', '.jpg', '.gif'
    Documents = '.doc', '.docx', '.pdf', '.mht', '.html', '.xls', '.xlsx', '.csv'
    Videos = '.m4v', '.mov', '.mp4'
    Music = '.mp3', '.wma', '.wav'
}

#Loops through each directory in Directories variable
foreach ($directory in $Directories)
{
    #Gets a list of all the files in the directory and sub directories
    $Files = Get-ChildItem $directory -File -Recurse
    foreach($file in $Files)
    {
        #Checks each files extension and sends it to the appropriate destination
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