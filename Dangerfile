message("Thank you for submitting this PR.")

# Ensure a clean commits history
if git.commits.any? { |c| c.message =~ /^Merge branch '#{github.branch_for_base}'/ }
  fail('Please rebase to get rid of the merge commits in this PR')
end

can_merge = github.pr_json["mergeable"]
warn("This PR cannot be merged yet.", sticky: false) unless can_merge

jsonpath = "lintreport.json"
contents = File.read jsonpath
#require "json"
#json = JSON.parse contents

message(contents)

#build/reports/errors.json
#message(message, sticky: true, file: nil, line: nil)