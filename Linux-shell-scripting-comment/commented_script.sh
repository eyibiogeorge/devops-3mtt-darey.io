#!/bin/bash

# this file receives multiple arguments
# and prints them one by one
for arg in "$@"; do
  echo "$arg"
done
