
$ErrorActionPreference = "Stop"

function Update-Booking {
    $path = "booking.html"
    if (Test-Path $path) {
        $c = Get-Content $path -Raw -Encoding UTF8
        $c = $c -replace '<button class="flex-1 bg-primary hover:bg-orange-600([^>]*)">', '<a href="dashboard.html" class="flex-1 bg-primary hover:bg-orange-600$1">'
        $c = $c -replace '(Continue\s*<span[^>]*>arrow_forward</span>\s*)</button>', '$1</a>'
        
        # Back button (lines 66-68)
        $c = $c -replace '<button class="flex size-10 items-center justify-center rounded-full hover:bg-black/5 dark:hover:bg-white/10 transition-colors">(\s*<span[^>]*>arrow_back</span>\s*)</button>', '<a href="index.html" class="flex size-10 items-center justify-center rounded-full hover:bg-black/5 dark:hover:bg-white/10 transition-colors">$1</a>'

        Set-Content $path $c -NoNewline -Encoding UTF8
        Write-Host "Updated Booking"
    }
}

function Update-Map {
    $path = "map.html"
    if (Test-Path $path) {
        $c = Get-Content $path -Raw -Encoding UTF8
        $c = $c -replace '<button class="flex-1 bg-primary hover:bg-\[#0be00b\]([^>]*)">', '<a href="booking.html" class="flex-1 bg-primary hover:bg-[#0be00b]$1">'
        $c = $c -replace '(Fast Pass\s*)</button>', '$1</a>'
        
        $c = $c -replace '<button class="flex flex-col items-center justify-center gap-1 group">(\s*<div[^>]*>\s*<span[^>]*>map</span>)', '<a href="map.html" class="flex flex-col items-center justify-center gap-1 group">$1'
        $c = $c -replace '(<span class="text-\[10px\] font-bold text-black">Map</span>\s*)</button>', '$1</a>'
        
        $c = $c -replace '<button class="flex flex-col items-center justify-center gap-1 group">(\s*<div[^>]*>\s*<span[^>]*>format_list_bulleted</span>)', '<a href="rides.html" class="flex flex-col items-center justify-center gap-1 group">$1'
        $c = $c -replace '(<span class="text-\[10px\][^>]*>List</span>\s*)</button>', '$1</a>'
        
        $c = $c -replace '<button class="flex flex-col items-center justify-center gap-1 group">(\s*<div[^>]*>\s*<span[^>]*>local_activity</span>)', '<a href="booking.html" class="flex flex-col items-center justify-center gap-1 group">$1'
        $c = $c -replace '(<span class="text-\[10px\][^>]*>Tickets</span>\s*)</button>', '$1</a>'
        
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
        $c = $c -replace '<button class="w-full flex items-center justify-center gap-2 bg-primary([^>]*)">', '<a href="map.html" class="w-full flex items-center justify-center gap-2 bg-primary$1">'
        $c = $c -replace '(Navigate to Ride\s*)</button>', '$1</a>'
        
        $c = $c -replace '<button class="size-10 flex items-center justify-center rounded-full bg-primary/10 text-primary">(\s*<span[^>]*>home</span>\s*)</button>', '<a href="index.html" class="size-10 flex items-center justify-center rounded-full bg-primary/10 text-primary">$1</a>'
        
        $c = $c -replace '<button class="size-10 flex items-center justify-center rounded-full text-gray-400([^>]*)">(\s*<span[^>]*>map</span>\s*)</button>', '<a href="map.html" class="size-10 flex items-center justify-center rounded-full text-gray-400$1">$2</a>'
        
        $c = $c -replace '<button class="size-14 -mt-6 flex items-center justify-center rounded-full bg-primary text-white shadow-glow([^>]*)">(\s*<span[^>]*>qr_code_scanner</span>\s*)</button>', '<a href="booking.html" class="size-14 -mt-6 flex items-center justify-center rounded-full bg-primary text-white shadow-glow$1">$2</a>'
        
        $c = $c -replace '<button class="size-10 flex items-center justify-center rounded-full text-gray-400([^>]*)">(\s*<span[^>]*>restaurant</span>\s*)</button>', '<a href="dining.html" class="size-10 flex items-center justify-center rounded-full text-gray-400$1">$2</a>'
        
        $c = $c -replace '<button class="size-10 flex items-center justify-center rounded-full text-gray-400([^>]*)">(\s*<span[^>]*>person</span>\s*)</button>', '<a href="dashboard.html" class="size-10 flex items-center justify-center rounded-full text-gray-400$1">$2</a>'
        
        Set-Content $path $c -NoNewline -Encoding UTF8
         Write-Host "Updated Dashboard"
    }
}

function Update-Dining {
    $path = "dining.html"
    if (Test-Path $path) {
        $c = Get-Content $path -Raw -Encoding UTF8
        $c = $c -replace '<button aria-label="Go back" class="([^"]*)">', '<a href="index.html" aria-label="Go back" class="$1">'
        $c = $c -replace '(<span class="material-symbols-outlined text-slate-800 dark:text-white">arrow_back</span>\s*)</button>', '$1</a>'
        
        $c = $c -replace '<button class="flex flex-col items-center gap-1 text-slate-400 w-16 group">(\s*<span[^>]*>home</span>)', '<a href="index.html" class="flex flex-col items-center gap-1 text-slate-400 w-16 group">$1'
        $c = $c -replace '(<span class="text-\[10px\][^>]*>Home</span>\s*)</button>', '$1</a>'

        $c = $c -replace '<button class="flex flex-col items-center gap-1 text-slate-400 w-16 group">(\s*<span[^>]*>map</span>)', '<a href="map.html" class="flex flex-col items-center gap-1 text-slate-400 w-16 group">$1'
        $c = $c -replace '(<span class="text-\[10px\][^>]*>Map</span>\s*)</button>', '$1</a>'

        $c = $c -replace '<button class="flex flex-col items-center gap-1 text-primary w-16 relative -top-5">', '<a href="dining.html" class="flex flex-col items-center gap-1 text-primary w-16 relative -top-5">'
        $c = $c -replace '(<span class="text-\[10px\] font-bold">Eats</span>\s*)</button>', '$1</a>'

        $c = $c -replace '<button class="flex flex-col items-center gap-1 text-slate-400 w-16 group">(\s*<span[^>]*>confirmation_number</span>)', '<a href="booking.html" class="flex flex-col items-center gap-1 text-slate-400 w-16 group">$1'
        $c = $c -replace '(<span class="text-\[10px\][^>]*>Tickets</span>\s*)</button>', '$1</a>'

        $c = $c -replace '<button class="flex flex-col items-center gap-1 text-slate-400 w-16 group">(\s*<span[^>]*>account_circle</span>)', '<a href="dashboard.html" class="flex flex-col items-center gap-1 text-slate-400 w-16 group">$1'
        $c = $c -replace '(<span class="text-\[10px\][^>]*>Profile</span>\s*)</button>', '$1</a>'
        
        Set-Content $path $c -NoNewline -Encoding UTF8
         Write-Host "Updated Dining"
    }
}

function Update-Offers {
    $path = "offers.html"
    if (Test-Path $path) {
        $c = Get-Content $path -Raw -Encoding UTF8
        # Back button
        $c = $c -replace '<button class="flex items-center justify-center p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 text-text-main-light dark:text-text-main-dark transition-colors">(\s*<span[^>]*>arrow_back</span>\s*)</button>', '<a href="index.html" class="flex items-center justify-center p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 text-text-main-light dark:text-text-main-dark transition-colors">$1</a>'

        # Grab Deal
        $c = $c -replace '<button class="bg-primary hover:bg-orange-600 text-white font-bold py-2.5 px-6 rounded-xl shadow-lg shadow-orange-500/30 transition-all flex items-center gap-2">', '<a href="booking.html" class="bg-primary hover:bg-orange-600 text-white font-bold py-2.5 px-6 rounded-xl shadow-lg shadow-orange-500/30 transition-all flex items-center gap-2">'
        $c = $c -replace '(<span>Grab Deal</span>\s*<span[^>]*>arrow_forward</span>\s*)</button>', '$1</a>'

        # Book Now
        $c = $c -replace '<button class="bg-gray-900 dark:bg-white hover:bg-gray-800 text-white dark:text-gray-900 font-bold py-2.5 px-6 rounded-xl transition-all">', '<a href="booking.html" class="bg-gray-900 dark:bg-white hover:bg-gray-800 text-white dark:text-gray-900 font-bold py-2.5 px-6 rounded-xl transition-all">'
        $c = $c -replace '(\s*Book Now\s*)</button>', '$1</a>'

        # Bottom Nav
        # Home
        $c = $c -replace '<button class="flex flex-col items-center gap-1 w-12 text-gray-400 hover:text-primary transition-colors">(\s*<span[^>]*>home</span>)', '<a href="index.html" class="flex flex-col items-center gap-1 w-12 text-gray-400 hover:text-primary transition-colors">$1'
        $c = $c -replace '(<span[^>]*>Home</span>\s*)</button>', '$1</a>'
        
        # Deals (Active)
        $c = $c -replace '<button class="flex flex-col items-center gap-1 w-12 text-primary">', '<a href="offers.html" class="flex flex-col items-center gap-1 w-12 text-primary">'
        $c = $c -replace '(<span[^>]*>Deals</span>\s*)</button>', '$1</a>'

        # Scan
        $c = $c -replace '<button class="relative -top-5 bg-primary text-white rounded-full p-4 shadow-lg shadow-orange-500/40 transform transition-transform hover:scale-105 active:scale-95">', '<a href="booking.html" class="relative -top-5 bg-primary text-white rounded-full p-4 shadow-lg shadow-orange-500/40 transform transition-transform hover:scale-105 active:scale-95">'
        $c = $c -replace '(<span[^>]*>qr_code_scanner</span>\s*)</button>', '$1</a>'

        # Map
        $c = $c -replace '<button class="flex flex-col items-center gap-1 w-12 text-gray-400 hover:text-primary transition-colors">(\s*<span[^>]*>map</span>)', '<a href="map.html" class="flex flex-col items-center gap-1 w-12 text-gray-400 hover:text-primary transition-colors">$1'
        $c = $c -replace '(<span[^>]*>Map</span>\s*)</button>', '$1</a>'

        # Profile
        $c = $c -replace '<button class="flex flex-col items-center gap-1 w-12 text-gray-400 hover:text-primary transition-colors">(\s*<span[^>]*>person</span>)', '<a href="dashboard.html" class="flex flex-col items-center gap-1 w-12 text-gray-400 hover:text-primary transition-colors">$1'
        $c = $c -replace '(<span[^>]*>Profile</span>\s*)</button>', '$1</a>'

        Set-Content $path $c -NoNewline -Encoding UTF8
        Write-Host "Updated Offers"
    }
}

function Update-Gallery {
    $path = "gallery.html"
    if (Test-Path $path) {
        $c = Get-Content $path -Raw -Encoding UTF8
        # Back button
        $c = $c -replace '<button class="flex size-10 shrink-0 items-center justify-center rounded-full active:bg-black/5 dark:active:bg-white/10 transition-colors">(\s*<span[^>]*>arrow_back</span>\s*)</button>', '<a href="index.html" class="flex size-10 shrink-0 items-center justify-center rounded-full active:bg-black/5 dark:active:bg-white/10 transition-colors">$1</a>'
        Set-Content $path $c -NoNewline -Encoding UTF8
        Write-Host "Updated Gallery"
    }
}

function Update-Safety {
    $path = "safety.html"
    if (Test-Path $path) {
        $c = Get-Content $path -Raw -Encoding UTF8
        # Back button
        # Note: using -replace with regex '(?s)' for single-line mode if needed, but here simple pattern
        $c = $c -replace '<div class="text-slate-900 dark:text-white flex size-12 shrink-0 items-center justify-start cursor-pointer transition-opacity hover:opacity-70">(\s*<span[^>]*>arrow_back</span>\s*)</div>', '<a href="index.html" class="text-slate-900 dark:text-white flex size-12 shrink-0 items-center justify-start cursor-pointer transition-opacity hover:opacity-70">$1</a>'
        
        # View Map button
        $c = $c -replace '<button class="flex-1 flex items-center justify-center gap-2 h-12 bg-primary hover:bg-blue-600 text-white font-bold rounded-xl shadow-lg shadow-primary/30 transition-all active:scale-95">', '<a href="map.html" class="flex-1 flex items-center justify-center gap-2 h-12 bg-primary hover:bg-blue-600 text-white font-bold rounded-xl shadow-lg shadow-primary/30 transition-all active:scale-95">'
        $c = $c -replace '(<span[^>]*>map</span>\s*<span>View Park Map</span>\s*)</button>', '$1</a>'
        
        Set-Content $path $c -NoNewline -Encoding UTF8
        Write-Host "Updated Safety"
    }
}

function Update-Events {
    $path = "events.html"
    if (Test-Path $path) {
        $c = Get-Content $path -Raw -Encoding UTF8
        # Back button
        $c = $c -replace '<button class="text-gray-900 dark:text-white flex size-12 shrink-0 items-center justify-center rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors">(\s*<span[^>]*>arrow_back</span>\s*)</button>', '<a href="index.html" class="text-gray-900 dark:text-white flex size-12 shrink-0 items-center justify-center rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors">$1</a>'
        Set-Content $path $c -NoNewline -Encoding UTF8
        Write-Host "Updated Events"
    }
}

Update-Booking
Update-Map
Update-Dashboard
Update-Dining
Update-Offers
Update-Gallery
Update-Safety
Update-Events
