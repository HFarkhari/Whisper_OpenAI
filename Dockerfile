FROM python:3.10-slim-buster

# Set the working directory
WORKDIR /workspace

# Copy the required files
COPY MohsenYeganeh.mp3 Whisper_OpenAI_example.ipynb requirements.txt /workspace/

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    ffmpeg && \
    rm -rf /var/lib/apt/lists/*


# Install Python dependencies
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir -U openai-whisper \
    && pip install --no-cache-dir setuptools-rust notebook \
    && pip install --upgrade --no-deps --force-reinstall \
    git+https://github.com/openai/whisper.git \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /root/.cache/pip/* /workspace/requirements.txt

# Clear cache and temporary files
RUN apt-get remove -y git && \
    apt-get autoremove -y && \
    apt-get clean && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8888

# Default command to start the container
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

