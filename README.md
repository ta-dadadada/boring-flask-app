# Boring Flask App

python version: 3.6.8

## How to use for newbie

Keep in mind that Flask tells 
"Do not use the development server in a production environment. Use a production WSGI server instead".

### Preparation

```bash
pip install -r requirements.txt
```

### Innocent run

```bash
python run_local.py 
```

### The lesser of two evils

```bash
FLASK_HOST='0.0.0.0' FLASK_PORT=5001 python run_local.py
```

## Using Docker: simple http server by uwsgi http mode

### Image build

```bash
docker build -t boring-flask-app .
```

### Run

```bash
 docker run -p <your port>:8080 --rm boring-flask-app 
```

## Using docker-compose

### Image build

```bash
docker-compose build
```

### Up


```bash
docker-compose up
```
