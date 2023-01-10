# tagString=`git describe --tags`
# echo $tagString
# IFS='-' read -ra array <<< "$tagString";
# for i in "${array[@]}"
# do
#     printf "$i\n"
# done
# printf "${array[0]}\n"
# IFS='/' read -ra versionsString <<< "$array[0]";
# versionsPrefix=${versionsString[1]}
# IFS='[' read -ra versions <<< "$versionsPrefix";
# versionName=${versions[0]}
# printf "Version Name:${versionName}\n"
# buildNumberString=${array[1]}
# IFS='+' read -ra builds <<< "$buildNumberString";
# flavor=${builds[0]}
# printf "Flavor:${flavor}\n"
# buildNumber=${builds[1]}
# printf "Build Number:${buildNumber}\n"


fvm flutter build ipa --export-options-plist=ios/Runner/export.plist
# fvm flutter build apk --target=lib/main_${flavor}.dart --release --flavor=${flavor} --build-name=${versionName} --build-number=${buildNumber}
