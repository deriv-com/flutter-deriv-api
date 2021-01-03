
#!/bin/bash
FILES=lib/basic_api/generated/*
for file in $FILES;
do
filename=$(basename -- "$file")
filename="${filename%.*}"
className=`echo $filename | sed -r 's/_([a-z])/\U\1/gi' | sed -r 's/^([A-Z])/\l\1/' | sed 's/.*/\u&/'`

echo "Start Decoding For $filename
"
flutter pub run lib/tools/parser.dart $file $className

done

