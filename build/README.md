These directories contain Dockerfiles for the Stackdriver Logging agent build
containers on various OS distros. The Logging agent Linux package builds use
[Omnibus](http://github.com/chef/omnibus), which, by default, detects the
surrounding environment and builds a package for that. These build containers
provide hermetic environments for the various distros supported by the agent,
with preinstalled and preconfigured dependencies to speed up the builds and make
them reproducible.
