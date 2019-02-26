# Boring Flask App

python version: 3.7.2

## How to use for newbie

Keep in mind that Flask tells 
"Do not use the development server in a production environment. Use a production WSGI server instead".

### Preparation

```bash
pip install -r requirements.txt
```

### Innocent run

```bash
python app.py
```

### The lesser of two evils

```bash
FLASK_HOST='0.0.0.0' FLASK_PORT=5001 python run.py
```
