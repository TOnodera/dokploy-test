FROM python:3.13.2-bullseye

WORKDIR /app

RUN useradd -m -s /bin/bash -u 1000 runner

USER runner   

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "3000"]