message("Thank you for submitting this PR.")

# Ensure a clean commits history
if git.commits.any? { |c| c.message =~ /^Merge branch '#{github.branch_for_base}'/ }
  fail('Please rebase to get rid of the merge commits in this PR')
end
can_merge = github.pr_json["mergeable"]
warn("This PR cannot be merged yet.", sticky: false) unless can_merge

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500

#ENSURE THERE IS A SUMMARY FOR A PR
warn("Please provide a summary in the Pull Request description") if github.pr_body.length < 5

# LINT Comments in for each Line
jsonpath = "lintreport.json"
contents = File.read jsonpath
require "json"
if contents.to_s == '' 
	contents = "[]"
end 
json = JSON.parse contents
json.each do |object|
   shortFile =  object["file"]
   shortFile ["/Users/travis/build/exercism/xswift/"] = "/"
   warn(message: object["reason"], file: shortFile, line: object["line"])
end

# Reports if the test passed
jsonpath2 = "build/reports/errors.json"
contents2 = File.read jsonpath2
json2 = JSON.parse contents2
firstStrinInArray = json2["tests_summary_messages"][0]
message(firstStrinInArray)



