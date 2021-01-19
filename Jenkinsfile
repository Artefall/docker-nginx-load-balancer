pipeline{

    def app

    agent any

    environment{
        containerToCommitId="",
        registryCredentials='dockerhub_id'
    }

    stages{
        stage("Build docker container"){
            steps{
                script{
                    app = docker.build("artefall/nginx-proxy")
                }
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
                sh "echo $TOKEN > password.txt"
                sh "cat password.txt | docker login -u artefall --password-stdin 2>/dev/null"

                sh "docker commit $containerToCommitId artefall/nginx-proxy:$VERSION"
                
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
