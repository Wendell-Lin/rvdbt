pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Build the project'
                sh './scripts/build.sh 15'
            }
        }

        stage('Test') {
            steps {
                echo 'Run tests'
                sh './scripts/test.sh 15'
            }
        }

        stage('Benchmark') {
            steps {
                echo 'Run benchmarks'
                sh './scripts/benchmark.sh 15'
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
