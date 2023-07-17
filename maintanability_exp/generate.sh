#!/usr/bin/env bash
versions="$(jq -r 'keys | map(@sh) | join(" ")' versions.json)"
eval "versions=( $versions )"

for version in ${versions[@]}
do
    export version

    variants="$(jq -r '.[env.version].variants | map(@sh) | join(" ")' versions.json)"
    eval "variants=( $variants )"

    javaVersion="$(jq -r '.[env.version].version' versions.json)"

    arches="$(jq -r '.[env.version].jdk.arches | keys | map(@sh) | join(" ")' versions.json)"
    eval "arches=( $arches )"

    archDetail=""
    for arch in ${arches[@]}
    do
        export arch

        sha="$(jq -r '.[env.version].jdk.arches | .[env.arch].sha256' versions.json)"
        url="$(jq -r '.[env.version].jdk.arches | .[env.arch].url' versions.json)"
        
        archDetail="$archDetail $sha $url"
    done

    for variant in ${variants[@]}
    do
        dir="$version/$variant"
        echo "processsing $dir..."
        mkdir -p "$dir"

        ./myriad ./main.my "$dir/Dockerfile" $variant $version $javaVersion $archDetail
    done
done
