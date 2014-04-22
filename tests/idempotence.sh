#!/bin/bash

# Idempotency test for Ansible
#
# Runs an Ansible role/playbook, and makes sure no changes were made.
#
# @author Jeff Geerling, 2014

# Run playbook, and exit with 0 status if 'changed=0' found (good).
pwd
ls
ansible-playbook -i ../tests/inventory ../tests/$SITE --connection=local --sudo | grep -q 'changed=0' && exit 0

# Exit with a non-zero status if 'changed=0' was not found.
exit 1
