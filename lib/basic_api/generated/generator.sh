
#!/bin/bash





for file in *;
do
filename=$(basename -- "$file")
filename="${filename%.*}"
className=`echo $filename | sed -r 's/_([a-z])/\U\1/gi' | sed -r 's/^([A-Z])/\l\1/' | sed 's/.*/\u&/'`

echo "Start Decoding For $filename
"
flutter pub run lib/tools/parser.dart lib/basic_api/generated/$file $className

done

