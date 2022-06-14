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
    }
}