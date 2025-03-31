FROM python:3.13-bookworm

ARG USER=user
ARG UID=1000
ARG GID=$UID

RUN groupadd --gid $GID $USER \
    && useradd --uid $UID --gid $GID -m $USER \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        bash-completion \
        sudo \
        vim \
    && rm -rf /var/lib/apt/lists/* \
    && echo $USER ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER \
    && mkdir /app \
    && chown $UID:$GID /app

WORKDIR /app

USER $USER

COPY --chown=$UID:$GID requirements.txt ./

RUN pip install -r requirements.txt

COPY --chown=$UID:$GID . ./

CMD [ "sleep", "infinity" ]
