set branch=%1
set has_branch=
git show-ref refs/heads/%branch% > .tmp
set /p has_branch=<.tmp
del /q .tmp
if "%has_branch%" == "" (
    git checkout -b %branch%
    goto :eof
)
git checkout %branch%