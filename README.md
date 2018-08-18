# Company News
--------------

*CompanyNews* is a new java based web application.  Before going online, Developers require a testing environment which is easy to reproduce and change.

## Testing Environment
*Description* : This automated test environment creates two different hosts with provisioned web servers ready to test the application.  

### Steps to produce the Environment
- Clone and Go to (cd) this repository
- Run 'vagrant up' (for first start)
- Run 'vagrant reload --provision' (for next starts: since service startups are not automated yet, next start up should mention provision)
- Run 'vagrant ssh dynapp' (to ssh into DynamicApp)
- Run 'vagrant ssh static' (to ssh into 'static' host)
- Run 'vagrant destroy -f' (to destroy existing setup)

#### Links for testing
- Dynamic Application available at : http://192.168.33.88:8080/companyNews
- Dynamic Application (secured) available at : https://192.168.33.88:8443/companyNews
- Dynamic Application local forwarding at : http://localhost:9090/companyNews
- Dynamic Application (secured) local forwarding at : https://localhost:9443/companyNews
- Static files are deployed at http://192.168.33.99:8080/static or localhost:7070/static

# Deploying App in Public Infrastructures
-----------------------------------------

Since persistence in our case is directly associated with file, object storage systems available in all public infrastructures can be used for this purpose.

## Heroku
Brief steps involved in deploying application
- Build heroku deployment file (Programming Lang specific)
- Integrate the app CVS (github etc)
- Commit the code and reload the apps instantly
- Increase the deployed instances as per requirement or dynamically through load

## Mesos (Sllr to Kubernetes)
Brief steps involved in deploying application
- Build docker file (Java, Tomcat, War File)
- Post the docker file to Marathon framework (web service)
- Indicate the instances as per requirment or dynamically through load

## Amazon Elastic Cloud
Brief steps involved in deploying application
- Choose region near to your clients
- Run the application servers in atleast three different avaiability zones in that region
- Integrate the application servers with Amazon Load Balancer
- Populate instances for taking load as per requirement

## Other Options
- Docker Swarm
- Amazon Lambda
- Cloud Foundry

# Scaling Issues
- The bottleneck in 'companyNews' App is the persistence layer.  To counter this distributed database like amazon dynamo can be used in place of object stores like amazon bucket
- We can avoid static application servers by deploying static content to CDN or through Amazon Edge like infrastructures.