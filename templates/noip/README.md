# Docker NO-IP DUC (Dynamic Update Client)

This is an UNOFFICIAL update client for NO-IP.com that is wrapped up in a Docker container. It (currently) can update a single hostname's IP address every 30 minutes.

## Using

To use, clone this repository and create an `.env` file with the following environment variables defined:

```
NOIP_USER=johndoe
NOIP_PASSWORD=p4ssword
NOIP_HOSTNAME=my-hostname.ddns.net
```

Then, within the root of the repository, run:

```
docker-compose build
docker-compose up -d
```

You can check if it's running with `docker ps` and can view its output with `docker-compose logs -f`.

## Contributing

This was a simple thing for me to do, but I know it can be much more configurable. I will update it from time to time, but I welcome pull requests!
