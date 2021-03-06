#!/bin/bash
if [ "$#" -ne  "2" ]
  then
    echo "Please supply exactly two argument, the hash of the container, and"
    echo "the Drush command to run, \"in quotes\"."
    echo "The container's hash be found in the list below. If you can't find"
    echo "it, please create a dev container by running ./dcycle/deploy.sh"
    echo ""
    echo "Usage:"
    echo ""
    echo "For container xyz123, get a one-time login link by typing"
    echo ""
    echo "./scripts/drush.sh xyz123 'uli'"
    docker ps
else
  echo -e "[info] Running exec will cause failures on certain CI servers including CircleCI"
  docker exec $1 bash -c "cd /var/www/html && drush $2"
fi
