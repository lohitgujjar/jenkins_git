pipeline {
    agent any 
    stages {
        stage('Clone') { 
            steps {
                sh "git clone https://github.com/lohitgujjar/jenkins_git.git"
            }
        }
        stage('Test') { 
            steps {
                sh "./shellcode.sh DriveSim Testcases"
            }
        }
    }
}
