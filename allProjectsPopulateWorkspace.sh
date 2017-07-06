#!/bin/bash

if [ -d "./allProjects.xcworkspace" ]; then
  echo "Please remove allProjects.xcworkspace. This script recreates this file."
  exit 1;
fi

#creates all the xcode projects
for d in ./exercises/*/ ; do
    set -e -o pipefail # http://linuxcommand.org/lc3_man_pages/seth.html
    swift package -C $d generate-xcodeproj --output allProjects
done

#create a new blank copy of a workspace file with an scheme of AllTest
/bin/cp -rf allProjects.xcworkspace.source allProjects.xcworkspace

declare -a names
suffix=".xcodeproj/"
prefix="./allProjects/"
index=0

#This creates a workspace with an AllTest scheme to run all tests.
for p in ./allProjects/*/ ; do
	sed -i '' '/<\/Workspace>/i \
			<FileRef location = "group:'$p'"> </FileRef>' allProjects.xcworkspace/contents.xcworkspacedata
	name=${p#$prefix}
	name=${name%$suffix}
	names[$index]=$name;
	((index+=1))
	sed -i '' '/<Testables>/a \
        <TestableReference skipped = "NO"><BuildableReference BuildableIdentifier = "primary" BlueprintIdentifier = "OBJ_24" BuildableName = "'$name'Tests.xctest" BlueprintName = "'$name'Tests" ReferencedContainer = "container:'$p'"> </BuildableReference> </TestableReference>' allProjects.xcworkspace/xcshareddata/xcschemes/AllTest.xcscheme
	
done

echo "Now you can run the AllTests scheme on allProjects.xcworkspace";
