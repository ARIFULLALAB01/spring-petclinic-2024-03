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
                withSonarQubeEnv(credentialsId: 'sonardevops', installationName: 'sonardevops') { // You can override the credential to be used
                sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar -D sonar.organization=ARIFULLALAB01 -D sonar.projectkey=d2a2d07ceda52a3a8e20cec527b8ccdcd5dd96ef'}
            }
        }

    }
}