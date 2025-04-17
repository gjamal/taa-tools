# taa-tools
Web server exposing services for automation 

## Building
To build for GCP deployment (linux/amd64) from Mac M1:
```bash
docker buildx build --platform linux/amd64 -t flask-server .
``` 
docker image inspect flask-server

## Deploy to GCR
gcloud auth login

docker tag flask-server gcr.io/taa-toolkit2/flask-server:latest

docker push gcr.io/taa-toolkit2/flask-server:latest

gcloud run deploy flask-server --image gcr.io/taa-toolkit2/flask-server:latest --platform managed --region us-central1 --allow-unauthenticated --memory 512Mi --cpu 1

gcloud run deploy flask-server \
  --image gcr.io/taa-toolkit2/flask-server:latest \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated \
  --memory 512Mi \
  --cpu 1 \
  --min-instances 0 \
  --max-instances 10 \
  --concurrency 80 \
  --timeout 300 \
  --port 8080