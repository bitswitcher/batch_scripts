@echo off
setlocal
setlocal ENABLEEXTENSIONS
setlocal ENABLEDELAYEDEXPANSION

netsh wlan disconnect
netsh wlan connect name=valid_ssid_name

