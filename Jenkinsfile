pipeline{
    agent any

    stages{
        stage('uni test & report'){
            steps{
                sh label: 'go test', script: '''cd helloworld
                go mod download
                go test -v 2>&1 | go-junit-report > report.xml'''
            }
            post {
                always {
                    junit 'helloworld/report.xml'
                }
            }
        }
        stage('build & start application'){
            steps{
                sh label: 'docker-compose', script: 'docker-compose up -d --build --force-recreate'
            }
        }
        stage('run api test robot'){
            steps{
                sh label: 'docker-compose', script: '''cd test/api
                source env/bin/activate
                pip install -r requirements.txt
                robot greeting.robot
                deactivate'''
            }
            post {
                always {
                    sh label: 'docker-compose', script: 'docker-compose down'
                }
            }
        }
    }
}