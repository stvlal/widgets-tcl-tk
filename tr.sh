#!/usr/bin/env bash
# This script is used by the main program 

nc -zw1 192.168.31.214 80 && echo 1 || echo 0
