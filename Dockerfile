FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
COPY scripts ./scripts

# RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

# CMD ["watchmedo", "shell-command --patterns='*.py;*.txt' --recursive --command='python bat/bat.py' ."]
CMD ["python3", "bat/bat.py"]
