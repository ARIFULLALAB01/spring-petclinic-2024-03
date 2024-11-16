pipeline {
    agent {
        label 'DEV'
    }
    triggers {
        pollSCM('* * * * *')
    }
    stages {
        stage('scm') {
            steps {
                git url: 'https://github.com/ARIFULLALAB01/spring-petclinic-2024-03.git',
                    branch: 'dev'
            }
        }
        stage('build') {
            steps {
               sh "mvn clean package"
               junit testResults: '**/surefire-reports/*.xml'
               archive '**/target/spring-petclinic-*.jar'

            }
            
        }
        stage('build with sonar') {
            steps {
                withSonarQubeEnv(credentialsId: 'Sonar_Cloud', installationName: 'Sonar_Cloud') { // You can override the credential to be used
                sh 'mvn clean package sonar:sonar -Dsonar.host.url=https://sonarcloud.io -Dsonar.organization=arifullalab01 -Dsonar.projectKey=ARIFULLALAB01_spring-petclinic-2024-03'}
            }
        }

    }
}