## Running continous integration server written in Perl  

Testing [Ukigumo](https://github.com/ukigumo) - CI server written in Perl.   

In this example, I am trying to do followings:  

  * Running Ukigumo server on local environment.  
  * Setting up local git repository with hook to run Ukigumo client.  
  * Running all tests whenever I try to commit any changes.   
  * Send test result with email.  

My test has been done with followings:  

  * Perl 5.18.2 (perlbrew)  
  * Carton 1.0.22  
  * SQLite 3.7.12  

