== General info ==

This is a simple Debian package that:

1) Gets istioctl binaries from upstream releases on Github.
2) Deploys them under /usr/bin on the target machine as istioctl-$version

The changelog should reflect the most up to date version of istioctl packaged,
but it can contain older ones as well. In order to support multiple versions
of istioctl, see `rules`.

The `istioctl` binaries are not committed to the repository due to their size
(~100MB each), but they are downloaded and copied to the final .deb as part
of the build process.

== How to build ==

`https_proxy=http://webproxy.eqiad.wmnet:8080 DIST=buster-wikimedia pdebuild`