pipeline {
  agent any
  stages {
    stage('Checkout Source') {
      steps {
        git 'https://github.com/soufianem370/playjenkins.git'
      }
    }

    stage('Build image') {
      steps {
        script {
          dockerImage = docker.build registry + ":${BUILD_NUMBER}"
        }

      }
    }

    stage('Push Image') {
      steps {
        script {
          docker.withRegistry( "" ) {
            dockerImage.push()
            sh "docker push 172.42.42.1:5000/justme/myweb:${BUILD_NUMBER}"
          }
        }

      }
    }
    stage('change tag') {
      steps {
          sh "chmod +x changeTag.sh"
          sh "./changeTag.sh ${BUILD_NUMBER}"
          }
        }
    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "myweb.yaml", kubeconfigId: "mykubeconfig")
        }

      }
    }

  }
  environment {
    registry = '172.42.42.1:5000/justme/myweb'
    dockerImage = ''
  }
}
