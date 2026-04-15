#!/usr/bin/env bash

source ./rd/rd.sh

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

expected_help="$(cat ./rd/rd-help.txt)"
help_output="$(RD "/?")"
assert_equal "$help_output" "$expected_help" "RD /? matches rd-help.txt"

tmp_dir="$(mktemp -d)"
orig_dir="$(pwd)"
builtin cd "$tmp_dir"

no_arg_output="$(RD 2>&1 || true)"
assert_contains "$no_arg_output" "Usage: rd directory_name" "RD without args returns usage"

mkdir non_empty
echo "x" > non_empty/file.txt
non_empty_output="$(RD non_empty 2>&1 || true)"
assert_contains "$non_empty_output" "Error: Directory 'non_empty' is not empty." "RD refuses non-empty directory"
[[ -d "non_empty" ]] || { echo "FAIL: RD removed non-empty directory"; exit 1; }
echo "PASS: RD keeps non-empty directory"

mkdir empty_dir
empty_output="$(RD empty_dir)"
assert_contains "$empty_output" "Directory removed: empty_dir" "RD removes empty directory"
[[ ! -d "empty_dir" ]] || { echo "FAIL: RD did not remove empty directory"; exit 1; }
echo "PASS: RD removed empty directory"

builtin cd "$orig_dir"
rm -rf "$tmp_dir"

echo "RD test passed."
