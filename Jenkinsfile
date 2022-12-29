
def publishedUrl = ""
def webhookUrl = ""

pipeline {
    agent { label 'macslave' }

    environment {
        PATH = "/opt/homebrew/bin:$PATH"
        LANG = 'en_US.UTF-8'
        LANGUAGE    = 'en_US.UTF-8'
        LC_ALL    = 'en_US.UTF-8'
        FVM_HOME = '/Users/Shared/fvm'
    }

    stages {
        stage('Build & Publish') {
            steps {
                script {
                    sh "fvm use 3.3.0"
                    // configFileProvider([configFile(fileId: '06f0e9ba-5a4c-4411-8dfb-7985803c7f14', replaceTokens: true, targetLocation: 'firebase_cred.json')]) {}
                    // configFileProvider([configFile(fileId: '006115fe-0451-487b-b6c8-88028eb2c92c',  replaceTokens: true, targetLocation: 'firebaseConfig.json')]) {}
                    // configFileProvider([configFile(fileId: '95c43b5a-41de-4f4d-bb5e-6c1082ac6e0e',  replaceTokens: true, targetLocation: '.env')]) {}
                    // sh "figlet flutter pub get"
                    sh "fvm flutter pub get"
                    // def cfg = readJSON file:"$WORKSPACE/firebaseConfig.json"
                    // def testers = "${cfg.testers.join(',')}"
                    // writeFile file: "$WORKSPACE/testers.txt", text: testers.replace("\"", "")
                    // def firebaseAppId = cfg.firebaseAppId
                    // webhookUrl = cfg.webhookUrl
                    // dir("android") {
                    //     sh "echo org.gradle.java.home=/Library/Java/JavaVirtualMachines/jdk-12.0.2.jdk/Contents/Home >> gradle.properties"   
                    //     withEnv(["GOOGLE_APPLICATION_CREDENTIALS=$WORKSPACE/firebase_cred.json", "FIREBASE_APP_ID=${firebaseAppId}", "TESTERS=$WORKSPACE/testers.txt"]) {
                    //             sh "figlet Increase version"
                    //             sh "fastlane increment_version"
                    //     }
                    // }
                    sh "ls -la android"
                    
                    withCredentials([file(credentialsId: 'flite_android_keystore', variable: 'KEYSTORE')]) {
                        sh "sudo cp ${KEYSTORE} $WORKSPACE/android/app/myapp-release-key.jks"
                        sh "ls -la android"
                    }
                    withCredentials([file(credentialsId: 'android_key_properties', variable: 'KEYPROPERTIES')]) {
                        sh "sudo cp ${KEYPROPERTIES} $WORKSPACE/android/key.properties"
                        sh "ls -la android"
                    }
                    withCredentials([file(credentialsId: 'blueprint_env', variable: 'ENV_BLUEPRINT')]) {
                        sh "sudo cp ${ENV_BLUEPRINT} $WORKSPACE/android/fastlane/.env"
                        sh "ls -la android"
                    }

                    dir("android") {
                        sh "fastlane increment_version"
                    }
                    sh "fvm flutter build apk --release"
                    dir("android") {
                        sh "fastlane distribute"
                    }
                    // dir("android") {
                    //      withEnv(["GOOGLE_APPLICATION_CREDENTIALS=$WORKSPACE/firebase_cred.json", "FIREBASE_APP_ID=${firebaseAppId}", "TESTERS=$WORKSPACE/testers.txt", "RELEASE=$WORKSPACE/release.txt"]) {
                    //         // sh "figlet Publish to Firebase"
                    //         sh "fastlane distribute"
                    //         // def release = sh returnStdout: true, script: 'fastlane export_latest_release | tee |  grep FIREBASE_RELEASE'
                    //         // def urlsplitted = release.split('/')
                    //         // def releaseName = urlsplitted[urlsplitted.length-1]
                    //         // publishedUrl = cfg.firebaseDistributionUrl + releaseName
                    //     }
                    // }
                }
                
            }
        }
    }
}
