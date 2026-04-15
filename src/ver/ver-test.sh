#!/usr/bin/env bash

source ./ver/ver.sh

assert_contains() {
    local output="$1"
    local expected="$2"
    local message="$3"
    if [[ "$output" == *"$expected"* ]]; then
        echo "PASS: $message"
    else
        echo "FAIL: $message"
        echo "Output: $output"
        exit 1
    fi
}

help_output="$(VER "/?")"
assert_contains "$help_output" "Displays the Linux version." "VER help describes behavior"
assert_contains "$help_output" "VER" "VER help includes syntax"

expected_pretty="$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')"
ver_output="$(VER)"
assert_contains "$ver_output" "$expected_pretty" "VER prints PRETTY_NAME from os-release"

echo "VER test passed."
