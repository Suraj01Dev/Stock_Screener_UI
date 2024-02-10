pipeline {
    agent {
        label "jenkins-ssh-agent"
    }

    stages {
        stage('Git Checkout') {
            steps {
                git 'https://github.com/Suraj01Dev/Stock_Screener_UI'
            }
            

        }
        stage('Installing Python Dependencies') {
            steps {
                        sh '''
                        pip3 install streamlit pandas requests
                        '''
            }

        }
        stage('Testing Script') {
            steps {
                        sh '''
                        bash test.sh
                        '''
            }

        }
stage('SonarQube Code Analysis') {
            steps {
                dir("${WORKSPACE}"){
                // Run SonarQube analysis for Python
                script {
                    def scannerHome = tool name: 'sonarqube-scanner-latest'
                    withSonarQubeEnv('sonarqube-scanner') {
                        sh "echo $pwd"
                        sh "${scannerHome}/bin/sonar-scanner"
                    }
                }
            }
            }
       }
stage("Quality gate") {
            steps {
                waitForQualityGate abortPipeline: true
            }
        }



    }
}


