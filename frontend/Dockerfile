FROM python:3.6
WORKDIR /FrontEnd
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
EXPOSE 5000
ENTRYPOINT [ "python3", "app.py" ]