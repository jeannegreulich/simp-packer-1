#!/bin/sh
#
#  Call ruby script to check if test settings (simp_conf.yaml generated
#  for the test) match the system settings and, in for some checks, the
#  hieradata generated by 'simp config' (simp_config_settings.yaml).
#

set -e

export PATH="${PATH}:/opt/puppetlabs/bin"
packerdir="/var/local/simp"
pupenvdir="$(puppet config print environmentpath)"
hieradata_dir="${pupenvdir}/simp/data"

simp_version="$(cat /etc/simp/simp.version)"
semver=( ${simp_version//./ } )
major="${semver[0]}"
minor="${semver[1]}"

# Use old hieradata path when SIMP < 6.3.0
if [[ ( "$major" -eq 6  &&  "$minor" -lt 3 ) || "$major" -le 5 ]]; then
  hieradata_dir="$pupenvdir/simp/hieradata"
fi
simp_default="${hieradata_dir}/simp_config_settings.yaml"

"${packerdir}/scripts/tests/check_settings.rb" "${packerdir}/files/simp_conf.yaml" "${simp_default}"
