#!/usr/bin/env bash

source ./md/md.sh

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

tmp_dir="$(mktemp -d)"
orig_dir="$(pwd)"
builtin cd "$tmp_dir"

no_arg_output="$(MD 2>&1 || true)"
assert_contains "$no_arg_output" "Usage: Md directory_name" "MD without args returns usage"

create_output="$(MD alpha beta)"
assert_contains "$create_output" "Directory created: alpha beta" "MD reports created directories"
[[ -d "alpha" ]] || { echo "FAIL: MD did not create alpha"; exit 1; }
[[ -d "beta" ]] || { echo "FAIL: MD did not create beta"; exit 1; }
echo "PASS: MD created directories"

builtin cd "$orig_dir"
rm -rf "$tmp_dir"

echo "MD test passed."
