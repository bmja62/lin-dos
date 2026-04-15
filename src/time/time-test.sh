#!/usr/bin/env bash

source ./time/time.sh

assert_match() {
    local output="$1"
    local pattern="$2"
    local message="$3"

    if [[ "$output" =~ $pattern ]]; then
        echo "PASS: $message"
    else
        echo "FAIL: $message"
        echo "Output: $output"
        exit 1
    fi
}

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

expected_help="$(cat ./time/time-help.txt)"
help_output="$(TIME "/?")"
assert_equal "$help_output" "$expected_help" "TIME /? matches time-help.txt"

time_output="$(TIME "/T")"
assert_match "$time_output" "^[0-9]{2}:[0-9]{2}:[0-9]{2}\\.[0-9]{2}$" "TIME /T returns expected format"

interactive_output="$(printf '\n' | TIME)"
assert_contains "$interactive_output" "The current time is: " "TIME default prints DOS-style current time label"
assert_contains "$interactive_output" "Enter the new time:" "TIME default prints DOS-style time prompt"

invalid_output="$(TIME "bad" 2>&1 || true)"
assert_contains "$invalid_output" "The syntax of the command is incorrect." "TIME rejects unknown arguments"

echo "TIME test passed."
