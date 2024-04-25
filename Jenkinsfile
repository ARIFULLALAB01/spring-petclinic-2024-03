pipeline {
     agent {
        label 'spc'
     }
     triggers {
        pollSCM('* * * * *')
     }
     stages {
        stage {
            steps {
                git url: 'https://github.com/ARIFULLALAB01/spring-petclinic-2024-03.git',
                    branch: 'main'
            }
        }
     }
}