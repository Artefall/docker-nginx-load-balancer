pipeline{

    agent any

    stages{
        stage("Build docker container"){
            steps{
                sh "docker build -f Dockerfile -t nginx-proxy ."
            }
        }

        stage("Run container"){
            steps{
                
                script{
                    env.containerId = sh(script: "docker run --rm -d -t --name containerToCommit nginx-proxy")
                } 
            }
        }

        stage("Login into dockerhub"){
            steps{

                sh "echo $TOKEN > password.txt"

                sh "cat password.txt | docker login -u artefall --password-stdin 2>/dev/null"
                
            }
        }

        stage("Commit to dockerhub"){
            steps{
                script{
                    sh(script:"docker commit ${env.containerId} artefall/nginx-proxy:latest")
                }
            }
        }

        stage("Push container to dockerhub"){
            steps{
                sh "docker push artefall/nginx-proxy:latest"
            }
        }

    }
    post{
        always{
            sh "docker kill containerToCommit"
            }
        }
  
}
