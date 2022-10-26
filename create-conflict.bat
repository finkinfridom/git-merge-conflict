@echo off
set new_branch_name=%1
if not defined new_branch_name set new_branch_name=feat/update-file
set main_branch_name=%2
if not defined main_branch_name set main_branch_name=main

echo "creating file on '%main_branch_name%'"
call ./steps/00-create-file-on-main.bat %main_branch_name%
pause
echo "perform 'git pull origin %main_branch_name%'"
call ./steps/01-git-pull-main.bat %main_branch_name%
pause
echo "perform 'git checkout -b %new_branch_name%'"
call ./steps/02-create-new-branch.bat %new_branch_name%
pause
echo "updating file on '%main_branch_name%'"
call ./steps/03-update-file-on-main.bat %main_branch_name%
pause
echo "perform 'git checkout %new_branch_name%"
call ./steps/04-git-checkout-new-branch.bat %new_branch_name%
pause
echo "updating file on %new_branch_name%"
call ./steps/05-touch-file-on-branch.bat %new_branch_name%
pause
echo "committing file on '%new_branch_name%'"
call ./steps/06-commit-and-push-on-new-branch.bat %new_branch_name%
pause
echo "perform 'git merge origin %main_branch_name%'"
call ./steps/07-git-merge-main.bat %main_branch_name%
pause