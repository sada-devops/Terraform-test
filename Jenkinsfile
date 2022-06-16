pipeline{
    agent any

    environment{
        PATH = "/opt/maven3/bin:$PATH"
    }
    stages{
        stage("Git Checkout"){
            steps{
                git credentialsId: '2224536f-e71f-463c-a2fc-24de91e656a9', url: 'https://github.com/srinivas1987devops/myweb.git'
            }
        }
        stage("Maven Build"){
            steps{
                sh "mvn clean package"
                sh "mv target/*.war target/myweb.war"
            }
        }
        stage("deploy-dev"){
            steps{
                sshagent(['tomcat-new']) {
                sh """
                    scp -o StrictHostKeyChecking=no target/myweb.war  ec2-user@43.204.38.18:/home/ec2-user/apache-tomcat-9.0.46/webapps/

                    ssh ec2-user@43.204.38.18 /home/ec2-user/apache-tomcat-9.0.46/bin/shutdown.sh

                    ssh ec2-user@43.204.38.18 /home/ec2-user/apache-tomcat-9.0.46/bin/startup.sh

                """
            }

            }
        }
    }
}