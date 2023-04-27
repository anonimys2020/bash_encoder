#!/bin/bash
code_hex="\x65\x63\x68\x6f\x20\x22\x48\x65\x6c\x6c\x6f\x20\x57\x6f\x72\x6c\x64\x22\x0a"
code_bytes=$(echo $code_hex | sed 's/\\x//g' | xxd -r -p)
code_str=$(echo $code_bytes | tr -d '\n')
eval $code_str
