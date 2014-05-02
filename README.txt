This is demo suit of limeroad automation through cucumber 
I have automated few senarios of adding items to cart and verifying cart 
to run this you need following requirements:

ruby 1.9.3
bundle

Rest all gems are mentioned in Gemfile . Just do 
bundle install 
it will install all the gems

To run this suite 
bundle exec cucumber features/*.feature

or
#For generating html report
bundle exec cucumber features/*.feature --format html -o test_resport.html

or
#Running taged scenarios 
bundle exec cucumber features/*.feature --tags @tagged_senario --format html -o test_resport.html







