# Define the base directory and the destination directory
$baseDirectory = "./ForecastData"
$destinationDirectory = "./ExtractedData"

# Create the destination directory if it doesn't exist
if (-not (Test-Path -Path $destinationDirectory)) {
    New-Item -Path $destinationDirectory -ItemType Directory
}

# Get all subdirectories in the base directory
$subdirectories = Get-ChildItem -Path $baseDirectory -Directory

# Loop through each subdirectory
foreach ($dir in $subdirectories) {
    # Get all files in the subdirectory
    $files = Get-ChildItem -Path $dir.FullName

    # Copy each file to the destination directory
    foreach ($file in $files) {
        Copy-Item -Path $file.FullName -Destination $destinationDirectory
    }
}