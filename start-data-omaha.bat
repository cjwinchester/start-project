:: navigate to git folder
cd git

:: prompt for repo name and description
@echo off
set /p name="Name your new repo: " %=%
set /p descrip="Describe it: " %=%

:: create a new github repo
curl -u "cjwinchester:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" https://api.github.com/user/repos -i -X POST -H "Content-Type: application/json" -d "{\"name\": \"%name%\", \"auto_init\": true, \"private\": false, \"description\":\"%descrip%\"}"

:: nab template page
mkdir %name%
cd %name%
curl -O https://raw.github.com/OWH-projects/owh-base-template/master/index.html

:: synchronize and push
git init
git remote add origin https://github.com/cjwinchester/%name%
git pull origin master
git add .
git commit -m "initial commit"
git push

:: open folder
%SystemRoot%\explorer.exe "C:\Users\Winchester\Desktop\git\%name%"