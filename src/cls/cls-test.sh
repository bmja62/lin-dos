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

# Override clear so test is stable and non-interactive.
clear() {
    echo "__CLEAR_CALLED__"
}

help_output="$(CLS "/?")"
assert_contains "$help_output" "Clears the screen." "CLS help describes behavior"
assert_contains "$help_output" "CLS" "CLS help includes command name"

run_output="$(CLS)"
assert_contains "$run_output" "__CLEAR_CALLED__" "CLS executes clear when no args"

echo "CLS test passed."
