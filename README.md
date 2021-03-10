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
dependencies. The repository was constructed as follow:


```
$ opam source patdiff.v0.14.0
$ cd patdiff.v0.14.0
$ opam monorepo lock --recurse-opam --build-only
$ opam monorepo pull
```
