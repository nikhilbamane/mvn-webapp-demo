pipeline {
        agent {
                label {
                        label "slave"
                        //customWorkspace "/nikhil/"

                }
        }

        environment {
                url = "https://github.com/nikhilbamane/mvn-webapp-demo.git"
        }

        stages {
                stage ("ClONE_PROJECT"){
                        steps {
                        sh "sudo rm -rf *"
                        sh "git clone $url"
                        // checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nikhilbamane/mvn-webapp-demo.git']])
                        // build "gitclone"
                        // script {
                        //        git branch: 'master',
                        //        credentialsId: 'github',
                        //        url: 'https://github.com/nikhilbamane/nikhilbamane.git'
                        // }
                        // git credentialsId: 'github', url: 'https://github.com/nikhilbamane/nikhilbamane.git'

                            }

                }

                stage ("BUILD_PROJECT") {
                        steps {
                                //sh "cd mvn-webapp-demo && mvn clean install -DskipTests=true"
                                sh "cd mvn-webapp-demo && mvn clean install"
                                sh "sudo cp /nikhil/workspace/devops/mvn-webapp-demo/target/mvn-webapp-demo.war /nikhil/"
                                sh "sudo cp /nikhil/mvn-webapp-demo.war /nikhil/workspace/devops/mvn-webapp-demo/target/mvn-webapp-demo.war"
                                // sh "sudo cp /nikhil/mvn-webapp-demo.war /nikhil/workspace/devops@tmp/mvn-webapp-demo/target/mvn-webapp-demo.war"
                                sh "sudo chmod -R 777 /nikhil/workspace/devops/mvn-webapp-demo/target/mvn-webapp-demo.war"

                        }
                }

                stage ("COPY") {
                        steps {
                                // build "copy"
                                sh "sudo cp /nikhil/mvn-webapp-demo.war /nikhil/workspace/devops/mvn-webapp-demo/target/mvn-webapp-demo.war"
                                // sh "sudo docker build . --no-cache -t nikhilbamane/webapp:${BUILD_NUMBER} -f ./mvn-webapp-demo/Dockerfile"
                                sh "sudo docker build . --no-cache -t nikhilbamane/webapp:${BUILD_NUMBER} -f /nikhil/Dockerfile"
                                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
                                        sh "sudo docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
                                        sh 'sudo docker push nikhilbamane/webapp:${BUILD_NUMBER}'
                                }
                                sh "sudo docker logout"
                        }
                }

                stage ("DOCKER") {
                        agent {
                                label {
                                        label "dev"
                                         //customWorkspace "/nikhil/"
                                }
                        }

                        steps {
                                sh "sudo docker stop webapp || true"
                                sh "sudo docker rm webapp || true"
                                sh "sudo docker rmi webapp || true"
                                 // sh "sudo docker stop $(docker ps -aq)"
                                 // sh "sudo docker rm $(docker ps -aq)"
                                 // sh "sudo docker rmi $(docker images -q)"
                                 // sh "sudo docker stop webapp"
                                 // sh "sudo docker kill webapp"
                                 // sh "sudo docker rm webapp"
                                 // sh "sudo docker rmi webapp"
                                sh "sudo docker system prune -af"
                                 // sh "sudo docker build . --no-cache -t webapp:${BUILD_NUMBER} -f /nikhil/dockerfile"
                                 // sh "sudo docker build --no-cache -t webapp:${BUILD_NUMBER} ."
                                 // sh "sudo docker run --name webapp webapp:${BUILD_NUMBER}"
                                sh "sudo docker run -d --name webapp nikhilbamane/webapp:${BUILD_NUMBER}"
                                 // script {
                                 //         withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                                 //                 sh "sudo docker login -u nikhilbamane -p ${dockerhub}"
                                 //                 // sh "sudo docker push nikhilbamane/webapp:${BUILD_NUMBER}"
                                 //         }
                                 // }
                                sh "sudo docker logout"
                                
                        }
                }
        }
}
