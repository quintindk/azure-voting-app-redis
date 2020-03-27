#!/bin/bash

function usage() {
echo "Usage:  $0 count type seconds"
}

if [ $# -ne 3 ]; then
usage;
exit;
fi

url=$1
count=$2
type=$3
seconds=$4

let i=$count-1
while [ $i -ge 0 ];
do
    curl -w "$i: %{time_total} %{http_code} %{size_download} %{url_effective}\n" -o "/dev/null" --location --request POST $url \
    --header 'Content-Type: multipart/form-data; boundary=--------------------------795420350790576285548457' \
    --form 'vote='$type
    let i=i-1
    sleep $seconds
done