FROM python:3.6
WORKDIR /backend
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
EXPOSE 5001
ENTRYPOINT [ "python3", "app.py" ]
