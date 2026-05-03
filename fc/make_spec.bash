
cp firefox-non-default.template.spec firefox-non-default.spec

VERSION_ESR=$(cat version.esr)
sed -e "s/<V_ESR>/${VERSION_ESR}/" -i firefox-non-default.spec

VERSION_DEV=$(cat version.dev)
sed -e "s/<V_DEV>/${VERSION_DEV}/" -i firefox-non-default.spec

VERSION_NGT=$(cat version.ngt)
sed -e "s/<V_NGT>/${VERSION_NGT}/" -i firefox-non-default.spec

VERSION_REL=$(cat version.release_prefix )
sed -e "s/<V_REL>/${VERSION_REL}/" -i firefox-non-default.spec


