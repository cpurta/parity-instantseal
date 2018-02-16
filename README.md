# parity-instantseal

This holds the files needed to create a dockerized parity client with multiple funded
and unlocked accounts. It uses the InstantSeal consensus engine, which allows for transactions
to be immediately mined and sealed so that testing can be sped up.

By default there are 10 accounts unlocked with more than enough ether to do any testing. The
default block gas limit is `6.5e6` which is pretty standard for the testing network. If you need
more you can adjust that in the `instant-seal-config.toml` file and rebuild your image.

## Building the image

To build the image you can use docker build:

```
$ docker build -f Dockerfile -t parity-instantseal:latest .
```

## Running the image

You can run the client by using `docker run`:

```
$ docker run -it -p 8545:8545 parity-instantseal:latest
```

Once the container is up and running you can run any tests or send any transactions to
the running node and they will be instantly mined and verified.

# LICENSE

MIT
