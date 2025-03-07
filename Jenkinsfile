pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Build the project'
                sh 'chmod +x ./scripts/build.sh'
                sh './scripts/build.sh 15'
            }
        }

        stage('Test') {
            steps {
                echo 'Run tests'
                sh 'chmod +x ./scripts/test.sh'
                sh './scripts/test.sh 15'
            }
        }

        stage('Benchmark') {
            steps {
                echo 'Run benchmarks'
                sh 'chmod +x ./scripts/benchmark.sh'
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
