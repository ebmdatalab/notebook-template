# Start from a core stack version
FROM jupyter/minimal-notebook:177037d09156

# Install from requirements.txt file
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt

# Expose the port 8888. This is one that you will "view" with your browser
EXPOSE 8888
