Dune benchmark
==============

This repository contains a benchmark for Dune that we use to monitor
the evolution of performances.

Running
-------

```
./bench.sh [dune-binary]
```

What is it?
-----------

At the moment, this a build of
[patdiff](https://github.com/janestreet/patdiff) and all its reverse
dependencies. The repository was constructed as follow:s

```console
$ opam repository add dune-universe git+https://github.com/dune-universe/opam-overlays.git
$ opam source patdiff.v0.16.0
$ cd patdiff.v0.16.0
$ opam monorepo lock --build-only --ocaml-version 4.14.1
$ opam monorepo pull
```
