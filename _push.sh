#!/bin/bash

s3cmd sync -c /home/btb/.s3cfg-xemplar --delete-removed ./site/_site/ s3://www.xemplar.io/ 
