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

        stage('create venv') {
            steps {
                sh """
                    python3 -m venv ~/myenv
                """
            }
        }

        stage('Install dependency') {
            steps {
                sh """
                   . ~/myenv/bin/activate
                   python3 -m pip install -r requirements.txt
                """
            }
        }
    }
}  
