
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
        stage('Checkout'){
            steps {
                script {

                    checkout([
                    $class: 'GitSCM',
                    branches: scm.branches,
                    extensions: scm.extensions + [[$class: 'WipeWorkspace']],
                    userRemoteConfigs: scm.userRemoteConfigs
                    ])
                }
            }
        }
        stage('Prepare Environment') {
            steps {
                script {
                    sh "ls -la android"
                    
                    withCredentials([file(credentialsId: 'flite_android_keystore', variable: 'KEYSTORE')]) {
                        sh "cp ${KEYSTORE} $WORKSPACE/android/app/myapp-release-key.jks"
                        sh "ls -la android"
                    }
                    withCredentials([file(credentialsId: 'android_key_properties', variable: 'KEYPROPERTIES')]) {
                        sh "cp ${KEYPROPERTIES} $WORKSPACE/android/key.properties"
                        sh "ls -la android"
                    }
                    withCredentials([file(credentialsId: 'blueprint_env', variable: 'ENV_BLUEPRINT')]) {
                        sh "cp ${ENV_BLUEPRINT} $WORKSPACE/android/fastlane/.env"
                    }

                    sh "fvm use 3.3.0"
                }
            }
        }
        stage('Analyze') {
            steps {
                script {
                    sh "fvm flutter analyze"
                }
                
            }
        }

        stage('Test & Coverage') {
            steps {
                script {
                    sh "fvm flutter test"
                    sh "fvm flutter test --coverage"
                    //sh "genhtml coverage/lcov.info -o coverage"
                    //publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '', reportFiles: 'coverage/index.html', reportName: 'HTML Coverage Report', reportTitles: 'Coverage Report'])
                } 
            }
        }

        stage('Increment Version') {
            steps {
                script {
                    dir("android") {
                        sh "fastlane increment_version"
                    }
                }
                
            }
        }

        stage('Export APK') {
            steps {
                script {
                    sh "fvm flutter build apk --release"
                }
                
            }
        }

        stage('Publish to firebase') {
            steps {
                script {
                    dir("android") {
                        sh "fastlane distribute"
                    }
                }
                
            }
        }
    }
}
