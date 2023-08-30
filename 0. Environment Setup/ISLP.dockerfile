# Step 1: Start container using debian
FROM debian:stable-20230814-slim

# Step 2: Run apt commands
RUN apt update && \
    apt install -y python3.11 && \
    apt install -y python3.11-venv

# Step 3: Create the workspace directory
RUN mkdir -p /home/Documents/workspace

# Step 4: Set working directory
WORKDIR /home/Documents

# Step 5: Create and activate virtual environment
RUN python3 -m venv virtual_env
RUN /bin/bash -c "source virtual_env/bin/activate"

# Step 6: Install required packages
RUN /bin/bash -c "source virtual_env/bin/activate && pip install psutil jupyterlab"

# Step 7: Copy requirements file to container
COPY official_requirements.txt /home/Documents/

# Step 8: Install additional requirements
RUN /bin/bash -c "source virtual_env/bin/activate && pip install -r /home/Documents/official_requirements.txt"

# Step 9: Expose port
EXPOSE 8888

# Step 10: Set up Jupyter Lab command
CMD ["/bin/bash", "-c", "source virtual_env/bin/activate && jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token='' --notebook-dir=/home/Documents/workspace"]
