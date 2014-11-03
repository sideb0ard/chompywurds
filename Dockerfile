FROM debian:wheezy
MAINTAINER Thor Sideburns

ADD chompywurds.py /var/server/chompywurds/chompywurds.py
ADD MBSP /var/server/chompywurds/MBSP

RUN apt-get update && apt-get -y install python-virtualenv
RUN rm /bin/sh && ln -s /bin/bash /bin/sh 
RUN cd /var/server/chompywurds && virtualenv env && source env/bin/activate && pip install flask && cd MBSP && python ./setup.py 

EXPOSE 5000
CMD cd /var/server/chompywurds && source env/bin/activate  && python ./chompywurds.py



