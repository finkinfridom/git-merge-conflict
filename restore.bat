set new_branch_name=%1
if not defined new_branch_name set new_branch_name=feat/update-file
set main_branch_name=%2
if not defined main_branch_name set main_branch_name=main

git checkout %main_branch_name%
git pull

git show-ref refs/heads/%new_branch_name% > .tmp
set /p has_branch=<.tmp
del /q .tmp
if not "%has_branch%" == "" (    
    git branch -D %new_branch_name%
    git push --delete %new_branch_name%
    git pull
)

pause

git checkout %main_branch_name%
git reset --hard HEAD~1
pause
git push --force
