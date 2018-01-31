#!/usr/bin/env bash

ADDITIONAL_PARAMS=${VARNISH_ADDITIONAL_RUN_PARAMS=''}
PORT=${VARNISH_PORT='80'}
ADMIN_PORT=${VARNISH_ADMIN_PORT='81'}
NCSA_FORMAT=${VARNISH_NCSA_FORMAT='%h %l %u %t "%r" %s %b "%{Referer}i" "%{User-agent}i"'}
DEFAULT_CONFIG_FILE_LOCATION=${CONFIG_LOCATION='/etc/varnish/default.vcl'}

varnishd -a 0.0.0.0:${PORT} -T 0.0.0.0:${ADMIN_PORT} -f ${DEFAULT_CONFIG_FILE_LOCATION} ${ADDITIONAL_PARAMS}
varnishncsa -b -c -F "${NCSA_FORMAT}"
