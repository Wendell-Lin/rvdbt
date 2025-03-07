pipeline {
    agent any

    triggers {
        githubPush()
    }
    stages {
        stage('Build') {
            steps {
                echo 'Build the project'
                sh 'git submodule update --init --recursive'
                sh 'chmod +x ./scripts/build.sh'
                sh './scripts/build.sh 19'
            }
        }

        stage('Test') {
            steps {
                echo 'Run tests'
                sh 'chmod +x ./scripts/test.sh'
                sh './scripts/test.sh 19'
            }
        }
    }
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check logs for details.'
        }
    }
}
