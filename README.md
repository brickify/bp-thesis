# BP Thesis

LaTeX class for our bachelor thesis at the Hasso Plattner Institute


## Installation

As described in http://tex.stackexchange.com/questions/34203/where-to-put-sty-and-cls-file-for-project
the best way to use this class is to move it to a `texmf` directory which is in your search path for tex files.

E.g. on UNIX you can list the search paths with following command:

```sh
kpsepath tex | tr : '\n'
```

Probably the best place to put/link the class file on Mac OS is the directory `~/Library/texmf/tex`.

In order to create a symbolic link use:

```sh
ln -s ~/Path/to/bp-thesis/bp-thesis.cls
```

This will ensure that even when you pull new changes from the repo
you won't have to update it in another location.


## Development

Everytime the class document is changed the date in the `\ProvidesClass`
section must be updated.
Either to the date of the change or if there are several changes on
the same day it can simply be incremented by one day.
