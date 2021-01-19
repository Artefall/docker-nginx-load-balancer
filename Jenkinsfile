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
                script{
                    env.containerToCommitId = sh "docker run --rm -d -t --name containerToCommit nginx-proxy"
                }
            }
        }

        stage("Commit and push docker container to dockerhub"){
            steps{
                sh "docker commit $containerToCommitId artefall/nginx-proxy:$VERSION"
                sh "docker push artefall/nginx-proxy:tagname"
            }
        }

        
    }
    post{
        always{
            sh "docker kill containerToCommit"
            }
        }
  
}
