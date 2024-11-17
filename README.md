# 15Five Protobuf Repo

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
To create new schemas - all that is required is to add a new module