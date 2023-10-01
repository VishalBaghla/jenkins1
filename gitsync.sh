set -x
git checkout testbranch
touch test1
git add test1
git commit -m "Add test.sh"
git status
git push