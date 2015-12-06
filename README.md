# gogs

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with gogs](#setup)
    * [What gogs affects](#what-gogs-affects)
    * [Beginning with gogs](#beginning-with-gogs)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Gogs (Go Git Service) is a painless self-hosted Git service. This module installs
and configures a Gogs docker.

## Module Description

## Setup

### What gogs affects

* Includes garethr's excellent docker module. This module will install docker if not present.

### Beginning with gogs

```puppet
class { '::gogs':
  data_dir => '/var/lib/gogs',
  domain => 'git.yourdomain.com',
  secret_key => 'xyz',
}
```

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
