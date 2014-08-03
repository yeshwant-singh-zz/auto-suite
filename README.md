Automation Suite
------------------------------------
This is demo automation through cucumber 
I have automated few senarios of adding items to cart and verifying cart 
to run this you need following requirements:

- ruby 1.9.3
- bundle
- cucumber > 1.3.0
- selenium-webdriver 2.41.0

Rest all gems are mentioned in Gemfile . Just do 

    bundle install 

in parent folder it will install all the gems

To run this suite 

    bundle exec cucumber features/*.feature

For generating html report
    
    bundle exec cucumber features/*.feature --format html -o test_resport.html

Running taged scenarios 
    
    bundle exec cucumber features/*.feature --tags @tagged_senario --format html -o test_resport.html







