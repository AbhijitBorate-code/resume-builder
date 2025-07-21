pipeline {
  agent any

  environment {
    IMAGE_NAME = 'abhijitborate/resume-app'
    IMAGE_TAG = 'latest'
  }

  stages {
    stage('Clone Git Repository') {
      steps {
        git url: 'https://github.com/AbhijitBorate-code/resume-builder.git', branch: 'main'
      }
    }

    stage('Docker Build') {
      steps {
        script {
          sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
        }
      }
    }

    stage('Docker Push to DockerHub') {
      steps {
        withCredentials([
          usernamePassword(
            credentialsId: 'dockerhubcreds',
            usernameVariable: 'DOCKER_USER',
            passwordVariable: 'DOCKER_PASS'
          )
        ]) {
          script {
            sh '''
              echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
              docker push $IMAGE_NAME:$IMAGE_TAG
            '''
          }
        }
      }
    }
  }

  post {
    success {
      echo '✅ Build and push successful!'
    }
    failure {
      echo '❌ Build or push failed!'
    }
  }
}
