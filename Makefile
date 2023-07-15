# $FreeBSD$

PORTNAME=	pfSense-pkg-tor
PORTVERSION=	0.4.7.13
PORTREVISION=	6
CATEGORIES=	net
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	as@augin.ru
COMMENT=	pfSense package tor+obfs4

LICENSE=	APACHE20

NO_BUILD=	yes
NO_MTREE=	yes

SUB_FILES=	pkg-install pkg-deinstall
SUB_LIST=	PORTNAME=${PORTNAME} USER="${USERS}" GROUP="${GROUPS}"
PLIST_SUB=      USER="${USERS}" GROUP="${GROUPS}"

GROUPS=		_tor
USERS=		_tor

do-extract:
	${MKDIR} ${WRKSRC}

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/pkg
	${MKDIR} ${STAGEDIR}${PREFIX}/etc/rc.d
	${MKDIR} ${STAGEDIR}${PREFIX}/etc/tor
	${MKDIR} ${STAGEDIR}${PREFIX}/bin
	${MKDIR} ${STAGEDIR}/etc/inc/priv
	${MKDIR} ${STAGEDIR}${PREFIX}/share/tor
	${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} -m 0644 ${FILESDIR}${PREFIX}/pkg/tor.xml \
		${STAGEDIR}${PREFIX}/pkg
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/pkg/tor.xml \
		${STAGEDIR}${PREFIX}/pkg
	${INSTALL_DATA} -m 755 ${FILESDIR}${PREFIX}/etc/rc.d/tor.sh \
		${STAGEDIR}${PREFIX}/etc/rc.d
	${INSTALL_DATA} ${FILESDIR}/etc/inc/priv/tor.priv.inc \
		${STAGEDIR}/etc/inc/priv
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/etc/tor/* \
		${STAGEDIR}${PREFIX}/etc/tor/
	${INSTALL_DATA} -m 755 ${FILESDIR}${PREFIX}/bin/* \
		${STAGEDIR}${PREFIX}/bin/
	${INSTALL_DATA} ${FILESDIR}${PREFIX}/share/tor/* \
		${STAGEDIR}${PREFIX}/share/tor/
	${INSTALL_DATA} ${FILESDIR}${DATADIR}/info.xml \
		${STAGEDIR}${DATADIR}
	@${REINPLACE_CMD} -i '' -e "s|%%PKGVERSION%%|${PKGVERSION}|" \
		${STAGEDIR}${DATADIR}/info.xml
post-install:
	@${MKDIR} ${STAGEDIR}/var/log/tor ${STAGEDIR}/var/run/tor ${STAGEDIR}/var/db/tor

.include <bsd.port.mk>
