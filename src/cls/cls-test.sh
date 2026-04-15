#!/usr/bin/env bash

source ./cls/cls.sh

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

# Override clear so test is stable and non-interactive.
clear() {
    echo "__CLEAR_CALLED__"
}

expected_help="$(cat ./cls/cls-help.txt)"
help_output="$(CLS "/?")"
assert_equal "$help_output" "$expected_help" "CLS /? matches cls-help.txt"

run_output="$(CLS)"
assert_contains "$run_output" "__CLEAR_CALLED__" "CLS executes clear when no args"

echo "CLS test passed."
