#!/usr/bin/env python
# Send UDP Package to info-beamer presentation.

import socket, time, sys

# Open a UDP socket...
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# ...and "connect" it to the address of info-beamer
sock.connect(('10.1.0.85', 4444))

value = int(sys.argv[1])
data = 'gauge/mode:{}'.format(value)
sock.send(data.encode())
