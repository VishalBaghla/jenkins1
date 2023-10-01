set -x
cd deployment
git status
git branch
git checkout testbranch
touch test1
git add test1
git commit -m "Add test.sh"
git status
git push origin testbranch