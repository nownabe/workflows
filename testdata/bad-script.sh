#!/bin/bash
# Intentionally violates shellcheck (SC2086 unquoted, SC2154 undefined).
rm $target_file
echo $undefined_var
