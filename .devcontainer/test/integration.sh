#!/bin/bash
# Load framework
source .devcontainer/util/source_framework.sh

printInfoSection "Running integration Tests for $RepositoryName"

assertAceVersion "0.2.0"

assertRunningPod easytravel angular-frontend

assertRunningApp 30100


