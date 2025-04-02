## Setting up JupyterLab for ISLP LABS

[STATISTICAL LEARNING IN PYTHON - BOOK](https://hastie.su.domains/ISLP/ISLP_website.pdf)

[STATISTICAL LEARNING IN PYTHON - LABS](https://github.com/intro-stat-learning/ISLP_labs/tree/v2)

This Docker Compose configuration allows you to quickly set up a JupyterLab environment using a Debian container running python. The configuration is designed to streamline the process of running JupyterLab and ensuring that your files are easily accessible on your local machine.

### Prerequisites

- Docker must be installed on your system. If not, you can download and install it from [Docker's official website](https://www.docker.com/get-started).

### Instructions

1. Clone or download this repository to your local machine.

2. Navigate to the directory containing the `docker-compose.yml` file.

3. Open a terminal and run the following commands to start the JupyterLab environment:

    ```bash
    docker-compose build
    ```
    ```bash
    docker-compose up
    ```

### Accessing JupyterLab

- Open your web browser and go to `http://localhost:8080`.

- You'll be directed to the JupyterLab interface where you can create, edit, and run Python notebooks.

- Any files created or modified in JupyterLab will be stored in the `workspace` folder on your local machine.

### Stopping the Environment

- To stop the JupyterLab environment, press `Ctrl + C` in the terminal where you started Docker Compose.

- Alternatively, you can run the following command in the same directory as the `docker-compose.yml` file:

    ```bash
    docker-compose down
    ```

By following these steps, you can easily set up and run JupyterLab with Python using this Docker Compose configuration. Enjoy coding and experimenting with your notebooks!
