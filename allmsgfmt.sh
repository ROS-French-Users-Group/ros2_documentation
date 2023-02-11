#!/bin/zsh

for afile in ./**/*.po(.) 
do
  targetfile=${afile:r}.mo
  echo "msgfmt $afile -o $targetfile"
  msgfmt $afile -o $targetfile
  
done
