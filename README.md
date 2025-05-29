# Docker - K8sgpt
This repo helps user to use k8sgpt preinstalled on docker container for observability on k8s clusters 

To create a Dockerfile that includes k8sgpt, takes a Gemini API key as an environment variable, and accepts a kubeconfig file as a mounted parameter, and then executes a shell, you'll need a multi-stage build for efficiency and a clear entry point.

# To build
docker build -t k8sgpt-gemini .
# To Run
docker run -it --rm \
  -e K8SGPT_AI_GEMINI_API_KEY="YOUR_GEMINI_API_KEY_HERE" \
  -v /path/to/your/kubeconfig.yaml:/root/.kube/config:ro \
  k8sgpt-gemini
