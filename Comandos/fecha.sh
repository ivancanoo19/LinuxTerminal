#!/bin/bash

echo
echo Hora del sistema:
grep rtc_time /proc/driver/rtc

echo Fecha del sistema:
grep rtc_date /proc/driver/rtc

echo