#!/bin/bash

# gsutil cp ArtstoPage/* gs://artsto-preview
# gsutil rsync -d -r ArtstoPage gs://artsto-preview
gsutil -m rsync -d -r -x '\.git.*' ArtstoPage gs://artsto-preview

# setup
# set main page as index.html
# gsutil web set -m index.html -e 404.html gs://artsto-preview

# provide correct permissions to all the users
# gsutil iam ch allUsers:objectViewer gs://artsto-preview

# preview page at the link below
# http://storage.googleapis.com/artsto-preview/index.html

