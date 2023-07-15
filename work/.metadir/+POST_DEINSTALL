if [ -n "${PKG_ROOTDIR}" ] && [ "${PKG_ROOTDIR}" != "/" ]; then
  PW="/usr/sbin/pw -R ${PKG_ROOTDIR}"
else
  PW=/usr/sbin/pw
fi
if ${PW} usershow _tor >/dev/null 2>&1; then
  echo "==> You should manually remove the \"_tor\" user. "
fi
if ${PW} groupshow _tor >/dev/null 2>&1; then
  echo "==> You should manually remove the \"_tor\" group "
fi
