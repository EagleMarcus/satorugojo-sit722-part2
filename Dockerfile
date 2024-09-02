# Dockerfile for book_catalog microservice
# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY book_catalog/requirements.txt /app/requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the rest of the application code into the container
COPY book_catalog /app/

# Expose the port on which FastAPI will run
EXPOSE 5051

# Define the environment variable for the database URL
ENV DATABASE_URL=postgresql://dbassignment6sit722_user:RMM2WWMjtJY20rbHn8eVJuOJtHbK8n66@dpg-crat7ilds78s73d9rcm0-a.oregon-postgres.render.com/dbassignment6sit722

# Define the command to run the FastAPI application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5051"]