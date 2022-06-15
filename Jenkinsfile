pipeline {
    stages{
        stage('build'){
            
        }
        stage('test'){
            
        }
        stage('deploy'){
            when{
                expression{
                    currentBuild.result == null ||currentBuild.result == "SUCCESS"
                }
            }
            steps{
                
            }
        }

        post{
            always{
                mail to: "dmitri20023zarubo@gmail.com",
                    subject: "STATUS FOR PROJECT: ${currentBuild.FullDisplayName}",
                    body: "RESULT: ${currentBuild.result}"
            }
        }
    }
}