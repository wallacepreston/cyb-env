# cyb-101

## Resources - CyberSecurity 101
- Project Repo: https://github.com/wallacepreston/cyb-101
- Environment Link: https://idx.google.com/import?url=https://github.com/wallacepreston/cyb-101
- Docker Hub Image: prestonwallace/codepath:cyb-101


To create this button

<a href="https://idx.google.com/import?url=https%3A%2F%2Fgithub.com%2Fwallacepreston%2Fcyb-101">
  <picture>
    <source
      media="(prefers-color-scheme: dark)"
      srcset="https://cdn.idx.dev/btn/open_dark_32.svg">
    <source
      media="(prefers-color-scheme: light)"
      srcset="https://cdn.idx.dev/btn/open_light_32.svg">
    <img
      height="32"
      alt="Open in IDX"
      src="https://cdn.idx.dev/btn/open_purple_32.svg">
  </picture>
</a>

Use the following code.  Or you can just use the above "Environment Link" instead of the button.

```html
<a href="https://idx.google.com/import?url=https%3A%2F%2Fgithub.com%2Fwallacepreston%2Fcyb-101">
  <picture>
    <source
      media="(prefers-color-scheme: dark)"
      srcset="https://cdn.idx.dev/btn/open_dark_32.svg">
    <source
      media="(prefers-color-scheme: light)"
      srcset="https://cdn.idx.dev/btn/open_light_32.svg">
    <img
      height="32"
      alt="Open in IDX"
      src="https://cdn.idx.dev/btn/open_purple_32.svg">
  </picture>
</a>
```


## Updating the image
- Make your changes to the Dockerfile
- Change to the src directory within this project (not the root directory)

## Local Testing
### Building the image
- Run the following command to rebuild the image:
```bash
docker build -t codepath-cyb-101 .
```

### Running the image in a container locally
To test the image before pushing, you can test it locally. Run the image in a container in interactive mode, setting up a volume to share the current directory on the host with the container at `/home/codepath/code`.
```bash
docker run -it --rm --name codepath-cyb-101 -v $(pwd):/home/codepath/code codepath-cyb-101
```

## Prod Deployment
### Building the image specifically for the amd64 architecture of the host
```bash
docker build --platform linux/amd64 -t prestonwallace/codepath:cyb-101 .
```

### Pushing the image to Docker Hub
- Log in to Docker Hub
```bash
docker login
```

- Push the image to Docker Hub:
```bash
docker push prestonwallace/codepath:cyb-101
```

### Pulling and running the image from Docker Hub
On the host (i.e. google idx), pull and run the image from Docker Hub
```bash
docker run -it --rm --platform linux/amd64 --name codepath-cyb-101 -v $(pwd):/home/codepath/code -p 22:22 -p 3389:3389 prestonwallace/codepath:cyb-101
```

## Testing
Once the image is running on the host, 
- Download the private key
- SSH into the container
```bash
ssh -i ubuntu_key.pem codepath@<container-ip>
```