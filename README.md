# FindMyIP
NETWORK INFO SCRIPT
===================

What it does:
Shows your computer's Hostname, IPv4 address, and MAC address in a simple window.
Script now also displays the device hostname.

How to use:
Just double-click the .bat file. That's it.

Requirements:
- Windows (any version with ipconfig and getmac commands)
- That's literally it

What you'll see:
-------------------------
Device Network Info
-------------------------
Hostname     : "Device name"
IPv4 Address : "IP address"
MAC Address  : "Device MAC address"
-------------------------

Notes:
- Only shows the first network adapter it finds
- If you have multiple network connections, it picks whichever one shows up first
- If it can't find an IP or MAC, it'll say "Not Found"

Troubleshooting:
- If you see "Not Found" for both, you're probably not connected to a network
- If only MAC shows up, your adapter might not have an IP assigned yet
- Run as administrator if you're having permission issues (shouldn't need to though)
