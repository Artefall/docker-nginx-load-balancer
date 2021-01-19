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

        stage("Commit docker container to dockerhub"){
            steps{
                sh "docker login -u $USERNAME --password-stdin"
                sh "cat <<< $PASSWORD"
                sh "docker commit $containerToCommitId artefall/nginx-proxy:$VERSION"
            }
        }

        stage("Kill container"){
            steps{
                sh "docker kill containerToCommit"
            }
        }
    }
    post{
        always{
            sh "docker kill containerToCommit"
            }
        }
  
}
