if not exist ./conflicting-file.md goto :eof

echo # This is going to be the content on %1 > ./conflicting-file.md

git add conflicting-file.md
git commit -m "Update file"

git push origin %1