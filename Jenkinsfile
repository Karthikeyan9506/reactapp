pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                script {
                    // Run the build.sh script
                    sh 'chmod +x ./scripts/build.sh'
                    sh './scripts/build.sh'
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    // Run the deploy.sh script
                     sh 'chmod +x ./scripts/deploy.sh'
                    sh './scripts/deploy.sh'
                }
            }
        }
    }
    
    post {
        success {
            echo 'Build and Deploy successful!'
        }
        failure {
            echo 'Build or Deploy failed!'
        }
    }
}
