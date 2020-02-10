FROM ubuntu

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev
    
RUN useradd -ms /bin/bash flaskuser
USER flaskuser

WORKDIR /home/flaskuser
COPY webapps/devops/ .
RUN pip install -r requirements.txt
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
