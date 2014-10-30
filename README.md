digitalocean-cli
================

A Command Line Interface tool for the [DigitalOcean](https://www.digitalocean.com/) API(v2)

# Precondition

Using the API requires an authentication token.
You can get this token via the web interface of DigitalOcean.

## Basic usage

First you have to log in via

```
digitalocean login <token>
```

once. This will store your authentication token locally.
You can always delete your local token by running

```
digitalocean logout
```

