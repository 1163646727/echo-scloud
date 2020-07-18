@echo off
setlocal enabledelayedexpansion

set base_dir=deploy\busi
set prefix=
set modules=gateway
set names=

cd ..
rd /s/q "%base_dir%" & mkdir "%base_dir%"

for %%m in (%modules%) do (
set "names=!names!,%prefix%%%m"
)

call mvn -pl %names% -am clean package -DskipTests -U

for %%m in (%modules%) do (
echo coping module %%m...
mkdir "%base_dir%\%%m"
copy %prefix%%%m\target\%prefix%%%m.jar %base_dir%\%%m\%prefix%%%m.jar
copy %prefix%%%m\target\ver_* %base_dir%\%%m\
echo module %%m done
)

cd deploy
rem pause
