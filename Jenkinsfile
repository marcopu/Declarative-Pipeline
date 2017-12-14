pipeline{
	
	agent any
	
	/*triggers {
                pollSCM '* * * * *'
	}*/
	 
	stages{
		
		
		stage("Starting slaves..."){
			agent{node 'winslave'}
			steps{
			//Transfer set
			//sh 'scp -r /var/lib/jenkins/jobs/DeclarativePipeline/workspace/** root@192.168.90.10:/home'
			  bat 'cd C:/Users/Administrator/Desktop/slaves & vagrant up'
			//sh 'scp -r ** root@192.168.110.10:/pipeline'
			//sh 'ssh root@192.168.110.10 ansible-playbook /pipeline/playbooks/unit.yml'
			} 
		}
		
			
		stage("Build archive"){
			steps{
			 sh 'mvn clean -DskipTests'
			 sh 'mvn compile -DskipTests'
			 sh 'mvn package -DskipTests'
			}
			
			/*post {
   			 success {
      		            archive "**"
   			 }
		        }*/
		 }
		
		stage("Unit test"){
			steps{
			//Transfer set
			//sh 'scp -r /var/lib/jenkins/jobs/DeclarativePipeline/workspace/** root@192.168.90.10:/home'
			sh 'ssh root@192.168.110.10 mkdir -p /pipeline'
			sh 'scp -r ** root@192.168.110.10:/pipeline'
			sh 'ssh root@192.168.110.10 ansible-playbook /pipeline/playbooks/unit.yml'
			} 
			
		 }
		
		
		stage("Development"){
			steps{
			 sh 'ssh root@192.168.110.10 ansible-playbook /pipeline/playbooks/starttomcat.yml'
			 sh 'ssh root@192.168.110.30 rm -f /opt/tomcat/webapps/*.war'
			 sh 'scp -r target/*.war root@192.168.110.30:/opt/tomcat/webapps'
			} 
		 }
		
		
		stage("Functional test: building environment"){
			steps{
			 sh 'ssh root@192.168.110.50 mkdir -p /dockerfolder'
			 sh 'scp Dockerfile root@192.168.110.50:/dockerfolder'
			 sh 'scp -r target/*.war root@192.168.110.50:/dockerfolder'
			 sh 'ssh root@192.168.110.10 ansible-playbook /pipeline/playbooks/dockerplay.yml'
			} 
		 }
		
		stage("Functional test: running test"){
			steps{
			 sh 'ssh root@192.168.110.40 mkdir -p /pipeline'
			 sh 'scp -r ** root@192.168.110.40:/pipeline'
			 sh 'ssh root@192.168.110.10 ansible-playbook /pipeline/playbooks/functional.yml'
			}
			
			post{
        		   always {
            			echo 'Deleting workspace. . .'
    				  deleteDir()
				
    				 echo 'Cleaning. . .'
				  sh 'ssh root@192.168.110.10 ansible-playbook /pipeline/playbooks/dockerclean.yml'
    				  sh 'ssh root@192.168.110.10 rm -r /pipeline'
				  sh 'ssh root@192.168.110.40 rm -r /pipeline'
				  sh 'ssh root@192.168.110.50 rm -r /dockerfolder'
				   }
			
        		   success {
            			echo 'GAME OVER!'
        		       }
			 }
		}
		
		stage("Suspending..."){
			agent{node 'winslave'}
			steps{
			   bat 'cd C:/Users/Administrator/Desktop/slaves'
			 //bat 'cd C:/Users/Administrator/Desktop/slaves & vagrant suspend'
			}
			
			post{
        		   always {
            			echo 'Deleting workspace on the agent. . .'
    				  deleteDir()
			   }
			}
		}
	}
}
