FROM python:3.13-bookworm

ARG USER=user
ARG UID=1000
ARG GID=$UID

RUN groupmod -g $GID -n $USER node \
    && usermod -m -d /home/$USER -l $USER -g $USER node \
    && apt-get update \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /app \
    && chown $UID:$GID /app

WORKDIR /app

USER $USER

COPY --chown=$UID:$GID . ./

CMD [ "sleep", "infinity" ]
