set new_branch_name=%1
if not defined new_branch_name set new_branch_name=feat/update-readme
set main_branch_name=%2
if not defined main_branch_name set main_branch_name=main
 
git checkout %main_branch_name%
git branch -D %new_branch_name%

git checkout %main_branch_name%
git reset --hard HEAD~1
git push --force