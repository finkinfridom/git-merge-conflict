if exist ./conflicting-file.md goto :eof

git pull origin %1

echo # This is going to be the content on %1 > ./conflicting-file.md

git add ./conflicting-file.md
git commit -m "Created file"

git push origin %1