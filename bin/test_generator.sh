#!/usr/bin/env bash

set -euo pipefail

readonly TEMP_DIR=$(mktemp -d)
readonly GENERATOR_DIR="./generator"
readonly PRACTICE_DIR="./exercises/practice"
readonly TEMPLATE_PATH=".meta/template.swift"

swift build --package-path ./generator

exit_code=0
for exercise_path in "${PRACTICE_DIR}"/*; do
    [[ -e "${exercise_path}/${TEMPLATE_PATH}" ]] || continue

    cp -r "${exercise_path}"/. "${TEMP_DIR}"

    test_file=$(jq -r -- '.files.test[0]' "${exercise_path}/.meta/config.json")
    original_test="${exercise_path}/${test_file}"
    temp_test="${TEMP_DIR}/${test_file}"

    exercise_name="${exercise_path##*/}"

    if ! swift run --package-path "${GENERATOR_DIR}" Generator "${exercise_name}" --exercise-path "${TEMP_DIR}" > /dev/null 2>&1; then
        printf 'Generation failed for %s\n' "${exercise_name}"
        exit_code=1
        continue
    fi

    if ! diff -u -- "${original_test}" "${temp_test}"; then
        printf 'Mismatch detected in %s\n' "${exercise_name}"
        exit_code=1
    else
        printf '%s OK\n' "${exercise_name}"
    fi
done

exit "${exit_code}"
