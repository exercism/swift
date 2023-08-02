#!/usr/bin/env bash

set -eo pipefail

temp=$(mktemp -d)

swift build --package-path ./generator

for exercise in ./exercises/practice/*; do
    if [[ -r "${exercise}/.meta/template.swift" ]]; then
        cp -r "$exercise" "$temp"
        test_file="${exercise}/$(jq -r '.files.test[0]' ${exercise}/.meta/config.json)"
        temp_test_file="${temp}/$(basename "$exercise")/$(jq -r '.files.test[0]' ${exercise}/.meta/config.json)"
        swift run --package-path ./generator Generator $(basename "$exercise") "$temp/$(basename "$exercise")"
        echo "Comparing $test_file with $temp_test_file"
        diff "$temp_test_file" "$test_file"
        if [ $? -ne 0 ]; then
            exit_code=1
        fi
    fi
done

exit ${exit_code}
