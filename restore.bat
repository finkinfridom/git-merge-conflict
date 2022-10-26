set main_branch_name=%1
if not defined main_branch_name set main_branch_name=main

git checkout %main_branch_name%