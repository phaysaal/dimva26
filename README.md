# DIMVA 2026 submission 35 - Artifact

````markdown
# DIMVA Artifact Docker Image

This archive contains a prebuilt Docker image for the DIMVA artifact environment.

---

## 1. Extract the Archive

If the file is compressed with `xz`:

```bash
unxz dimva_final.tar.xz
````

If the file is compressed with `gzip`:

```bash
gunzip dimva_final.tar.gz
```

After extraction, you should have:

```
dimva_final.tar
```

---

## 2. Load the Docker Image

Load the image into Docker:

```bash
docker load -i dimva_final.tar
```

Verify that the image is available:

```bash
docker images
```

---

## 3. Run the Container

Start the container interactively:

```bash
docker run -it --name dimva_work dimva:35-final /bin/bash
```

If `/bin/bash` is unavailable, use:

```bash
docker run -it --name dimva_work dimva:35-final /bin/sh
```

---

## 4. Inside the Container

Once inside the container:

* Navigate to the project directory.
* Follow the `README.md` file provided **inside the container** for detailed instructions.

**Important:**
Ignore any Docker image building instructions mentioned in the internal `README.md`, as the image has already been prebuilt.

---

## 5. Restarting the Container

To exit:

```bash
exit
```

To restart later:

```bash
docker start -ai dimva_work
```

To remove the container:

```bash
docker rm dimva_work
```

```
```
