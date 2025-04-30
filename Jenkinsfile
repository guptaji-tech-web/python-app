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
                sh "docker build -t guptatrng/python-app-$BRANCH_NAME:$GIT_COMMIT ."
            }
        }

        stage('Push docker image') {
            steps {
                withDockerRegistry(credentialsId: 'docker-credentials', url: "") {
                    sh "docker push guptatrng/python-app-$BRANCH_NAME:$GIT_COMMIT"
                }
            }
        }

        stage('Modify manifests') {
            steps {
                dir('./manifests') {
                    sh "sed -i 's/python-app/python-app-$BRANCH_NAME/g' deployment.yaml"
                    sh "sed -i 's|guptatrng/python-app-$BRANCH_NAME:v1|guptatrng/python-app-$BRANCH_NAME:$GIT_COMMIT|g' deployment.yaml"
                    sh "sed -i 's/python-app/python-app-$BRANCH_NAME/g' service.yaml"
                }
            }
        }

        stage('Prepare directory') {
            steps {
                dir('./manifests') {
                    sh "mkdir github"
                }
            }
        }

        stage('Push manifest files') {
            steps {
                dir('./manifests/github') {
                    withCredentials([gitUsernamePassword(credentialsId: 'github-guptaji-tech-web', gitToolName: 'git')]) {
                        sh """
                            git init
                            git remote add origin https://github.com/guptaji-tech-web/python-app-manifest.git
                            git checkout -b $BRANCH_NAME
                            git pull origin $BRANCH_NAME
                            mv ../*.yaml ./python-app-manifest
                            git add .
                            git commit -m $GIT_COMMIT
                            git push origin $BRANCH_NAME
                        """
                    }
                }
            }
        }
    }

    post {
        always {
            deleteDir()
    }
}
}  
