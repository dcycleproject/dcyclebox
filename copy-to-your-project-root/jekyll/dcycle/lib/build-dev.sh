# Make sure errors propagate throughout the script
set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

PORT=$1
PROJECTNAME=$2

docker build -f="Dcycle-Dockerfile-jekyll" -t $PROJECTNAME-jekyll .
docker run -d -v $(pwd):/srv/jekyll/ $PROJECTNAME-jekyll /bin/bash -c 'jekyll build --watch --force_polling'

docker build -f="Dcycle-Dockerfile-nginx" -t $PROJECTNAME-nginx .
docker run -d -p $PORT:80 -v $(pwd)/_site:/usr/share/nginx/html/ $PROJECTNAME-nginx
echo -e "[<<  ] End of script $0"
