#!/usr/bin/env bash

export > /etc/envvars
exec /usr/sbin/runsvdir-start
