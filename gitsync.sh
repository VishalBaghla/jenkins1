set -x
git status
git branch
cp -rf "path/test" "path_new/test"
cd "new_path"
find . -type f -exec sed -i "s/$K8S_NAMESPACE/$DESTINATION_PROJECT/g" {} \;
cat ${APP}.yaml
cd ..
#git remote set-url origin https://${GIT_USERNAME}:${GIT_PASSWORD}@git.marriott.com/${ORG}/${APP}-configs.git
#git branch ${DEPLOYMENT_GIT_BRANCH}
#git pull origin ${DEPLOYMENT_GIT_BRANCH}
#git pull
git add $DESTINATION_PROJECT
git commit -m "Creating new project configs"
git status
git push
git status