#!/bin/bash

postconf -e smtputf8_enable=no

postconf -e myhostname=${MYHOSTNAME}

# disable local delivery
postconf -e mydestination=

# don't relay for any domains
postconf -e relay_domains=${RELAY_DOMAINS}

# relay ftom defined netoworks
postconf -e mynetworks_style=subnet
postconf -e mynetworks=${MYNETWORKS}

# reject invalid HELOs
postconf -e smtpd_delay_reject=yes
postconf -e smtpd_helo_required=yes
postconf -e "smtpd_helo_restrictions=permit_mynetworks,reject_invalid_helo_hostname,permit"

postconf -e "smtpd_relay_restrictions=permit_mynetworks,reject"
postconf -e mailbox_size_limit=0

# use TLS
postconf -e smtp_use_tls=yes
postconf -e smtp_tls_CAfile=/etc/ssl/certs/ca-certificates.crt

# stop complaining about missing /etc/postfix/aliases.db file
postalias /etc/postfix/aliases

/usr/sbin/postfix -c /etc/postfix start
