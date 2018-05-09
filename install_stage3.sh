#!/bin/bash
set -eu

stage3_dir="http://distfiles.gentoo.org/releases/amd64/autobuilds"
stage3_fname=$(\
	wget -qO- "${stage3_dir}"/latest-stage3-amd64-nomultilib.txt \
		| tail -n 1 \
		| cut -f 1 -d " ")
stage3_url="${stage3_dir}"/"${stage3_fname}"

wget -qO- "${stage3_url}" \
	| tar Jxpf - -C "${1}" --xattrs-include='*.*' --numeric-owner
