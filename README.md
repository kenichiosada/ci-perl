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

## Starting server  

  1. First, install dependencies.  

    carton install --cached

  2. Second, edit config.pl and specify which database to store test results to.  

   I set it to SQLite database called deployment.db for this example.  

  2. Then, 

    sh start_ukigumo.sh

   This will start Ukigumo server at http://localhost:2828 and we're ready to run some tests.  

## Setting up Ukigumo client on application  

Ukigumo server runs pre-defined command when its client is called.  
All you need to do is set up few files under application's root directory.  

Here is a [sample application](https://github.com/kenichiosada/ci-perl-sample-app). 
I set up Perl Dancer application for this test.  

  1. Set up .ukigumo.yml   

   This file contains task instructions for Ukigumo server. You can define tasks using several action hooks.  
   e.g. before_install, install, script  

  2. set up pre-commit hook  

   My goal for this example is to run tests with prove command whenver I commit any changes to local git repository.  
   To do this, I put simple shell script, 'pre-commit', under .git/hooks.  

  Note:  
  pre-commit hook needs to be disabled whenever I install new dependencies.  
  Otherwise, tests running on Ukigumo server complains that dependencies are missing.  

  Follwoing steps should resolved the issue.  

    cd application_root_dir
    rm .git/hooks/pre-commit
    carton install 
    caront bundle 
    git add .
    git commit -m 'update dependencies'
    cd .git/hooks
    ln -s ../../pre-commit pre-commit 


