# fukan-overlay

Changes to this repository builds a new docker image
(`asia.gcr.io/fukansystem3/builder`), which contains the copy of the repository,
up-to-date copy of the portage tree, and all of the dependencies to build
the fukan system.

## Adding the overlay to the system

```shell
git clone https://github.com/fukansystem/fukan-overlay.git \
  /usr/local/fukan-overlay

mkdir -p /etc/portage/repos.conf
cat >> /etc/portage/repos.conf/fukan-overlay.conf <<EOM
[fukan-overlay]
auto-sync = no
location = /usr/local/fukan-overlay
EOM

# or fukan-overlay:default/linux/amd64/no-multilib on no-multilib systems.
eselect profile set fukan-overlay:default/linux/amd64
```

## Testing new changes locally

```shell
docker run -it --rm \
  -v $(pwd):/usr/local/fukan-overlay:ro \
  asia.gcr.io/fukansystem3/builder /bin/bash

emerge -pv --root=/build --root-deps=rdeps virtual/fukan
```
