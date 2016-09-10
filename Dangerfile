message("Thank you for submitting this PR.")

xcodebuild.parse_warnings
xcodebuild.parse_errors
xcodebuild.parse_tests

can_merge = github.pr_json["mergeable"]
warn("This PR cannot be merged yet.", sticky: false) unless can_merge

xcodebuild.perfect_build if can_merge

