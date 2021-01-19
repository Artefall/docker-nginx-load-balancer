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
                    sh "containerToCommitId=$(docker run --rm -d -t --name containerToCommit nginx-proxy)"
                }
            }
        }

        stage("Login into dockerhub"){
            steps{

                sh "echo $TOKEN > password.txt"

                //catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh "cat password.txt | docker login -u artefall --password-stdin 2>/dev/null"
                //}
                
            }
        }

        stage("Commit to dockerhub"){
            steps{
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "docker commit $containerToCommitId artefall/nginx-proxy:latest"
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
