FROM parity/parity:v1.8.0

# install all dependencies
RUN apt-get update \
	&& apt-get install --yes --no-install-recommends curl \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY keys/* /parity/keys/InstantSealChain/
COPY instant-seal-chain-spec.json /parity/instant-seal-chain-spec.json
COPY instant-seal-config.toml /parity/instant-seal-config.toml
COPY ./common_start.sh /common_start.sh
COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT [ "/start.sh" ]
