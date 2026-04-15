#!/usr/bin/env bash

source ./cd/cd.sh

assert_equal() {
    local actual="$1"
    local expected="$2"
    local message="$3"
    if [[ "$actual" == "$expected" ]]; then
        echo "PASS: $message"
    else
        echo "FAIL: $message"
        echo "Expected: $expected"
        echo "Actual:   $actual"
        exit 1
    fi
}

orig_dir="$(pwd)"
tmp_dir="$(mktemp -d)"
mkdir -p "${tmp_dir}/child"

no_arg_output="$(CD)"
assert_equal "$no_arg_output" "$orig_dir" "CD without args prints current directory"

cd_output="$(CD "${tmp_dir}/child")"
assert_equal "$cd_output" "${tmp_dir}/child" "CD with path changes directory and prints destination"

CD "${tmp_dir}/child" >/dev/null
assert_equal "$(pwd)" "${tmp_dir}/child" "CD updates working directory when called directly"

builtin cd "$orig_dir"
rm -rf "$tmp_dir"

echo "CD test passed."
