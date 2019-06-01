#!/bin/bash

LOGSUMEXP_IMPORT_BEF="from scipy.misc import logsumexp"
LOGSUMEXP_IMPORT_AFT="try:\n\tfrom scipy.special import logsumexp\nexcept ImportError:\n\tfrom scipy.misc import logsumexp  # removed in scipy 0.19.0"

find . -type f | xargs sed -i "s/${LOGSUMEXP_IMPORT_BEF}/${LOGSUMEXP_IMPORT_AFT}/g"
