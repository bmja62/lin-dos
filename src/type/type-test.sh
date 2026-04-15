#!/usr/bin/env bash

source ./type/type.sh

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

expected_help="$(cat ./type/type-help.txt)"
help_output="$(TYPE "/?")"
assert_equal "$help_output" "$expected_help" "TYPE /? matches type-help.txt"

no_arg_output="$(TYPE 2>&1 || true)"
assert_contains "$no_arg_output" "The syntax of the command is incorrect." "TYPE without args returns syntax error"

tmp_file="$(mktemp)"
printf 'hello type\n' > "$tmp_file"
file_output="$(TYPE "$tmp_file" 2>/dev/null)"
assert_contains "$file_output" "$tmp_file" "TYPE output includes target file path"
assert_contains "$file_output" "hello type" "TYPE output includes file contents"
rm -f "$tmp_file"

echo "TYPE test passed."
