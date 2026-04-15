#!/usr/bin/env bash

source ./help/help.sh

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

expected_help="$(cat ./help/help-help.txt)"
help_output="$(HELP "/?")"
assert_equal "$help_output" "$expected_help" "HELP /? matches help-help.txt"

default_output="$(HELP)"
assert_equal "$default_output" "$expected_help" "HELP default output matches help-help.txt"

cd_help_expected="$(cat ./cd/cd-help.txt)"
cd_help_output="$(HELP cd)"
assert_equal "$cd_help_output" "$cd_help_expected" "HELP command shows target command help file"

unsupported_output="$(HELP unknown 2>&1 || true)"
assert_contains "$unsupported_output" "This command is not supported by the help utility." "HELP rejects unknown commands"

echo "HELP test passed."
