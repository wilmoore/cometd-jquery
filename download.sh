#!/usr/bin/env bash

#
# strict is better.
#

set -e
set -o errexit
set -o errtrace
set -o nounset

# configure
COMETD_VERSION="3.0.0"

# download and extract source into $TMPDIR
rm -rf $TMPDIR/cometd-$COMETD_VERSION
curl -#fL http://download.cometd.org/cometd-$COMETD_VERSION-distribution.tar.gz | tar xz -C $TMPDIR

# unpack the `org` and `jquery` directories into the versioned directory
unzip -u $TMPDIR/cometd-$COMETD_VERSION/cometd-javascript/jquery/target/cometd-javascript-jquery-$COMETD_VERSION.war 'org/*' 'jquery/*' -d "./" -x 'jquery/jquery-*.*.*.js'
