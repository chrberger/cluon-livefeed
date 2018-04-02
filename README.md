# cluon-livefeed

`cluon-livefeed` is a microservice for [libcluon](https://github.com/chrberger/libcluon)-based [OD4Sessions](https://github.com/chalmers-revere/opendlv) to display the currently exchanged messages in [`Envelope`](https://github.com/chrberger/libcluon/blob/master/libcluon/resources/cluonDataStructures.odvd#L23-L30) data format.

[![License](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://raw.githubusercontent.com/chrberger/libcluon/master/LICENSE) [![x86_64](https://img.shields.io/badge/platform-x86_64-blue.svg)](https://hub.docker.com/r/chrberger/cluon-livefeed-amd64/tags/) [![armhf](https://img.shields.io/badge/platform-armhf-blue.svg)](https://hub.docker.com/r/chrberger/cluon-livefeed-armhf/tags/) [![aarch64](https://img.shields.io/badge/platform-aarch64-blue.svg)](https://hub.docker.com/r/chrberger/cluon-livefeed-aarch64/tags/)  [![multi](https://img.shields.io/badge/platform-multi-blue.svg)](https://hub.docker.com/r/chrberger/cluon-livefeed-multi/tags/)

## Table of Contents
* [Features](#features)
* [Dependencies](#dependencies)
* [Usage](#usage)
* [License](#license)

## Features
* Written in highly portable and high quality C++14
* Data-driven display of any messages exchanged in [`Envelope`](https://github.com/chrberger/libcluon/blob/master/libcluon/resources/cluonDataStructures.odvd#L23-L30) data format from a running [OD4Sessions](https://github.com/chalmers-revere/opendlv) session
* Available as Docker images for [x86_64](https://hub.docker.com/r/chrberger/cluon-livefeed-amd64/tags/), [armhf](https://hub.docker.com/r/chrberger/cluon-livefeed-armhf/tags/), and [aarch64](https://hub.docker.com/r/chrberger/cluon-livefeed-aarch64/tags/)
* To simplify the usage for your platfrom, we also provide a  [multi](https://hub.docker.com/r/chrberger/cluon-livefeed-multi/tags/)-platform Docker image

## Dependencies
No dependencies! You just need a C++14-compliant compiler to compile this
project as it ships its dependencies as part of the source distribution:

* [libcluon](https://github.com/chrberger/libcluon) - [![License: GPLv3](https://img.shields.io/badge/license-GPL--3-blue.svg
)](https://www.gnu.org/licenses/gpl-3.0.txt)

## Usage
This microservice is created automatically on changes to this repository via Docker's public registry for:
* [x86_64](https://hub.docker.com/r/chrberger/cluon-livefeed-amd64/tags/)
* [armhf](https://hub.docker.com/r/chrberger/cluon-livefeed-armhf/tags/)
* [aarch64](https://hub.docker.com/r/chrberger/cluon-livefeed-aarch64/tags/)

This microservice is supposed to be used in parallel with a running [OD4Sessions](https://github.com/chalmers-revere/opendlv) with other microservices that exchange messages in [`Envelope`](https://github.com/chrberger/libcluon/blob/master/libcluon/resources/cluonDataStructures.odvd#L23-L30) data format. The purpose of this microservice to display the type and timestamps of the currently exchanged messages on console. It can be used as shown in the following:

```
docker run --rm -ti --init --net=host chrberger/cluon-livefeed-multi:v0.0.59 --cid=111
```

Additionally, you can supply a message specification in `.odvd`-file like, for example, the [OpenDLV Standard Message Set](https://github.com/chalmers-revere/opendlv.standard-message-set/blob/master/opendlv.odvd) to dynamically resolve the data types of the exchanged messages. In the following, it is assumed that you have the `.odvd`-file named `example.odvd` residing in the current working directory: 

```
docker run --rm -ti --init --net=host -v $PWD:/opt chrberger/cluon-livefeed-multi:v0.0.59 --cid=111 --odvd=/opt/example.odvd
```

You can watch the usage of this microservice here:

[![asciicast](https://asciinema.org/a/zT1Mr5aKUGx3k43ax8a9eapBb.png)](https://asciinema.org/a/zT1Mr5aKUGx3k43ax8a9eapBb?autoplay=1)

## License

* This project is released under the terms of the GNU GPLv3 License
