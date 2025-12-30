
$ErrorActionPreference = "Stop"
$assetsDir = "assets/images"
if (-not (Test-Path $assetsDir)) {
    New-Item -ItemType Directory -Force -Path $assetsDir
}

# Image mapping to ensure deduplication
# URL -> LocalFilename
$imageMap = @{}
$counter = 1

function Get-LocalFilename {
    param($url)
    if ($imageMap.ContainsKey($url)) {
        return $imageMap[$url]
    }
    
    # Generate simple name
    $ext = ".jpg" # Default to jpg as most look like photos. Ideally detecting content-type is better but complicating.
    # URLs are google lh3, usually serving webp or jpg. 
    # Let's try to infer from content-disposition or just assume jpg/png based on usage. 
    # Most seem to be photos.
    
    $name = "image_$counter$ext"
    $script:counter++
    $imageMap[$url] = $name
    return $name
}

function Download-Image {
    param($url, $path)
    if (-not (Test-Path $path)) {
        try {
            Write-Host "Downloading $url to $path..."
            Invoke-WebRequest -Uri $url -OutFile $path
        } catch {
            Write-Host "Failed to download $url : $_"
        }
    }
}

$files = Get-ChildItem -Path . -Filter "*.html"

foreach ($file in $files) {
    Write-Host "Processing $($file.Name)..."
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    # Regex to find lh3.googleusercontent.com URLs
    # Looking for url("...") or src="..."
    # Pattern: https://lh3\.googleusercontent\.com/[^"'\)\s]+
    
    $pattern = 'https://lh3\.googleusercontent\.com/[^"''\)\s]+'
    $matches = [regex]::Matches($content, $pattern)
    
    foreach ($match in $matches) {
        $url = $match.Value
        $localName = Get-LocalFilename -url $url
        $localPath = "$assetsDir/$localName"
        
        # Download if we haven't already for this URL (in this run, handled by imageMap + file check)
        Download-Image -url $url -path $localPath
        
        # Replace in content
        # We need to escape the URL for regex replacement
        $escapedUrl = [regex]::Escape($url)
        
        # Use simple string replacement for reliability
        $content = $content.Replace($url, "$assetsDir/$localName")
    }
    
    Set-Content $file.FullName $content -NoNewline -Encoding UTF8
}

Write-Host "Done downloading and linking assets."
