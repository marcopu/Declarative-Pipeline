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
			  bat 'cd C://Users//Administrator//Desktop//slaves & vagrant resume || vagrant up'
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
			 sh 'ssh root@192.168.110.50 mkdir /dockerfolder'
			 sh 'scp Dockerfile root@192.168.110.50:/dockerfolder'
			 sh 'scp -r target/*.war root@192.168.110.50:/dockerfolder'
			 sh 'ssh root@192.168.110.10 ansible-playbook /pipeline/playbooks/dockerplay.yml'
			} 
		 }
	}
}
