#!/usr/bin/env bash

source ./date/date.sh

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

help_output="$(DATE "/?")"
assert_contains "$help_output" "Displays or sets the date." "DATE help starts with DOS description"
assert_contains "$help_output" "DATE [/T | date]" "DATE help includes DOS syntax"
assert_contains "$help_output" "current date, without prompting for a new date." "DATE help includes /T behavior"

date_output="$(DATE "/T")"
assert_match "$date_output" "^[A-Za-z]{3}[[:space:]][0-9]{2}/[0-9]{2}/[0-9]{4}$" "DATE /T returns expected format"

interactive_output="$(printf '\n' | DATE)"
assert_contains "$interactive_output" "The current date is: " "DATE default prints DOS-style current date label"
assert_contains "$interactive_output" "Enter the new date: (mm-dd-yy)" "DATE default prints DOS-style date prompt"

invalid_output="$(DATE "bad" 2>&1 || true)"
assert_contains "$invalid_output" "The syntax of the command is incorrect." "DATE rejects unknown arguments"

echo "DATE test passed."
