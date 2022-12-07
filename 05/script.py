#! /usr/bin/python3

import sys
import os

def dump_stacks(stacks):
  c = 0;
  for stack in stacks:
    print(f"{c} {stack}")
    c = c+1

stacks = [
  ["_"],
  ["R", "G", "H", "Q", "S", "B", "T", "N"],
  ["H", "S", "F", "D", "P", "Z", "J"],
  ["Z", "H", "V"],
  ["M", "Z", "J", "F", "G", "H"],
  ["T", "Z", "C", "D", "L", "M", "S", "R"],
  ["M", "T", "W", "V", "H", "Z", "J"],
  ["T", "F", "P", "L", "Z"],
  ["Q", "V", "W", "S"],
  ["W", "H", "L", "M", "T", "D", "N", "C"],
]
dump_stacks(stacks)
for line_number, line in enumerate(sys.stdin, 1):
  if line.strip():
    bits = line.split();
    num = int(bits[1])
    fr = int(bits[3])
    to = int(bits[5])
    print(f"[{line_number} Num: {num}; from: {fr}; to: {to}")
    for i in range (0, num):
      crate = stacks[fr].pop()
      print(f"crate: {crate}; from: {fr}; to: {to}")
      stacks[to].append(crate)
    dump_stacks(stacks)
