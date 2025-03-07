pipeline {
    agent any

    stages {
        stage('Go to local repo') {
            steps {
                echo 'Go to local repo with latest commit'
                sh '''
                    cd /home/wendell/rvdbt
                '''
            }
        }

        stage('Build') {
            steps {
                echo 'Build the project'
                sh 'cd /home/wendell/rvdbt && ./scripts/build.sh 15'
            }
        }

        stage('Test') {
            steps {
                echo 'Run tests'
                sh 'cd /home/wendell/rvdbt && ./scripts/test.sh 15'
            }
        }

        stage('Benchmark') {
            steps {
                echo 'Run benchmarks'
                sh 'cd /home/wendell/rvdbt && ./scripts/benchmark.sh 15'
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
