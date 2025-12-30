
# Refine Offers.html
$offersPath = "C:/Users/PriyaKarthick/.gemini/antigravity/scratch/stitch_kids_landing/offers.html"
$offersContent = Get-Content -Path $offersPath -Raw
# Link Terms
$offersContent = $offersContent -replace '<a class="text-xs text-text-sub-light dark:text-text-sub-dark hover:underline" href="#">', '<a class="text-xs text-text-sub-light dark:text-text-sub-dark hover:underline" href="safety.html">'
# Link View Details Button (using regex to capture the button content and replace with 'a' tag)
$offersContent = $offersContent -replace '<button class="border-2 border-primary text-primary hover:bg-primary/5 font-bold py-2 px-6 rounded-xl transition-all">\s*View Details\s*</button>', '<a href="events.html" class="border-2 border-primary text-primary hover:bg-primary/5 font-bold py-2 px-6 rounded-xl transition-all flex items-center justify-center">View Details</a>'
Set-Content -Path $offersPath -Value $offersContent

# Refine Map.html
$mapPath = "C:/Users/PriyaKarthick/.gemini/antigravity/scratch/stitch_kids_landing/map.html"
$mapContent = Get-Content -Path $mapPath -Raw
# Fix Syntax Error and Link Fast Pass
# Matches <button ...> ... Fast Pass ... </a> 
# We use a broad regex to capture the mismatch
$mapContent = $mapContent -replace '<button\s+class="flex-1 bg-primary hover:bg-\[#0be00b\] text-black h-10 rounded-full font-bold text-sm flex items-center justify-center gap-2 shadow-\[0_4px_10px_rgba\(13,242,13,0\.3\)\] transition-all active:scale-95">\s*<span class="material-symbols-outlined text-lg">confirmation_number</span>\s*Fast Pass\s*</a>', '<a href="booking.html" class="flex-1 bg-primary hover:bg-[#0be00b] text-black h-10 rounded-full font-bold text-sm flex items-center justify-center gap-2 shadow-[0_4px_10px_rgba(13,242,13,0.3)] transition-all active:scale-95"><span class="material-symbols-outlined text-lg">confirmation_number</span>Fast Pass</a>'
Set-Content -Path $mapPath -Value $mapContent

# Refine Dining.html
$diningPath = "C:/Users/PriyaKarthick/.gemini/antigravity/scratch/stitch_kids_landing/dining.html"
$diningContent = Get-Content -Path $diningPath -Raw
# Link See All
$diningContent = $diningContent -replace '<span class="text-primary text-sm font-bold cursor-pointer">See All</span>', '<a href="#" class="text-primary text-sm font-bold cursor-pointer">See All</a>'
# Link Cart Button to Booking
# This regex targets the Shopping Cart button in the header
$diningContent = $diningContent -replace '<button\s+class="flex size-12 cursor-pointer items-center justify-center rounded-full bg-primary text-white shadow-md active:scale-95 transition-transform relative">\s*<span class="material-symbols-outlined">shopping_cart</span>', '<a href="booking.html" class="flex size-12 cursor-pointer items-center justify-center rounded-full bg-primary text-white shadow-md active:scale-95 transition-transform relative"><span class="material-symbols-outlined">shopping_cart</span>'
# We also need to close the 'a' tag instead of 'button' tag for the Cart button.
# Since we replaced the opening tag with <a, the closing tag is still </button>.
# We can find the closing </button> that follows the shopping_cart span block.
# Actually, the button contains: <span shopping_cart> <span absolute><span ping><span relative></span></span> </button>
# It's safer to just replace the whole block if possible.
$cartBlockRegex = '(?s)<button\s+class="flex size-12 cursor-pointer items-center justify-center rounded-full bg-primary text-white shadow-md active:scale-95 transition-transform relative">.*?shopping_cart.*?<\/button>'
$cartBlockReplacement = '<a href="booking.html" class="flex size-12 cursor-pointer items-center justify-center rounded-full bg-primary text-white shadow-md active:scale-95 transition-transform relative"><span class="material-symbols-outlined">shopping_cart</span><span class="absolute top-2 right-2 flex h-3 w-3"><span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-white opacity-75"></span><span class="relative inline-flex rounded-full h-3 w-3 bg-white"></span></span></a>'
$diningContent = $diningContent -replace $cartBlockRegex, $cartBlockReplacement
Set-Content -Path $diningPath -Value $diningContent

Write-Host "Refinement complete."
