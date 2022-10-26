set branch=%1
set has_branch=
git show-ref refs/heads/%branch% > .tmp
set /p has_branch=<.tmp
del /q .tmp
if "%has_branch%" == "" (
    git branch -D %branch%
)
git checkout -b %branch%