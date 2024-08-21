# Use the official PostgreSQL image
FROM postgres:latest

# Set environment variables for the PostgreSQL instance
ENV POSTGRES_DB=postgres
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=test

# Copy the AdventureWorks folder and its contents into the container
COPY ./000_initdb.sql /docker-entrypoint-initdb.d/000_initdb.sql
COPY ./001_adventureworks_schema.sql /docker-entrypoint-initdb.d/001_adventureworks_schema.sql
COPY ./002_adventureworks_data.sql /docker-entrypoint-initdb.d/002_adventureworks_data.sql
COPY ./003_chinook.sql /docker-entrypoint-initdb.d/003_chinook.sql
COPY ./004_ssakila_schema.sql /docker-entrypoint-initdb.d/004_ssakila_schema.sql
COPY ./005_ssakila_data.sql /docker-entrypoint-initdb.d/005_ssakila_data.sql

# Initialize the Adventureworks, Chinook, and Sakila databases
RUN echo "Initializing databases..."