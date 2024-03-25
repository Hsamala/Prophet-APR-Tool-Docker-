FROM ubuntu:14.04

RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y

RUN apt-get install -y build-essential cmake gcovr zlib1g-dev libtinfo-dev python
RUN apt-get install -y libboost-filesystem-dev libboost-program-options-dev libboost-log-dev

RUN apt-get install wget

RUN wget https://ftp.gnu.org/gnu/gcc/gcc-4.8.0/gcc-4.8.0.tar.gz
RUN tar xvf gcc-4.8.0.tar.gz
RUN cd gcc-4.8.0
RUN apt-get install libgmp-dev libmpfr-dev libmpc-dev libc6-dev 
RUN apt-get update -y -qqq --fix-missing && apt-get install -y -qqq autoconf libtool > /dev/null
RUN ./gcc-4.8.0/configure --prefix=/app/gcc/4.8.0
RUN make
RUN make install

RUN mkdir prophet-test

ADD prophet /prophet-test/
ADD .gitignore /prophet-test/
ADD README.md  /prophet-test/
ADD LICENSE  /prophet-test/
ADD build_prophet.bash  /prophet-test/

