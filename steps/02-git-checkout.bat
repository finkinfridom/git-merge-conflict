set branch=%1
set has_branch=
git show-ref refs/heads/%branch% > .tmp
set /p has_branch=<.tmp
if "%has_branch%" == "" (
    git checkout -b %branch%
    del /q .tmp
    goto :eof
)
git checkout %branch%
del /q .tmp