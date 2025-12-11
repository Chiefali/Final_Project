📄 Final Project: Reproducible HIV Report

This repository contains a fully reproducible workflow for generating an HIV analysis report using R Markdown inside a Docker container.

The project includes:

A Dockerfile to build a self-contained R environment

A Makefile to automate report generation

An R Markdown document (hiv_reportupdate.Rmd)

Automatic output saved in the report/ folder

This ensures that the report can be rendered identically on any machine.

🐳 Build the Docker Image

This project includes a Dockerfile that builds the complete environment needed to generate the report.

1. Ensure Docker Desktop Is Running

Before building:

Open Docker Desktop

(Optional) Log in to your Docker Hub account

Confirm that Docker Engine is running

2. Build the Docker Image

From the project directory:

cd Final_Project


Build the image:

docker build -t chiefali/final-project .


This command:

Reads the Dockerfile

Installs all required R packages and system dependencies

Copies the report files into the container

Creates a reproducible environment for rendering the report

Verify that the image was created:

docker images


You should see:

chiefali/final-project

🐳 Generate the Report (Recommended Method)

The project includes a Makefile that automates rendering.

To generate the HTML report:

make docker-run


What this does:

Cleans the local report/ directory

Runs the Docker container

Mounts the local report/ folder to /project/report inside the container

Renders hiv_reportupdate.Rmd

Saves the output to:

report/report.html


Open the file in your browser to view your fully rendered report.

🐳 Optional: Push the Image to Docker Hub

If you want to publish your image for others to use:

docker login
docker push chiefali/final-project

📁 Repository Structure
Final_Project/
├── Dockerfile
├── Makefile
├── hiv_reportupdate.Rmd
├── report/
│   └── (generated HTML output)
└── README.md

✅ Reproducibility Guarantee

Because the analysis runs inside a Docker container with pinned R dependencies, anyone can reproduce the report with:

make docker-run


regardless of operating system or local R setup.