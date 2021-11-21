#!/usr/bin/env bash

ansible-lint -p site.yml roles/fail2ban roles/reboot roles/snapd roles/swap
