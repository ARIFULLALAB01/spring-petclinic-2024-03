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

    }
}