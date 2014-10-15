#!/bin/bash -x
FALLING_NODE=$1         # %d
OLDPRIMARY_NODE=$2      # %P
NEW_PRIMARY=$3          # %H
PGDATA=$4               # %R

if [ $FALLING_NODE = $OLDPRIMARY_NODE ]; then
    if [ $UID -eq 0 ]
    then
        su postgres -c "ssh -T postgres@$NEW_PRIMARY touch /tmp/pgsql.trigger"
    else
        ssh -T postgres@$NEW_PRIMARY touch /tmp/pgsql.trigger
    fi
    exit 0;
fi;
exit 0;

