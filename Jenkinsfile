pipeline{
    agent any

    environment{
        containerToCommitId=""
    }

    stages{
        stage("Build docker container"){
            steps{
                sh "docker build -f Dockerfile -t nginx-proxy ."
            }
        }

        stage("Run container"){
            steps{
                containerToCommitId = sh "docker run -d -t --name containerToCommit nginx-proxy"
            }
        }

        stage("Commit docker container to dockerhub"){
            steps{
                sh "docker login -u $USERNAME -p $PASSWORD"
                sh "docker commit $containerToCommitId artefall/nginx-proxy:$VERSION"
            }

        }
    }
  
}