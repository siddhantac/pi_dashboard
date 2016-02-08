#!/bin/bash

/opt/vc/bin/vcgencmd measure_temp | sed -r 's_.*([0-9][0-9].[0-9]).*_\1_'
