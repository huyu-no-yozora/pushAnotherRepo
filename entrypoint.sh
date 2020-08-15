#!/bin/bash
#  
# entrypoint.sh
# 
# Copyright (c) 2020 冬ノ夜空
# 
# 

# ==================================
UPLOAD_FILE="$1"
GITHUB_USERNAME="$2"
GITHUB_REPO="$3"
USER_EMAIL="$4"
TARGETDIR="$5"

REMOTE_REPO="git@github.com:${GITHUB_USERNAME}/${GITHUB_REPO}.git"
HTTPS_REMORE="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPO}.git"
# ==================================


# check ============================
if [[ -z "$UPLOAD_FILE" ]]; then
  echo "error: 'upload-file' is not specified ..."; exit 1
fi
# ==================================


# Setup Git Repository =============
git clone ${HTTPS_REMORE}
cd ${GITHUB_REPO}/
git config --local pull.rebase false
git config --local user.name "${GITHUB_USERNAME}"
git config --local user.email "${USER_EMAIL}"
git checkout master

origin="https://${GITHUB_ACTOR}:${GH_DEPLOY_TOKEN}@github.com/${GITHUB_USERNAME}/${GITHUB_REPO}.git"
git pull $origin master
# ==================================


# Put file =========================
mkdir -p "${TARGETDIR}"
mv ../${UPLOAD_FILE} "${TARGETDIR}/${UPLOAD_FILE}"
# ==================================


# Commit to Another Repository =====
git add .
git commit -m "Deploy ${GITHUB_SHA} by GitHub Actions"
git push $origin master
# ==================================


# Clean Up =========================
cd ..
rm -rf ${GITHUB_REPO}
# ==================================



