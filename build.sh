FILES=*.markdown
for f in $FILES
do
  filename="${f%.*}"
  echo "Converting $f to $filename.html"
  `pandoc $f -c perfect.css -o "./html/$filename.html" \
          -T "MinimalistMardownSite | $filename"`
done
