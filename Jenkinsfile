pipeline {
  agent any

  environment {
    IMAGE_NAME = 'abhijitborate/resume-app'
    IMAGE_TAG = 'latest'
  }

  stages {
    stage('Checkout Code') {
      steps {
        git 'https://github.com/AbhijitBorate-code/resume-builder.git'
      }
    }

    stage('Install Dependencies & Build Angular') {
      steps {
        sh 'npm install -g @angular/cli'
        sh 'npm install'
        sh 'ng build --configuration production'
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
      }
    }

    stage('Docker Push') {
      steps {
        withCredentials([usernamePassword(
          credentialsId: 'dockerhub-creds',
          usernameVariable: 'DOCKER_USER',
          passwordVariable: 'DOCKER_PASS'
        )]) {
          sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
          sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
        }
      }
    }
  }

  post {
    success {
      echo '✅ Deployment successful!'
    }
    failure {
      echo '❌ Build or Push failed.'
    }
  }
}
