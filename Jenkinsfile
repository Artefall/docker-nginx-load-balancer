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

        // stage("Run container"){
        //     steps{
        //         script{
        //             env.containerToCommitId = sh "docker run --rm -d -t --name containerToCommit nginx-proxy"
        //         }
        //     }
        // }

        stage("Commit and push docker container to dockerhub"){
            steps{

                script{

                    docker.withRegistry('', registryCredentials)

                    

                    customImage.push("latest")
                }
            }
        }

        
    }
    // post{
    //     always{
    //         sh "docker kill containerToCommit"
    //         }
    //     }
  
}
