# fukan-overlay

Changes to this repository builds a new docker image
`asia.gcr.io/fukansystem3/runtime`, which is a runtime-only environment to run
the fukan system.

## Testing new changes locally

```shell
# or use asia.gcr.io/fukansystem3/runtime image.
docker run -it --rm \
  -v $(pwd):/usr/local/fukan-overlay \
  gentoo/stage3-amd64-nomultilib /bin/bash
```

Once a shell opened, run the following commands to verify local changes.

```shell
# Configure portage to use the local overlay.
mkdir -p /etc/portage/repos.conf
cat >> /etc/portage/repos.conf/fukan-overlay.conf <<EOM
[fukan-overlay]
auto-sync = no
location = /usr/local/fukan-overlay
EOM

# or fukan-overlay:default/linux/amd64 on multilib systems.
eselect profile set fukan-overlay:default/linux/amd64/no-multilib

# or emerge --sync
emerge-webrsync

# Verify build-time dependencies.
emerge --buildpkg --quiet --with-bdeps=y --onlydeps virtual/fukan

# Verify runtime dependencies.
emerge --usepkg --quiet --root=/build --root-deps=rdeps virtual/fukan
```
