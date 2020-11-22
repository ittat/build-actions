#!/bin/bash
set -e

curl -H "Authorization: token ${GIT_ACCESS_TOKEN}"   --request POST   --data '{"event_type": "'$1'","client_payload": {"device_name":"'${device_name}'", "build_device_tag":"'${build_device_tag}'", "repo_dispatches":"'${repo_dispatches}'", "android_source":"'${android_source}'", "android_branch":"'${android_branch}'"}}'  ${repo_dispatches}
