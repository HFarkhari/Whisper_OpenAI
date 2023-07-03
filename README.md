# Whisper Model Example

This repository demonstrates the usage of the Whisper model created by OpenAI. It showcases the transcription and translation of a Persian song using the large-v2 model. The transcription and translation process can be run offline on a GPU using the provided Docker image.

## Docker Image

The Docker image for this project is available at the following link: [hfarkhari/whisper_openai_speech2text](https://hub.docker.com/r/hfarkhari/whisper_openai_speech2text). The image includes the large-v2 model and is designed to work offline on a GPU. Please note that a GPU with a minimum of 10 GB VRAM is required. If your GPU has less than 10 GB VRAM, you can modify the code to utilize other models such as tiny, small, or medium.

## Usage

To use the Docker container, run the following command:

```bash
docker run --gpus all -p 8888:8888 -it --rm hfarkhari/whisper_openai_speech2text:large-v2
```

Please note that the password for the Docker container is set to "123". After running the container, access the Jupyter Notebook by opening your web browser and using either "localhost:8888" or "127.0.0.1:8888".

Feel free to explore and modify the code to adapt it to your specific needs.

## Additional Resources

For more information about the Whisper model, you can refer to the following links:

- [OpenAI Research - Whisper](https://openai.com/research/whisper)
- [Whisper GitHub Repository](https://github.com/openai/whisper)

You can also use the provided Dockerfile to create your own Docker image based on this project. The container includes Jupyter Notebook, providing you with a convenient environment for experimentation and development.

## License

This repository is licensed under the [MIT License](LICENSE).
