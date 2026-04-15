#!/usr/bin/env bash

source ./tree/tree.sh

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

expected_help="$(cat ./tree/tree-help.txt)"
help_output="$(TREE "/?")"
assert_equal "$help_output" "$expected_help" "TREE /? matches tree-help.txt"

tmp_dir="$(mktemp -d)"
tmp_name="$(basename "$tmp_dir")"
mkdir -p "${tmp_dir}/sub/nested"
touch "${tmp_dir}/sub/file.txt"

tree_output="$(TREE "$tmp_dir")"
assert_contains "$tree_output" "$tmp_name" "TREE includes target root directory name"
assert_contains "$tree_output" "sub" "TREE includes first-level directory"
assert_contains "$tree_output" "nested" "TREE includes nested directory"

default_output="$(cd "$tmp_dir" && TREE)"
assert_contains "$default_output" "." "TREE without args uses current directory"
assert_contains "$default_output" "sub" "TREE default output includes child directory"

rm -rf "$tmp_dir"

echo "TREE test passed."
