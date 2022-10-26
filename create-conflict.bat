@echo off
set new_branch_name=%1
if not defined new_branch_name set new_branch_name=feat/update-readme
set main_branch_name=%2
if not defined main_branch_name set main_branch_name=main

echo "updating file on '%main_branch_name%'"
call ./steps/00-touch-file-on-main.bat %main_branch_name%
pause
echo "perform 'git pull origin %main_branch_name%'"
call ./steps/01-git-pull.bat %main_branch_name%
pause
echo "perform 'git checkout -b %new_branch_name%'"
call ./steps/02-git-checkout.bat %new_branch_name%
pause
echo "updating file on '%new_branch_name%'"
call ./steps/03-touch-file-on-branch.bat %new_branch_name%
pause
echo "committing file on '%new_branch_name%'"
call ./steps/04-commit-and-push.bat %new_branch_name%
pause
echo "perform 'git merge origin %main_branch_name%'"
call ./steps/05-git-merge.bat
pause