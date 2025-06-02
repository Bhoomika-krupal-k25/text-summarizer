# Use official Python slim image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Download spacy model & nltk resources inside container
RUN python -m spacy download en_core_web_sm
RUN python -m nltk.downloader wordnet

# Copy app code
COPY . .

# Expose streamlit default port
EXPOSE 8501

# Run streamlit app
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
