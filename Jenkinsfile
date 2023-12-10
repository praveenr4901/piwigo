pipeline {
    agent any 
    stages {
        stage('Clone') { 
            steps {
                checkout scmGit(branches: [[name: '*']], extensions: [], userRemoteConfigs: [[credentialsId: 'gitrepo', url: 'https://github.com/praveenr4901/piwigo.git']])
            }
        }
    }
    stage('build') { 
        steps {
            sh 'docker build -t praveen .'
        }
    }
}
