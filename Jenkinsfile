pipeline{
    agent any

    environment{
        containerToCommitId=""
    }

    stages{
        stage("Build docker container"){
            steps{
                docker build -f Dockerfile -t nginx-proxy .
            }
        }

        stage("Run container"){
            steps{
                containerToCommitId = docker run -d -t --name containerToCommit nginx-proxy
            }
        }

        stage("Commit docker container to dockerhub"){
            steps{
                docker login -u $USERNAME -p $PASSWORD
                docker commit $containerToCommitId artefall/nginx-proxy:$VERSION
            }

        }
    }
  
}