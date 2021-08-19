# Browser

## About
a dockerized browser forwarding the display of the x-server
to isolate the process and control its resource-footprint
    
## Overview
a docker volume is created to allow for persistence.
to use the package run:
- `make sync && make run`

## Varia
- it assumes to allow any user to access the x-server `xhost +local:`

## NOTE
- momentarely containerized browser only runs with root privileges
it seems starting firefox in headless mode fails to init due to:
[error-log](https://termbin.com/z40m)

any user related commands are commented out.
