FROM ubuntu:18.04
LABEL updated_on="2021-11-11 15:30"
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install python3 python3-setuptools python3-pip gunicorn3
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10
COPY flaskapp /flaskapp
WORKDIR /flaskapp
RUN pip3 install -r requirements.txt
EXPOSE 5000
RUN chmod +x startup.sh
ENTRYPOINT "./startup.sh"