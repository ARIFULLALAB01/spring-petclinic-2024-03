pipeline {
    agent {
        label 'DEV'
    }
    tools {
		jfrog 'jfrog-cli'
	}
    environment {
        MAVEN_SETTINGS_CRED_ID = 'maven-settings-file'  // Replace with your credential ID
        DOCKER_IMAGE_NAME = "trialkbljqt.jfrog.io/spc-docker-local/spc:${env.BUILD_ID}"
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
        stage('Copy settings.xml') {
            steps {
                withCredentials([file(credentialsId: "${MAVEN_SETTINGS_CRED_ID}", variable: 'SETTINGS_FILE')]) {
                    // Copy to .m2 directory on the node
                    sh 'mkdir -p ~/.m2'
                    sh 'cp $SETTINGS_FILE ~/.m2/settings.xml || exit 0'
                }
            }
        }
        stage('deploythe-artifacts-jforg'){
            steps{
                sh 'mvn clean deploy -Dskiptest'
            }
        }

        stage('dockerimagebuild'){
            steps{
                sh 'docker image build -t $DOCKER_IMAGE_NAME .'
            }
        }
        stage('scanandpush'){
            steps{
               // scan the docker image
                jf 'docker scan $DOCKER_IMAGE_NAME'
                // push the docker image
                jf 'docker push $DOCKER_IMAGE_NAME'
            }
        }
        stage('Publish build info') {
			steps {
				jf 'rt build-publish'
			}
		}

        // stage('build with sonar') {
        //     steps {
        //         withSonarQubeEnv(credentialsId: 'Sonar_Cloud', installationName: 'Sonar_Cloud') { // You can override the credential to be used
        //         sh 'mvn clean package sonar:sonar -Dsonar.host.url=https://sonarcloud.io -Dsonar.organization=arifullalab01 -Dsonar.projectKey=ARIFULLALAB01_spring-petclinic-2024-03'}
        //     }
        // }

    }
}
// mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=ARIFULLALAB01_spring-petclinic-2024-03