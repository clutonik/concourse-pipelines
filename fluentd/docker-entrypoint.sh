#!/bin/bash
set -e
# create kerberos keytab
FLUENTD_DEFAULT_CONFIG=/fluentd/etc/fluent.conf
# Custom config mounted during container creation
FLUENTD_CUSTOM_CONFIG=/app/fluent.conf

echo "INFO: Starting fluentd..."
if [ ! -f "${FLUENTD_CUSTOM_CONFIG}" ]; then
    echo "WARN: did not find any custom fluentd config, using default fluentd config..."
    fluentd -c "${FLUENTD_DEFAULT_CONFIG}"
else
    echo "INFO: Starting fluentd using ${FLUENTD_CUSTOM_CONFIG} mounted through volume..." 
    fluentd -c "${FLUENTD_CUSTOM_CONFIG}"
fi
