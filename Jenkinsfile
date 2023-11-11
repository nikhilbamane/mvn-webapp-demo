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
                                        //sh "rm -rf *"
                                        //sh "git clone $url"
                                    //checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nikhilbamane/mvn-webapp-demo.git']])
                                    build "gitclone"

                            }

                }

                stage ("BUILD_PROJECT") {

                                steps {

                                            //sh "cd mvn-webapp-demo && mvn clean install -DskipTests=true"
                                        sh "cd mvn-webapp-demo && mvn clean install"

                                }

                }

                stage ("COPY") {

                            steps {
                                        build "copy"

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
                        //sh "docker stop webapp"
                        //sh "docker kill webapp"
                        //sh "docker rm webapp"
                        //sh "docker rmi webapp"
                        sh "sudo docker system prune -af"
                        //sh "sudo docker build . --no-cache -t webapp:${BUILD_NUMBER} -f /nikhil/dockerfile"
                        sh "sudo docker build --no-cache -t webapp:${BUILD_NUMBER} ."
                        //sh "sudo docker run --name webapp webapp:${BUILD_NUMBER}"
                            script {
                            withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                                sh "docker login -u nikhilbamane -p ${dockerhub}"
                                sh "docker push nikhilbamane/webapp:${BUILD_NUMBER}"
                            }
                        }
                    }
                }



        }

}
