set -x
mkdir repo
git clone -b main https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/VishalBaghla/test.git repo/test
cd repo/test
git checkout -f main
cp -rf ENV NEW_ENV
cd NEW_ENV
find . -type f -exec sed -i "s/DEV/PROD/g" {} \;
git add .
git commit -m "Creating new project configs"
git status
git push
git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/VishalBaghla/test.git --all
git status