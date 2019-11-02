#!/usr/bin/env bash
# Version: 1.0.0
#
# Description: Generate favicons for websites

ICON_PATH="$PWD/$1"

ICON_BASE=$(basename "$ICON_PATH")
ICON_FILE="${ICON_BASE%*.}"

FAVICON_FILE="favicon"

echo -n "HEX color for msapplication-TileColor: "
read -r tilecolor

echo -n "Name for Manifest App: "
read -r wmname

echo -n "Short name for Manifest App: "
read -r wmshortname

echo -n "HEX color for Manifest theme: "
read -r wmthemecolor

echo -n "HEX color for Manifest background: "
read -r wmbgcolor

mkdir -p icons
cd icons || exit

# This uses rsvg-convert to create crisp PNG icons
for size in 16 32 48 150 180 192 512; do
	ICON_OUT=$ICON_FILE-${size}.png
	DIMENSIONS=${size}x${size}
	rsvg-convert -w "$size" -p 300 -d 300 "$ICON_PATH" > "$ICON_OUT"

	# Use ImageMagick to center the image and make it square
	convert "$ICON_OUT" -gravity center -background transparent \
		-resize "$DIMENSIONS" -extent "$DIMENSIONS" temp-"$ICON_OUT"

	# Use 8-bit colour to reduce the file size.
	pngquant 256 < temp-"$ICON_OUT" > "$FAVICON_FILE"-"$DIMENSIONS".png
done

# Merge the 16, 32 and 48 pixel versions into a multi-sized ICO file
convert -border 0 -background none -alpha on \
	$FAVICON_FILE-16x16.png \
	$FAVICON_FILE-32x32.png \
	$FAVICON_FILE-48x48.png \
	$FAVICON_FILE.ico
mv $FAVICON_FILE.ico ..

# Create Apple icons
mv $FAVICON_FILE-180x180.png apple-touch-icon.png

# Create Android icons
mv $FAVICON_FILE-192x192.png android-chrome-192x192.png
mv $FAVICON_FILE-512x512.png android-chrome-512x512.png

# Create MS tile icon
mv $FAVICON_FILE-150x150.png mstile-150x150.png

# Create Safari icon
cp ../$FAVICON_FILE.svg safari-pinned-tab.svg
sed -i -e 's/fill:#.\{6\}/fill:#000000/g' safari-pinned-tab.svg

# Clean up the temporary files
rm "${ICON_FILE}"*png temp-"${ICON_FILE}"*png
rm $FAVICON_FILE-48x48.png

# Create Browserconfig file
cat > browserconfig.xml <<EOF
<?xml version="1.0" encoding="utf-8"?>
<browserconfig>
    <msapplication>
        <tile>
            <square150x150logo src="/icons/mstile-150x150.png"/>
            <TileColor>$tilecolor</TileColor>
        </tile>
    </msapplication>
</browserconfig>
EOF

# Create Webmanifest file
cat > site.webmanifest <<EOF
{
    "name": "$wmname",
    "short_name": "$wmshortname",
    "icons": [
        {
            "src": "/icons/android-chrome-192x192.png",
            "sizes": "192x192",
            "type": "image/png"
        },
        {
            "src": "/icons/android-chrome-512x512.png",
            "sizes": "512x512",
            "type": "image/png"
        }
    ],
    "theme_color": "$wmthemecolor",
    "background_color": "$wmbgcolor",
    "display": "standalone"
}
EOF

cd ..

cat > favicons.html <<EOF
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
<link rel="apple-touch-icon" sizes="180x180" href="/icons/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="16x16" href="/icons/favicon-16x16.png" />
<link rel="icon" type="image/png" sizes="32x32" href="/icons/favicon-32x32.png" />
<link rel="manifest" href="/icons/site.webmanifest" />
<link rel="mask-icon" color="#ffffff" href="/icons/safari-pinned-tab.svg" />
<meta name="msapplication-config" content="/icons/browserconfig.xml" />
EOF
