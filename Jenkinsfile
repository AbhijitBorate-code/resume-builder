pipeline {
  agent {
    docker {
      image 'node:20' // Use latest Node.js image with npm
    }
  }

  environment {
    DOCKER_USER = credentials('dockerhubcreds')
  }

  stages {
    stage('Checkout Code') {
      steps {
        git 'https://github.com/AbhijitBorate-code/resume-builder.git'
      }
    }

    stage('Install & Build Angular App') {
      steps {
        sh 'node -v'
        sh 'npm -v'
        sh 'npm install -g @angular/cli'
        sh 'npm install'
        sh 'ng build --configuration production'
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker build -t resume-app .'
      }
    }

    stage('Docker Push to DockerHub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhubcreds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
          sh '''
            echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
            docker tag resume-app $DOCKER_USERNAME/resume-app
            docker push $DOCKER_USERNAME/resume-app
          '''
        }
      }
    }
  }
}
