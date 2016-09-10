message("Thank you for submitting this PR.")

# Ensure a clean commits history
if git.commits.any? { |c| c.message =~ /^Merge branch '#{github.branch_for_base}'/ }
  fail('Please rebase to get rid of the merge commits in this PR')
end

can_merge = github.pr_json["mergeable"]
warn("This PR cannot be merged yet.", sticky: false) unless can_merge

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

jsonpath2 = "build/reports/errors.json"
contents2 = File.read jsonpath2
json2 = JSON.parse contents2

message(contents2)

#build/reports/errors.json
#message(message, sticky: true, file: nil, line: nil)
