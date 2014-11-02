digitalocean-cli
================

A Command Line Interface tool for the [DigitalOcean](https://www.digitalocean.com/) API(v2)

# Precondition

Using the API requires an authentication token.
You can get this token via the web interface of DigitalOcean.

## Getting help

You can always get help for general usage or specific commands

```
digitalocean help <command>
```

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

## Droplet management

Create a droplet named name using a cloud-config file
for customization

```
digitalocean droplet create <name> <cloud-config.yaml>
```

List all droplets

```
digitalocean droplet list
```

Destroy the droplet via name

```
digitalocean droplet destroy <name>
```

For further help please investigate all available
commands using their descriptive help.
