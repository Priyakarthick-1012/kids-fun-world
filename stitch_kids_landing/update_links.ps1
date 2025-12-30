
$ErrorActionPreference = "Stop"

function Update-Booking {
    $path = "booking.html"
    if (Test-Path $path) {
        $c = Get-Content $path -Raw -Encoding UTF8
        # Continue button
        $c = $c -replace '<button class="flex-1 bg-primary hover:bg-orange-600([^>]*)">', '<a href="dashboard.html" class="flex-1 bg-primary hover:bg-orange-600$1">'
        $c = $c -replace '(Continue\s*<span[^>]*>arrow_forward</span>\s*)</button>', '$1</a>'
        # Back button
        # Already done via replace_file_content? Checking if it needs fix.
        # It failed? No, tool said "target content not found" for later edits, but maybe earlier ones worked?
        # I'll re-run regex just in case, it won't hurt if already replaced (as long as regex matches original only)
        # But if already replaced, regex won't match.
        Set-Content $path $c -NoNewline -Encoding UTF8
        Write-Host "Updated Booking"
    }
}

function Update-Map {
    $path = "map.html"
    if (Test-Path $path) {
        $c = Get-Content $path -Raw -Encoding UTF8
        # Fast Pass
        $c = $c -replace '<button class="flex-1 bg-primary hover:bg-\[#0be00b\]([^>]*)">', '<a href="booking.html" class="flex-1 bg-primary hover:bg-[#0be00b]$1">'
        $c = $c -replace '(Fast Pass\s*)</button>', '$1</a>'
        
        # Nav Map
        $c = $c -replace '<button class="flex flex-col items-center justify-center gap-1 group">(\s*<div[^>]*>\s*<span[^>]*>map</span>)', '<a href="map.html" class="flex flex-col items-center justify-center gap-1 group">$1'
        $c = $c -replace '(<span class="text-\[10px\] font-bold text-black">Map</span>\s*)</button>', '$1</a>'
        
        # Nav List
        $c = $c -replace '<button class="flex flex-col items-center justify-center gap-1 group">(\s*<div[^>]*>\s*<span[^>]*>format_list_bulleted</span>)', '<a href="rides.html" class="flex flex-col items-center justify-center gap-1 group">$1'
        $c = $c -replace '(<span class="text-\[10px\][^>]*>List</span>\s*)</button>', '$1</a>'
        
        # Nav Tickets
        $c = $c -replace '<button class="flex flex-col items-center justify-center gap-1 group">(\s*<div[^>]*>\s*<span[^>]*>local_activity</span>)', '<a href="booking.html" class="flex flex-col items-center justify-center gap-1 group">$1'
        $c = $c -replace '(<span class="text-\[10px\][^>]*>Tickets</span>\s*)</button>', '$1</a>'
        
        # Nav Profile
        $c = $c -replace '<button class="flex flex-col items-center justify-center gap-1 group">(\s*<div[^>]*>\s*<span[^>]*>person</span>)', '<a href="dashboard.html" class="flex flex-col items-center justify-center gap-1 group">$1'
        $c = $c -replace '(<span class="text-\[10px\][^>]*>Profile</span>\s*)</button>', '$1</a>'
        
        Set-Content $path $c -NoNewline -Encoding UTF8
         Write-Host "Updated Map"
    }
}

function Update-Dashboard {
    $path = "dashboard.html"
    if (Test-Path $path) {
        $c = Get-Content $path -Raw -Encoding UTF8
        # Navigate to Ride
        $c = $c -replace '<button class="w-full flex items-center justify-center gap-2 bg-primary([^>]*)">', '<a href="map.html" class="w-full flex items-center justify-center gap-2 bg-primary$1">'
        $c = $c -replace '(Navigate to Ride\s*)</button>', '$1</a>'
        
        # Nav Home
        $c = $c -replace '<button class="size-10 flex items-center justify-center rounded-full bg-primary/10 text-primary">(\s*<span[^>]*>home</span>\s*)</button>', '<a href="index.html" class="size-10 flex items-center justify-center rounded-full bg-primary/10 text-primary">$1</a>'
        
        # Nav Map
        $c = $c -replace '<button class="size-10 flex items-center justify-center rounded-full text-gray-400([^>]*)">(\s*<span[^>]*>map</span>\s*)</button>', '<a href="map.html" class="size-10 flex items-center justify-center rounded-full text-gray-400$1">$2</a>'
        
        # Nav Scan
        $c = $c -replace '<button class="size-14 -mt-6 flex items-center justify-center rounded-full bg-primary text-white shadow-glow([^>]*)">(\s*<span[^>]*>qr_code_scanner</span>\s*)</button>', '<a href="booking.html" class="size-14 -mt-6 flex items-center justify-center rounded-full bg-primary text-white shadow-glow$1">$2</a>'
        
        # Nav Food
        $c = $c -replace '<button class="size-10 flex items-center justify-center rounded-full text-gray-400([^>]*)">(\s*<span[^>]*>restaurant</span>\s*)</button>', '<a href="dining.html" class="size-10 flex items-center justify-center rounded-full text-gray-400$1">$2</a>'
        
        # Nav Profile
        $c = $c -replace '<button class="size-10 flex items-center justify-center rounded-full text-gray-400([^>]*)">(\s*<span[^>]*>person</span>\s*)</button>', '<a href="dashboard.html" class="size-10 flex items-center justify-center rounded-full text-gray-400$1">$2</a>'
        
        Set-Content $path $c -NoNewline -Encoding UTF8
         Write-Host "Updated Dashboard"
    }
}

function Update-Dining {
    $path = "dining.html"
    if (Test-Path $path) {
        $c = Get-Content $path -Raw -Encoding UTF8
        # Back button
        $c = $c -replace '<button aria-label="Go back" class="([^"]*)">', '<a href="index.html" aria-label="Go back" class="$1">'
        $c = $c -replace '(<span class="material-symbols-outlined text-slate-800 dark:text-white">arrow_back</span>\s*)</button>', '$1</a>'
        
        # Nav Home
        $c = $c -replace '<button class="flex flex-col items-center gap-1 text-slate-400 w-16 group">(\s*<span[^>]*>home</span>)', '<a href="index.html" class="flex flex-col items-center gap-1 text-slate-400 w-16 group">$1'
        $c = $c -replace '(<span class="text-\[10px\][^>]*>Home</span>\s*)</button>', '$1</a>'

        # Nav Map
        $c = $c -replace '<button class="flex flex-col items-center gap-1 text-slate-400 w-16 group">(\s*<span[^>]*>map</span>)', '<a href="map.html" class="flex flex-col items-center gap-1 text-slate-400 w-16 group">$1'
        $c = $c -replace '(<span class="text-\[10px\][^>]*>Map</span>\s*)</button>', '$1</a>'

        # Nav Eats
        $c = $c -replace '<button class="flex flex-col items-center gap-1 text-primary w-16 relative -top-5">', '<a href="dining.html" class="flex flex-col items-center gap-1 text-primary w-16 relative -top-5">'
        $c = $c -replace '(<span class="text-\[10px\] font-bold">Eats</span>\s*)</button>', '$1</a>'

        # Nav Tickets
        $c = $c -replace '<button class="flex flex-col items-center gap-1 text-slate-400 w-16 group">(\s*<span[^>]*>confirmation_number</span>)', '<a href="booking.html" class="flex flex-col items-center gap-1 text-slate-400 w-16 group">$1'
        $c = $c -replace '(<span class="text-\[10px\][^>]*>Tickets</span>\s*)</button>', '$1</a>'

        # Nav Profile
        $c = $c -replace '<button class="flex flex-col items-center gap-1 text-slate-400 w-16 group">(\s*<span[^>]*>account_circle</span>)', '<a href="dashboard.html" class="flex flex-col items-center gap-1 text-slate-400 w-16 group">$1'
        $c = $c -replace '(<span class="text-\[10px\][^>]*>Profile</span>\s*)</button>', '$1</a>'
        
        Set-Content $path $c -NoNewline -Encoding UTF8
         Write-Host "Updated Dining"
    }
}

Update-Booking
Update-Map
Update-Dashboard
Update-Dining
