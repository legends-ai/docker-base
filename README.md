# Docker Base

Base Docker image for Asuna projects.

Requires the path of a plaintext file to be passed in as a build arg with the following format:
```
[Azure Service Principal ID]
[Azure Service Princial Password]
```

This service principal should have the `acrPush` role. It's used to give Jenkins agents the ability to push images to the Azure Container Registry.
