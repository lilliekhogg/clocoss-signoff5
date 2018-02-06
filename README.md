# clocoss-signoff5

Script for executing signoff 5 for clocoss coursework by up718528.

# what does this script do?
1.update your sign-off task 1 to use preemptible instances
2.use at least 8 full-CPU VMs in your testing
3.check and be ready to report whether they all contributed to the work (this step need not be automated)
hint: look in the console, under Stackdriver Logging > Logs > Global > clocoss-master-worker when your clients are running
4.if you're interested, logging is implemented in the code in logging.js

# How To Use
To use the distributed worker app you will need to do the following tasks:

``` git clone https://github.com/lilliekhogg/clocoss-signoff1.git ```

``` cd clocoss-signoff5 ```

``` sh task5.sh [[numOfVms]] ```


# Extra Information
Dependancies may need to be applied first if they are not already installed on your vm:
- curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
- sudo apt-get install -y nodejs
- sudo apt-get install git
