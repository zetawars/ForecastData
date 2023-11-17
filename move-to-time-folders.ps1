$baseDirectory = "./ExtractedData"

# Get all .nc files in the base directory
$files = Get-ChildItem -Path $baseDirectory -Filter *.nc

foreach ($file in $files) {
    # Split the filename on '.', and take the second element
    $splitName = $file.Name.Split('.')
    $dateTimePart = $splitName[2]

    # Check if the dateTimePart ends with specific time codes and set the folder name
    if ($dateTimePart -match '(\d{2})$') {
        $folderName = $matches[1]

        # Define the destination directory based on the folder name
        $destinationDirectory = Join-Path $baseDirectory $folderName

        # Create the destination directory if it doesn't exist
        if (-not (Test-Path -Path $destinationDirectory)) {
            New-Item -Path $destinationDirectory -ItemType Directory
        }

        # Move the file to the destination directory
        Move-Item -Path $file.FullName -Destination $destinationDirectory
    } else {
        Write-Host "Filename format not matched for file: $($file.Name)"
    }
}
