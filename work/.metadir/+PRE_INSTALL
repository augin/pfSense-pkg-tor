if [ -n "${PKG_ROOTDIR}" ] && [ "${PKG_ROOTDIR}" != "/" ]; then
  PW="/usr/sbin/pw -R ${PKG_ROOTDIR}"
else
  PW=/usr/sbin/pw
fi
echo "===> Creating groups."
if ! ${PW} groupshow _tor >/dev/null 2>&1; then
  echo "Creating group '_tor' with gid '256'."
  ${PW} groupadd _tor -g 256
else
  echo "Using existing group '_tor'."
fi
echo "===> Creating users"
if ! ${PW} usershow _tor >/dev/null 2>&1; then
  echo "Creating user '_tor' with uid '256'."
  ${PW} useradd _tor -u 256 -g 256  -c "Tor anonymizing router" -d /var/db/tor -s /usr/sbin/nologin
else
  echo "Using existing user '_tor'."
fi
echo "===> Creating homedir(s)"
if [ -n "${PKG_ROOTDIR}" ] && [ "${PKG_ROOTDIR}" != "/" ]; then
  HOMEDIR="${PKG_ROOTDIR}//var/db/tor"
  MDBDIR="-N ${PKG_ROOTDIR}/etc/"
else
  HOMEDIR="/var/db/tor"
  MDBDIR=""
fi
install ${MDBDIR} -d -g _tor -o _tor ${HOMEDIR}
