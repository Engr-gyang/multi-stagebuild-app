# My App

This is a simple Node.js application built using Express. It demonstrates how to create a basic REST API with a single route (`/`) that returns a "Hello World!" message. The application is containerized using Docker with a multi-stage build process to optimize the final image.
multi-stagebuild-app
## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running Locally](#running-locally)
- [Running with Docker](#running-with-docker)
- [Project Structure](#project-structure)
- [Explanation of the Dockerfile](#explanation-of-the-dockerfile)

## Prerequisites

Before running this app locally or with Docker, ensure you have the following installed:

- **Node.js**: [Download Node.js](https://nodejs.org/en/)
- **Docker**: [Download Docker](https://www.docker.com/get-started)

## Installation

To get started with this app locally, follow these steps:

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/Engr-gyang/multi-stagebuild-app.git
    
cd multi-stagebuild-app
>>>>>>> 562d904 ( updated the  README.md)
    ```

2. Install the dependencies locally using npm:

    ```bash
    npm install
    ```

This will install the necessary packages defined in `package.json`.

## Running Locally

To run the app locally, use the following command:

```bash
npm start
This will start the server and you should see output similar to:

arduino

Server running at http://localhost:3000
You can then navigate to http://localhost:3000 in your web browser, and you should see "Hello World!" displayed.

Running with Docker
Build the Docker Image
Build the Docker image by running the following command in the project root directory (where the Dockerfile is located):

bash

docker build -t my-app .
This will create a Docker image named my-app.

Run the Docker Container
Run the Docker container with the following command:

bash

docker run -p 3000:3000 my-app
This will start the app in a Docker container and expose port 3000. 

This image is available on dockerhub. You can as well pull the image from dockerhub using the link below and run it locally on your machine, this way you don't have to write the dockerfoile. However it is good to try both 

https://hub.docker.com/repository/docker/engrgyang/multistagebuild/tags

Server running at http://localhost:3000
You can now visit http://localhost:3000 in your browser to see "Hello World!" displayed.

Project Structure
Here’s the structure of the project:

perl

my-app/
│
├── Dockerfile           # Dockerfile to build the container
├── package.json         # Node.js project metadata and dependencies
├── app.js               # Main application file
└── node_modules/        # Installed dependencies (created after npm install)

Explanation of the Dockerfile
This Dockerfile uses multi-stage builds to optimize the Docker image size. Here's how it works:

Build Stage (build-stage):

It starts from the node:16 image and sets the working directory inside the container to /app.
It copies the package.json and package-lock.json files and installs the dependencies with npm install.
After that, it copies the rest of the application code into the container.
Final Stage (final-stage):

It uses the smaller node:16-slim image to reduce the final image size.
It sets the working directory to /app and copies only the necessary files (like node_modules and app.js) from the build stage.
It exposes port 3000 for the app to be accessible.
Finally, it specifies the command to start the app: CMD ["node", "app.js"].
By using this multi-stage approach, we only copy the essential files into the final image, making it more efficient and smaller.

License
This project is licensed under the MIT License - see the LICENSE file for details.

markdown

### Explanation of Sections:
1. **Project Overview**: Provides a brief description of what the app does (a simple Express app with a `/` endpoint that returns "Hello World!").
2. **Installation**: Instructions for setting up the project locally by cloning the repo and running `npm install`.
3. **Running Locally**: How to run the app on your local machine using `npm start`.
4. **Running with Docker**: Provides instructions for building and running the app in a Docker container.
5. **Project Structure**: Lists the important files and directories in the project.
6. **Explanation of the Dockerfile**: Explains the two stages in the Dockerfile (build stage and final stage) and why multi-stage builds are used.
7. **License**: You can specify the license under which the project is distributed.

This `README.md` file provides a comprehensive guide for anyone to understand how to set up and run your app locally or with Docker.


