#!/bin/bash
docker build -t reactapp .
docker-compose down || true
docker-compose up -d
