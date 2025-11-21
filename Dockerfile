# Dockerfile

# Your existing Dockerfile content up to line 4...

RUN apt-get update && apt-get install -y git make gcc g++ wget && rm -rf /var/lib/apt/lists/*

# Your existing Dockerfile content after line 4...