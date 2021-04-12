
sudo apt-get update
sudo apt-get install -yq build-essential python-pip rsync
pip install flask

cat > /tmp/app.py <<EOT
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_cloud():
   return 'Hello Cloud!'

app.run(host='0.0.0.0')
EOT
python /tmp/app.py
