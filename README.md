### About

A collection of the different vagrant templates for personal usage.
[Vagrant](https://www.vagrantup.com/about.html) can be installed from [here](https://www.vagrantup.com/downloads.html).

### Vagrant notes

* In case of problmes with the **rsync** utility on Windows
    - 1st posible solution add following directory "..\Vagrant\embedded\usr\bin\" to the PATH variable
    - 2nd possible solution - Change "Vagrantfile" directly before installation here "c:\Users\<USER>\.vagrant.d\boxes\centos-VAGRANTSLASH-7\" (more here https://github.com/hashicorp/vagrant/issues/6696)
        + ```#config.vm.synced_folder ".", "/vagrant", type: "rsync"```
* Connect to Your Vagrant Virtual Machine with PuTTY via Private Key
    - [Connect to Your Vagrant Virtual Machine with PuTTY](https://github.com/Varying-Vagrant-Vagrants/VVV/wiki/Connect-to-Your-Vagrant-Virtual-Machine-with-PuTTY)
        + NOTE: Just convert given private key into PuTTY format by skiping step 4

### Collection of templates

* [AnacondaVM](AnacondaVM)
* [LAMP](LAMP)
* [PredictionIO](PredictionIO)
    - [PredictionIO installation guide](https://docs.prediction.io/install/)
    - [Quick Start with Recommendation Engine Template](https://docs.prediction.io/templates/recommendation/quickstart/)
* [Seldon](Seldon)
    - [Installing the Seldon Virtual Machine](http://docs.seldon.io/vm.html)
    - [Issue with synced folder](https://github.com/wckr/wocker/issues/14)
        ```
        vagrant plugin install vagrant-winnfsd
        ```
* [BerkleyBigDataSparkMOOCs](BerkleyBigDataSparkMOOCs)
    - [Information for setting up for the Spark MOOC](https://github.com/spark-mooc/mooc-setup/)
* [Hortonworks Data Platform](HDP)
    - An starting vagrant file that helps in installing Hadoop to the virtual environment. For more details check README file.
* [FlinkVM](FlinkVM)
* [H2O](H2O)
    - [H2O Vagrant Development Environment](https://github.com/h2oai/h2o-3/tree/master/vagrant)
    - [Using Vagrant to scale data science projects with Google Cloud Compute](http://blog.nguyenvq.com/blog/2016/03/07/using-vagrant-to-scale-data-science-projects-with-google-cloud-compute/)
    - [How-to: Train Models in R and Python using Apache Spark MLlib and H2O](https://blog.cloudera.com/blog/2016/01/how-to-train-models-in-r-and-python-using-apache-spark-mllib-and-h2o/)
* [KafkaCluster](KafkaCluster)
    - Mostly based on the following repository - https://github.com/eucuepo/vagrant-kafka
    - Changes
        + Download RPM packed of the JDF manually and place into "rpm" folder (from time to time automated download is not working in provision)
* [PentahoCE](PentahoCE)
    - Mostly based on the following repository - https://github.com/lricardo/vagrant-pentaho-biserver-5
    - Changes:
        + Put downloads into folder (/vagrant/downloads/)
* [NiFi](NiFi)
    - Based on the following repository - https://github.com/minyk/nifi-sandbox
* [ApamaCE](ApamaCE)
    - Semi-automated installation of Apama Community Edition together with some initial scripts

