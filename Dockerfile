FROM ubuntu:14.04

RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y

RUN apt-get install -y build-essential cmake gcovr zlib1g-dev libtinfo-dev python
RUN apt-get install -y libboost-filesystem-dev libboost-program-options-dev libboost-log-dev
RUN apt-get install -y vim 

RUN sudo apt install git-all

RUN apt-get install wget

RUN wget https://ftp.gnu.org/gnu/gcc/gcc-4.8.0/gcc-4.8.0.tar.gz
RUN tar xvf gcc-4.8.0.tar.gz
RUN apt-get install libgmp-dev libmpfr-dev libmpc-dev libc6-dev 
RUN apt-get update -y -qqq --fix-missing && apt-get install -y -qqq autoconf libtool > /dev/null
RUN ./gcc-4.8.0/configure --prefix=/app/gcc/4.8.0
RUN make
RUN make install


#ADD prophet /root/
#ADD .gitignore /root/
#ADD README.md  /root/
#ADD LICENSE  /root/
#ADD build_prophet.bash  /root/
#ADD my-build-prophet.bash /root/

