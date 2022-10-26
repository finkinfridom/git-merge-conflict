if not exist ./conflicting-file.md goto :eof

set main_branch_name=%1
git checkout %main_branch_name%

echo # [UPDATE] This is going to be the content on %1 > ./conflicting-file.md

git add ./conflicting-file.md
git commit -m "Updated file"

git push origin %main_branch_name%