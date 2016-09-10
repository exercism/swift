message("Thank you for submitting this PR.")



# Ensure a clean commits history
if git.commits.any? { |c| c.message =~ /^Merge branch '#{github.branch_for_base}'/ }
  fail('Please rebase to get rid of the merge commits in this PR')
end

can_merge = github.pr_json["mergeable"]
warn("This PR cannot be merged yet.", sticky: false) unless can_merge

xcodebuild = DangerXcodebuild.new(nil)

xcodebuild.parse_warnings
xcodebuild.parse_errors
xcodebuild.parse_tests
xcodebuild.perfect_build if can_merge

