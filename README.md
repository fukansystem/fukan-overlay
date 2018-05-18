# fukan-overlay

Changes to this repository builds a new docker image
`asia.gcr.io/fukansystem3/runtime`, which is a runtime-only environment to run
the fukan system.

## Testing new changes locally

```shell
docker run -it --rm \
  -v $(pwd):/usr/local/fukan-overlay:ro \
  gentoo/stage3-amd64-nomultilib /bin/bash

mkdir -p /etc/portage/repos.conf
cat >> /etc/portage/repos.conf/fukan-overlay.conf <<EOM
[fukan-overlay]
auto-sync = no
location = /usr/local/fukan-overlay
EOM

# or fukan-overlay:default/linux/amd64 on multilib systems.
eselect profile set fukan-overlay:default/linux/amd64/no-multilib

emerge -pv --root=/build --root-deps=rdeps virtual/fukan
```
