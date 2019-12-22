FROM python:3.7-alpine

RUN pip install --upgrade pip
RUN pip install flake8
RUN python --version ; pip --version ; echo "flake8 $(flake8 --version)" ; echo "===================="

CMD ["flake8", ".", "--count", "--select=E9,F63,F72,F82", "--show-source", "--statistics"]
