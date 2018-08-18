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
- Dynamic Application (secured) available at : htts://192.168.33.88:8443/companyNews
- Dynamic Application local forwarding at : http://localhost:9090/companyNews
- Dynamic Application (secured) local forwarding at : https://localhost:9443/companyNews
- Static files are deployed at http://192.168.33.99:8080/static or localhost:7070/static
