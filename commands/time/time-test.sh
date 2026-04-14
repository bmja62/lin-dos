#!/usr/bin/env bash

source ./commands/time/time.sh

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

help_output="$(TIME "/?")"
assert_contains "$help_output" "Displays or sets the system time." "TIME help starts with DOS description"
assert_contains "$help_output" "TIME [/T | time]" "TIME help includes DOS syntax"
assert_contains "$help_output" "current time, without prompting for a new time." "TIME help includes /T behavior"

time_output="$(TIME "/T")"
assert_match "$time_output" "^[0-9]{2}:[0-9]{2}:[0-9]{2}\\.[0-9]{2}$" "TIME /T returns expected format"

interactive_output="$(printf '\n' | TIME)"
assert_contains "$interactive_output" "The current time is: " "TIME default prints DOS-style current time label"
assert_contains "$interactive_output" "Enter the new time:" "TIME default prints DOS-style time prompt"

echo "TIME test passed."
