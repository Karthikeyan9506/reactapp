pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                script {
                    // Run the build.sh script
                    sh 'scripts/build.sh'
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    // Run the deploy.sh script
                    sh 'scripts/deploy.sh'
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
