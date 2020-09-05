#!/usr/bin/env bash

mkdir -p build/fuzz_protocol$1_input
cp test/fuzz_protocol_input/* build/fuzz_protocol$1_input
afl-clang-fast bq_websocket.c test/fuzz_protocol.c -lpthread -o build/fuzz_protocol$1
afl-fuzz -i build/fuzz_protocol$1_input -o build/fuzz_protocol_findings$1 build/fuzz_protocol$1
