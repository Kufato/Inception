#!/bin/bash

# Certificate and ssl key recovery
openssl req -x509 -nodes -out ${CERT} -keyout ${KEY} -subj ${SUBJ}
exec "$@"