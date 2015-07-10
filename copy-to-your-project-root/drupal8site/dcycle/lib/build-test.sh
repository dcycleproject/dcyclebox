# Make sure errors propagate throughout the script
set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

PORT=$1
PROJECTNAME=$2

docker build -f="Dcycle-Dockerfile-drupal8site-test" -t $PROJECTNAME-dcycle-drupal8site-test .
docker run -d -p $PORT:80 $PROJECTNAME-dcycle-drupal8site-test

echo -e "[<<  ] End of script $0"
