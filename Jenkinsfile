pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred-vyasg')
    }
    stages {
        stage('Build') {
            steps {
                echo 'Hello, This is a Docker image build step'
               // git branch: 'main', url: 'https://github.com/vyasg84/Django-todo-app.git'
                sh 'docker build -t vyasg84/djnago-todo-app:1.0 .'
                sh 'docker build -t vyasg84/nginx-todo:1.0 .'
           }
        }    
    
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                
         }
        }    
    
        stage('Push') {
            steps {
		    echo "Pushing Image to Docker Hub...."
                  sh 'docker push vyasg84/djnago-todo-app:1.0'
                  sh 'docker push vyasg84/nginx-todo:1.0'

         }
        }    
    
	 stage('Deploy to DIGITAL OCEAN'){
	    steps{
		 echo "Connecting to server...."
	  	 sshagent(['digital-ocean-server']){
	   	 sh "ssh -o StrictHostKeyChecking=no root@165.22.208.179"
	         sh "chmod +x ./production.sh" 
	         sh "./production.sh"
		 }
	  }
      }
	   
    }
}
