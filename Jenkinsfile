pipeline {
    agent {
        label "worker-1"
    }

    tools {
        git "git"
    }

    stages {

        stage('clone') {
            steps {
                git branch: 'feature-1', url: 'https://github.com/guptaji-tech-web/python-app.git' 
            }
        }

        stage('install dependency') {
            steps {
                sh "pip3 install -r requirements.txt"
            }
        }
    }
}  
