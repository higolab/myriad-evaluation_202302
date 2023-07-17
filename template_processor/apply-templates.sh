#!/usr/bin/env bash
set -Eeuo pipefail

[ -f versions.json ] # run "versions.sh" first

jqt='.jq-template.awk'

versions="$(jq -r 'keys | map(@sh) | join(" ")' versions.json)"
eval "set -- $versions"

for version; do
	export version

	rm -rf "$version/"

	variants="$(jq -r '.[env.version].variants | map(@sh) | join(" ")' versions.json)"
	eval "variants=( $variants )"

	export javaType
	javaType="jdk"

	for variant in "${variants[@]}"; do
		export variant

		dir="$version/$variant"
		mkdir -p "$dir"

		case "$variant" in
			windows/*)
				variant="$(basename "$dir")" # "buster", "windowsservercore-1809", etc
				windowsVariant="${variant%%-*}" # "windowsservercore", "nanoserver"
				windowsRelease="${variant#$windowsVariant-}" # "ltsc2022", "1809", etc
				windowsVariant="${windowsVariant#windows}" # "servercore", "nanoserver"
				export windowsVariant windowsRelease
				template='Dockerfile-windows.template'
				;;

			*)
				template='Dockerfile-linux.template'
				;;
		esac

		echo "processing $dir ..."

		gawk -f "$jqt" "$template" > "$dir/Dockerfile"
	done
done