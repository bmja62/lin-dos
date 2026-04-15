#!/usr/bin/env bash

source ./copy/copy.sh

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

assert_file_equals() {
    local path="$1"
    local expected="$2"
    local message="$3"
    local actual
    actual="$(cat "$path")"
    if [[ "$actual" == "$expected" ]]; then
        echo "PASS: $message"
    else
        echo "FAIL: $message"
        echo "Expected: $expected"
        echo "Actual:   $actual"
        exit 1
    fi
}

tmp_dir="$(mktemp -d)"
orig_dir="$(pwd)"
builtin cd "$tmp_dir"

missing_name_output="$(COPY con 2>&1 || true)"
assert_contains "$missing_name_output" "No filename provided. Usage: copy con <filename>" "COPY con requires filename"

invalid_output="$(COPY foo 2>&1 || true)"
assert_contains "$invalid_output" "Invalid command. Usage: copy con <filename>" "COPY rejects non-con mode"

create_output="$(printf 'line one\nline two\n' | COPY con sample.txt)"
assert_contains "$create_output" "Type content and press CTRL-D at the start of a new line to finish." "COPY prompts for content"
assert_file_equals "sample.txt" $'line one\nline two' "COPY writes piped content to target file"

builtin cd "$orig_dir"
rm -rf "$tmp_dir"

echo "COPY test passed."
