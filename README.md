# dockerk8sgpt
This repo helps user to use k8sgpt preinstalled on docker container for observability on k8s clusters 

To create a Dockerfile that includes k8sgpt, takes a Gemini API key as an environment variable, and accepts a kubeconfig file as a mounted parameter, and then executes a shell, you'll need a multi-stage build for efficiency and a clear entry point.
