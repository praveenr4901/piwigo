pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'gitrepo', url: 'https://github.com/praveenr4901/piwigo.git']]])
            }
        }
        stage('Build') {
            steps {
                   sh 'docker build -t praveen .'
            }
        }
    }
}

