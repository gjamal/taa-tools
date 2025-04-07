## Docker build

### build a Docker image tagged “myapp:latest”
sudo docker build -t myapp:latest .

### run docker image created
sudo docker run -p 9090:90 -t myapp:latest

