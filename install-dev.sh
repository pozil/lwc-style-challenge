#!/bin/bash

# Set parameters
ORG_ALIAS="style"

echo ""
echo "Installing LWC Style Challenge DEV org ($ORG_ALIAS)"
echo ""

# Install script
echo "Cleaning previous scratch org..."
sfdx force:org:delete -p -u $ORG_ALIAS &> /dev/null
echo ""

echo "Creating scratch org..." && \
sfdx force:org:create -s -f config/project-scratch-def.json -d 30 -a $ORG_ALIAS && \
echo "" && \

echo "Pushing source..." && \
sfdx force:source:push -u $ORG_ALIAS && \
echo "" && \

echo "Assigning permission sets..." && \
sfdx force:user:permset:assign -n LWC_Style_Challenge -u $ORG_ALIAS && \
echo "" && \

echo "Opening org..." && \
sfdx force:org:open -p lightning/n/LWC_Style_Challenge -u $ORG_ALIAS && \
echo ""

EXIT_CODE="$?"
echo ""

# Check exit code
echo ""
if [ "$EXIT_CODE" -eq 0 ]; then
  echo "Installation completed."
else
    echo "Installation failed."
fi
exit $EXIT_CODE
