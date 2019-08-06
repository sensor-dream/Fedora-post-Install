#!/bin/env sh

file_html="index_def.html"
tofile_html="index.html"
file_php="error_document.php"
tofile_php="index.php"

cd ../
## find * -not -path utils -type d -exec cp -f $file_html {}/$tofile_html \;
find * -not -path utils -type d -exec cp -f $file_php {}/$tofile_php \;
