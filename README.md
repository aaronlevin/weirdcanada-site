weirdcanada-site
================

New website for Weird Canada.

## Build Instructions

```
cabal sandbox init
cabal configure
cabal install
cabal build
cabal run
```

The initial install will take a while but after that cabal is smart at incremental compilation.

## Dependencies
* ghc-7.6.3
* postgresql-9.3
