pipeline {
    agent {
        label "worker-1"
    }

    tools {
        git "git"
        Python "python3"
    }

    stages {

        stage('clone') {
            steps {
                git branch: 'feature-1', url: 'https://github.com/guptaji-tech-web/python-app.git' 
            }
        }
    }
}  
