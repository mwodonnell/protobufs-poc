# 15Five Protobuf Repo

### This README is a WIP - just general notes for now

---

## Dev Environment Setup

The protobuf repo is built over buf.build and CodeArtifact. To get started, you will need to install the buf cli and 
associated tools.

### Requirements
- Make
- buf-cli
- pyenv

1) Install [buf-cli](brew install bufbuild/buf/buf) if you don't have it already
   * If you're on a Mac, this is most likely `brew install bufbuild/buf/buf`
2) Install [Make](https://formulae.brew.sh/formula/make) if you don't have it already
   * If you're on a Mac, this is most likely `brew install make` 
3) Install [pyenv](https://github.com/pyenv/pyenv?tab=readme-ov-file#installation) if you don't have it already
   * If you're on a Mac, this is most likely `brew install pyenv`
   * Make sure to follow the [setup guide](https://github.com/pyenv/pyenv?tab=readme-ov-file#set-up-your-shell-environment-for-pyenv) once installed
4) Install python `3.12` with pyenv if you don't have it already
   * `pyenv install 3.12`
5) Create a virtualenv with `pyenv virtualenv 3.12 protobuf`
   * replace `protobuf` with whatever you want to name your virtualenv if you want, rest of this doc assumes you 
        named it `protobuf`
6) If you want - make a handy alias to activate your venv and cd into the project directory
   * `echo "alias ff-pb='pyenv activate protobuf && cd </path/to/protobuf-repo>" >> ~/.zshrc`
7) If you did the above, just run `ff-pb` after opening a new shell window, otherwise activate the virtualenv
   with `pyenv activate protobuf`
8) Install poetry to your new virtualenv with `pip install poetry`

add more here



---

## What is this?
This repo is a collection of protobuf files that are used across 15Five services. We consolidate these files here to 
ensure that all services are using the same version of the protobuf files. Additionally - this helps reduce the 
complexity that comes with managing protobuf deployment and version management.

## How do I use this?
If you're not looking to add or update - you don't need to do anything! Protobuf files are compiled for you and 
stored within AWS' CodeArtifact service. If you need to use one of the schemas generate from this repo, simply 
import the one you need [better docs needed on this]

## How do I add a new schema?
To create new schemas - all that is required is to add a new module or package to the `./proto` directory.
Refer to the existing packages for a reference of how these should be structured.

In general - the structure should be as follows:
```
proto/
    <package_1>/
        <module_1>/
            <verion>/
                <module_1>.proto
                <supporting files>.proto
                <supporting files>.proto
        <module_2>/
            <verion>/
                <module_2>.proto
                <supporting files>.proto
                <supporting files>.proto
    <package_2>/
        <module_1>/
            <verion>/
                <module_1>.proto
                <supporting files>.proto
                <supporting files>.proto

```

Where `<package_1>` is the name of the package, `<module_1>` is the name of the module, and `<version>` is the version

Packages are used to group related modules together. For example, DIP has a data-bridge package that contains all 
modules related to systems that interact with the DIP pipeline. Within the data-bridge package, there are modules 
for the specific implementations of the data-bridge package

If done correctly - running `make gen` should pass all checks and generate the new schemas.