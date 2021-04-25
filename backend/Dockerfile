FROM python:3.6
WORKDIR /BackEnd
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
ENTRYPOINT [ "python3", "app.py" ]
