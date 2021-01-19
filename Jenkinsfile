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
                    env.containerId=sh(script: "docker run --rm -d -t --name containerToCommitttttttttttttttttttttttttttttttttttt nginx-proxy", returnStdout: true)
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
                    sh(script:"docker container commit $env.containerId nginx-proxy:$VERSION", returnStdout: true)
                }
            }
        }

        stage("Push container to dockerhub"){
            steps{
                sh "docker push artefall/nginx-proxy:$VERSION"
            }
        }

    }
    post{
        always{
            sh "docker kill containerToCommitttttttttttttttttttttttttttttttttttt"
            }
        }
  
}
