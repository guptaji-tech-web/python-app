pipeline {
    agent {
        label "worker-1"
    }

    tools {
        git "git"
        dockerTool 'docker'

    }

    stages {

        stage('clone') {
            steps {
                git branch: '$BRANCH_NAME', url: 'https://github.com/guptaji-tech-web/python-app.git' 
            }
        }

        stage('Build docker image') {
            steps {
                sh "docker build -t guptatrng/python-app/app-$BRANCH_NAME:$GIT_COMMIT ."
            }
        }

        stage('Push docker image') {
            steps {
                withDockerRegistry(credentialsId: 'docker-credentials', url: "") {
                    sh "docker push guptatrng/python-app/app-$BRANCH_NAME:$GIT_COMMIT"
                }
            }
        }
    }
}  
