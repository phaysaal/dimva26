# DIMVA 2026 submission 35 - Artifact

```markdown
# DIMVA Artifact Docker Image

This archive contains a prebuilt Docker image for the DIMVA artifact environment.

The image is compressed using **zstd** and provided as:

```

dimva_final.tar.zst

````

---

## 1. Decompress the Archive

To extract the Docker image tar file:

```bash
unzstd dimva_final.tar.zst
````

This will produce:

```
dimva_final.tar
```

---

## 2. Load the Docker Image

Load the image into Docker:

```bash
docker load -i dimva_final.tar
```

Verify that the image was loaded successfully:

```bash
docker images
```

---

## 3. Run the Container

Start an interactive container:

```bash
docker run -it --name dimva_work dimva:35-final /bin/bash
```

If `/bin/bash` is unavailable, try:

```bash
docker run -it --name dimva_work dimva:35-final /bin/sh
```

---

## 4. Inside the Container

Once inside the container:

* Navigate to the main project directory.
* Follow the `README.md` file provided **inside the container** for detailed instructions on running the artifact.

**Important:**
Ignore any Docker image building instructions mentioned in the internal `README.md`, as the image has already been prebuilt.

---

## 5. Restarting or Removing the Container

To exit the container:

```bash
exit
```

To restart it later:

```bash
docker start -ai dimva_work
```

To remove the container:

```bash
docker rm dimva_work
```

```
```
