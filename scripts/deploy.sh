#!/bin/bash

gsutil -m rsync -d -r -x '\.git.*' ArtstoPage gs://artsto-preview

echo "preview at the link below:"
echo http://storage.googleapis.com/artsto-preview/index.html


