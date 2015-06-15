#!/bin/bash

reg="(epel-release[^\"]+.rpm)\""
base_url="http://dl.fedoraproject.org/pub/epel/7/x86_64/repoview/"
epel_detail="${base_url}epel-release.html"
relative_url=$( curl -s http://dl.fedoraproject.org/pub/epel/7/x86_64/repoview/epel-release.html | grep ".*\(epel-release-[^.]*\.noarch.rpm\).*" | awk -F'href="' '{print $2}' | awk -F'"' '{print $1}' )

echo ${relative_url}
rpm -ivh ${base_url}${relative_url}
