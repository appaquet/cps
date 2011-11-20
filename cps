#!/usr/bin/python

import sys
import time

time_last = time.time()
line_total = 0
line_last = 0
byte_total =0
byte_last = 0
for line in sys.stdin:
	time_now = time.time()
	line_total += 1
	byte_total += len(line)

	time_diff = time_now - time_last
	if time_diff > 1:
		line_diff = float(line_total - line_last) / float(time_diff)
		byte_diff = float(byte_total - byte_last) / float(time_diff)

		print "%dL/s (%d total) %dB/s (%d total)" % (line_diff, line_total, byte_diff, byte_total)

		line_last = line_total
		byte_last = byte_total
		time_last = time_now

