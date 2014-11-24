# fukan-overlay

## Usage

### Default: Using layman

Add <code>http://github.com/fukansystem/fukan-overlay/raw/master/repository.xml</code> to <code>overlays</code> at <code>/etc/layman/layman.cfg</code> and then

```shell
$ layman -S
$ layman -a fukan-overlay
```

To sync up the repository, run `layman -S` (sync all layman overlays) or `layman -s fukan-overlay` (sync fukan-overlay only).

### Alternative: Manual Configuration

Clone fukan-overlay repository somewhere and add <code>PORTDIR_OVERLAY="PATH_TO_FUKAN_OVERLAY_HERE ${PORTDIR_OVERLAY}"</code>
to the end of <code>/etc/portage/make.conf</code>.

To sync up the repository, run `git -C PATH_TO_FUKAN_OVERLAY_HERE pull origin master`.
