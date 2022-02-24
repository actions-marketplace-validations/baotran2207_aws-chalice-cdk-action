FROM python3.10-nodejs17

LABEL version="0.1"
LABEL repository="https://github.com/baotran2207/aws-chalice-cdk-action"
LABEL homepage="https://github.com/baotran2207/aws-chalice-cdk-action"
LABEL maintainer="Bao Tran <tranthanhbao2207@gmail.com>"

COPY entrypoint.sh /entrypoint.sh


RUN npm install -g aws-cdk


RUN pip install --upgrade pip
RUN pip install chalice chalice[cdk]
RUN pip install -r requirements.txt
RUN cd infrastructure
RUN cdk bootstrap
RUN cdk deploy

ENTRYPOINT ["/entrypoint.sh"]