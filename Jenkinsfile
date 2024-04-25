pipeline {
    agent {
        label 'spc'
    }
    triggers {
        pollSCM('* * * * *')
    }
    stages {
        stage('scm') {
            steps {
                git url: 'https://github.com/ARIFULLALAB01/spring-petclinic-2024-03.git',
                    branch: 'main'
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
                withSonarQubeEnv(credentialsId: 'spc-token', installationName: 'spc-token') { // You can override the credential to be used
                sh 'mvn clean package sonar:sonar -Dsonar.host.url=https://sonarcloud.io -Dsonar.organization=spc-devops -Dsonar.projectKey=spc-devops_spc'}
            }
        }

    }
}