FROM ubuntu

RUN apt-get update
RUN apt-get update -y && \
    apt-get install -y python-pip python-dev
    
RUN groupadd -r docker && \
    useradd -r -g docker docker

USER docker

RUN mkdir /app
WORKDIR /app
COPY ./ ./
RUN pip install -r requirements.txt
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
