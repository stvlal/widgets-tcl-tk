#!/usr/bin/env bash

nc -zw1 192.168.31.214 80 && echo 1 || echo 0
