#!/bin/bash

hab studio run "build ." && source results/last_build.env && hab pkg upload results/$pkg_artifact
