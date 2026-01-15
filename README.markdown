**The Docker version of [adambard/learnxinyminutes-site](https://github.com/adambard/learnxinyminutes-site) .**

### Changes

- Use Nginx to host HTMLs - the exposed port is `80` instead of the original `8000`

### Highlights

- OOTB experience
- `slim` image using [mintoolkit/mint](https://github.com/mintoolkit/mint) (50 MB on disk)
- Weekly update by GitHub workflow

### Usage

- `ghcr.io/purple4pur/learnx:latest` : original image based on `nginx:alpine`
- `ghcr.io/purple4pur/learnx:slim` : slimmed version from `latest`. All functions are expected to be OK.

Docker run:

```
docker run -it --rm -p 8000:80 ghcr.io/purple4pur/learnx:slim
```

Docker compose:

```
services:
  learnx:
    image: ghcr.io/purple4pur/learnx:slim
    container_name: "learnx"
    restart: unless-stopped
    port:
      - 8000:80
```

Then open [http://localhost:8000](http://localhost:8000) in your browser.

---

> Original README

## [LearnXInYMinutes.com](https://learnxinyminutes.com/)

This is the site behind the magic.

To build the site, first install Git and Python, then

```sh
git clone https://github.com/adambard/learnxinyminutes-site.git
cd learnxinyminutes-site
git clone https://github.com/adambard/learnxinyminutes-docs.git source/docs

pip install -r requirements.txt
python build.py
cd build/
python -m http.server
```

Then open [http://localhost:8000](http://localhost:8000) in your browser.

You need to check out the [learnxinyminutes-docs](https://github.com/adambard/learnxinyminutes-docs)
repo as `source/docs`. All the code that builds the site is in [build.py](./build.py)
