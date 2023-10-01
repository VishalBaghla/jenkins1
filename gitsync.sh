set -x
ls -ltr deployment/
mkdir repo
cd repo
#git clone -b trunk https://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@git.marriott.com/${ORG}/${APP}-configs.git
#git branch -r
#git branch
#git pull
#git remote -v
#git checkout ${DEPLOYMENT_GIT_BRANCH}
#git pull
ls -ltr
#cd ${APP}-configs
#ls -ltr
#cp -rf "${K8S_SERVER}${K8S_SECURITY_ZONE}/${K8S_NAMESPACE}" "${K8S_SERVER}${K8S_SECURITY_ZONE}/${DESTINATION_PROJECT}"
#cd "${K8S_SERVER}_${K8S_SECURITY_ZONE}/${DESTINATION_PROJECT}"
#find . -type f -exec sed -i "s/$K8S_NAMESPACE/$DESTINATION_PROJECT/g" {} \;
#cat ${APP}.yaml
#cd ..
#git remote set-url origin https://${GIT_USERNAME}:${GIT_PASSWORD}@git.marriott.com/${ORG}/${APP}-configs.git
#git branch ${DEPLOYMENT_GIT_BRANCH}
#git pull origin ${DEPLOYMENT_GIT_BRANCH}
#git pull
#git add $DESTINATION_PROJECT
#git commit -m "Creating new project configs"
git status
git checkout test
git status
#git push
#git status