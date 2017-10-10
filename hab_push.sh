#!/bin/bash

# This should not be used.  It is now using the build services from habitat.
# hab studio run "build . && hab pkg export docker jmaya/mediahub" && source results/last_build.env && hab pkg upload results/$pkg_artifact
hab studio run "build ." && source results/last_build.env && hab pkg upload results/$pkg_artifact
