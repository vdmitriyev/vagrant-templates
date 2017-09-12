#!/bin/bash

echo "Starting with provision of the virtual machine ..."

# Software installation
sudo su
echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" > /etc/apt/sources.list.d/r.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
# sudo apt-get update 
# sudo apt-get -y install heirloom-mailx # setup mail

# R
function installR(){
	echo "Installing R"
	sudo apt-get -y install r-base-dev libcurl4-openssl-dev libssl-dev git
}

# installR

function installMRO(){

	mro=MRO-3.2.3-Ubuntu-14.4.x86_64.deb
	if [ ! -f "$mro" ]; then
		echo "Downloading installer of $mr. This may take more than a few minutes..."
		wget -q -o /dev/null - https://mran.revolutionanalytics.com/install/mro/3.2.3/MRO-3.2.3-Ubuntu-14.4.x86_64.deb
	else
		echo "mro is already downloaded."
	fi
	
	sudo dpkg -i MRO-3.2.3-Ubuntu-14.4.x86_64.deb
}  
				
function installRevoMath(){

	revomath=RevoMath-3.2.3.tar.gz

	if [ ! -f "$revomath" ]; then
		echo "Downloading installer of $revomath. This may take more than a few minutes..."
		wget -q -o /dev/null - https://mran.revolutionanalytics.com/install/mro/3.2.3/RevoMath-3.2.3.tar.gz
	else
		echo "revomath is already downloaded."
	fi

	tar -xzf RevoMath-3.2.3.tar.gz
	cd RevoMath
	sudo ./RevoMath.sh # choose option 1, then agree
	cd ..
	rm -rf RevoMath
	sudo R --vanilla <<EOF
install.packages(c("data.table","readr","randomForest","gbm","glmnet","ROCR","devtools"), repos="http://cran.rstudio.com")
# options(unzip = 'internal') # vinh https://github.com/RevolutionAnalytics/RRO/issues/37
# devtools::install_github("dmlc/xgboost", subdir = "R-package")
install.packages("drat", repos="https://cran.rstudio.com") # https://github.com/dmlc/xgboost/issues/776
drat:::addRepo("dmlc")
install.packages("xgboost", repos="http://dmlc.ml/drat/", type="source")
EOF
}

function installAnaconda(){
	# Python and Anaconda
	echo "Installing Anaconda2"

	echo "Trying to install Anaconda"
	anaconda=Anaconda-2.2.0-Linux-x86_64.sh

	if [ ! -f "$anaconda" ]; then
		echo "Downloading Anaconda installer. This may take more than a few minutes."
		wget -q -o /dev/null - http://repo.continuum.io/archive/Anaconda-2.2.0-Linux-x86_64.sh
	else
		echo "Anaconda is already downloaded."
	fi

	if [ -f "$anaconda" ];  then
		if [ ! -d "/opt/anaconda/" ]; then
			chmod +x "$anaconda"
			./"$anaconda" -b -p /opt/anaconda
			
			# for anaconda
			PATH=/opt/anaconda/bin:$PATH
			echo "Anaconda was installed."
			
			echo "PATH=/opt/anaconda/bin:\$PATH" >> /home/vagrant/.bashrc
			echo "PATH was set in .bashrc"
			conda create --name analysis python=2
		else
			# for anaconda
			PATH=/opt/anaconda/bin:$PATH
			echo "Anaconda is already installed"
		fi
	else
		echo "ERROR: Anaconda installer is not found"
	fi
# scroll and yes
}

installAnaconda

# VW
# sudo sudo apt-get -y install libtool libboost1.55-*

# Java
echo "Installing Java"
# sudo add-apt-repository ppa:webupd8team/java
# sudo sudo apt-get update
# sudo sudo apt-get -y install oracle-java7-installer

function installH2O(){
	# H2O
	# http://www.h2o.ai/download/h2o/r
	echo "Installing H20"
	sudo R --vanilla <<EOF
	# The following two commands remove any previously installed H2O packages for R.
	if ("package:h2o" %in% search()) { detach("package:h2o", unload=TRUE) }
	if ("h2o" %in% rownames(installed.packages())) { remove.packages("h2o") }

	# Next, we download packages that H2O depends on.
	pkgs <- c("methods","statmod","stats","graphics","RCurl","cd jsonlite","tools","utils")
	for (pkg in pkgs) {
		if (! (pkg %in% rownames(installed.packages()))) { install.packages(pkg, repos='http://cran.rstudio.com/') }
	}

	# Now we download, install and initialize the H2O package for R.
	install.packages("h2o", type="source", repos=(c("http://h2o-release.s3.amazonaws.com/h2o/rel-tukey/6/R")))
	library(h2o)
EOF
}

# installH2O

echo "Finishing with provision of the virtual machine ..."