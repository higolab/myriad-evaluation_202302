#!/usr/bin/env bash
versions=("18" "20" "21")
bases=("bullseye" "buster" "oraclelinux7" "oraclelinux8" "slim-bullseye" "slim-buster" "windows/nanoserver-1809" "windows/windowsservercore-1809" "windows/windowsservercore-ltsc2022")

for version in ${versions[@]}
do
    for base in ${bases[@]}
    do
        dir="$version/$base"
        mkdir -p "$dir"
        ./myriad ./main.my "$dir/Dockerfile" $base $version
    done
done