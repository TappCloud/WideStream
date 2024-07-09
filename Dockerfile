FROM jupyter/base-notebook:latest

USER root
RUN apt-get update && apt-get install -y mpv

USER $NB_UID
