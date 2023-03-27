# Postfix forwarding

Simple SMTP server, usefull for email traps/notice/apps email relay.

Image is based on *alpine:3.5* linux and the resulting size is around 60 MB.

## Generating docker image

To generate docker image execute from root directory:
```
docker build -t local/postfix-forwarding .
```

After that a new image should be available in your local docker repository as **local/mail**.

## Pulling image from docker hub
To pull the image from docker hub:

```
docker pull diegocortassa/postfix-forwarding
```

## Running a docker image

You need to provide few variables when creating a container:
* **MYHOSTNAME** - server's hostname - preferably FQDN one, example: awesome-server.somedomain.com
* **RELAY_DOMAINS** - domains we will relay
* **MYNETWORKS** - networks we will relay from

Whole command could like this:
```
docker run -d -p 25:25 -e MYHOSTNAME=awesome-server.somedomain.com -e "RELAY_DOMAINS=example.com,somedomain.com" -e "MYNETWORKS=192.168.1.0/24,192.168.1.0/24" --name relay diegocortassa/postfix-forwarding
```

## Credits
This docker image was forked from  [MartinPesek/Postfix-Forwarding](https://github.com/MartinPesek/Postfix-Forwarding) by Martin Pešek
