FROM python:3.14-slim AS builder

RUN apt-get update && apt-get install -y git \
    && git clone --depth 1 https://github.com/adambard/learnxinyminutes-site.git app \
    && cd app \
    && git clone --depth 1 https://github.com/adambard/learnxinyminutes-docs.git source/docs \
    && pip install -r requirements.txt \
    && python build.py

FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html
