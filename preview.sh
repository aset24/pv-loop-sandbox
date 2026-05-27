#!/bin/sh
# Open the PV loop sandbox in Safari. Safari is the right preview
# browser because PowerPoint Web Viewer on Mac uses the same WebKit
# engine -- if it renders correctly in Safari, it will render
# correctly in the embed.
#
# Usage:  ./preview.sh
cd "$(dirname "$0")" || exit 1
open -a Safari pv_loop_sandbox.html
