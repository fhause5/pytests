FROM python:3.8-alpine

# Set working directory.
RUN mkdir /app/
WORKDIR /app/

# Copy app files.
COPY . /app/

# Install app dependencies.
RUN pip install -r requirements.txt

# Run tests
CMD pytest -n=4 --alluredir=./allure-results tests/test_dog_api.py
