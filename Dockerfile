FROM ubuntu

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev
    
#RUN groupadd -r docker && \
#    useradd -r -g docker docker

#USER docker

RUN mkdir /app
COPY webapps/devops/ .
RUN pip install -r requirements.txt
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
