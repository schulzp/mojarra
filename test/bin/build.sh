#!/bin/bash
#
# Copyright (c) 1997, 2018 Oracle and/or its affiliates. All rights reserved.
#
# This program and the accompanying materials are made available under the
# terms of the Eclipse Public License v. 2.0, which is available at
# http://www.eclipse.org/legal/epl-2.0.
#
# This Source Code may also be made available under the following Secondary
# Licenses when the conditions for such availability set forth in the
# Eclipse Public License v. 2.0 are satisfied: GNU General Public License,
# version 2 with the GNU Classpath Exception, which is available at
# https://www.gnu.org/software/classpath/license.html.
#
# SPDX-License-Identifier: EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0
#

printf '\n Building Mojarra and installing in Maven \n\n'
printf '\n Note that this should be run from the [mojarra home]/test folder as bin/build.sh \n\n'

cd ..

printf 'Running initial ant build from %s\n' "$(pwd)"

# ant main clean main after release, e.g. m05 changed to m06
ant clean main

exit_code=$?

if [ "$exit_code" -ne "0" ]; then
    printf "\n\n\n\n EXITING BECAUSE OF FAILURES. SEE ABOVE! \n\n\n\n"
    exit $exit_code
fi

printf '\n Running ant initiated maven build and install \n\n'

ant mvn.deploy.snapshot.local

exit_code=$?

if [ "$exit_code" -ne "0" ]; then
    printf "\n\n\n\n EXITING BECAUSE OF FAILURES. SEE ABOVE! \n\n\n\n"
    exit $exit_code
fi


