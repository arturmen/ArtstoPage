#!/bin/bash

# one time configuration of the bucket
set main page as index.html
gsutil web set -m index.html -e 404.html gs://artsto-preview

# provide correct permissions to all the users
gsutil iam ch allUsers:objectViewer gs://artsto-preview
