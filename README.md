# clocoss-signoff5

Script for executing signoff 5 for clocoss coursework by up718528.

# what does this script do?
1. updated sign-off task 1 to use preemptible instances
2. runs at least 8 full-CPU VMs when testing

# How To Use
To use the distributed worker app you will need to do the following tasks:

``` git clone https://github.com/lilliekhogg/clocoss-signoff5.git ```

``` cd clocoss-signoff5 ```

``` sh task5.sh [[numOfVms]] ```


# Extra Information
Dependancies may need to be applied first if they are not already installed on your vm:
- curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
- sudo apt-get install -y nodejs
- sudo apt-get install git
