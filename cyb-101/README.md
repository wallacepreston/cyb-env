# cyb-101

## Running the image in a container
```bash
docker run -it --rm --name codepath-cyb-101 -v $(pwd):/root codepath-cyb-101
```

## Updating the image
- Make your changes to the Dockerfile
- Change to this directory (not the root directory)
- Run the following command to rebuild the image, bypassing the cache:

```bash
docker build --no-cache -t codepath-cyb-101 .
```