rm -rf assets
rm -rf app.css
rm -rf index.html

bunx @tailwindcss/cli -i ./src/app.css -o ./app.css --content ./src/index.html
cp ./src/index.html index.html

mkdir assets

for image in ./src/assets/*.png; do
    filename=$(basename "$image" .png)
    ffmpeg -i "$image" -lossless 1 "./assets/${filename}.webp"
done