# Set the following for your specific environment
# Already have a Cluster? Set these values to point to your existing environment
# Otherwise, these values will be used to create a new Cluster

# Set `project` to reference your own Google Cloud Project
# If you already have a Google Cloud Project, then set this variable to reference the existing project.
# Otherwise, create a new Google Cloud Project and then set this variable to the new Project
# In either case, remember to enable Kubernetes for this project
#
# Sample value:
#project ?= camunda-researchanddevelopment

ifndef project
$(error 'project' is mandatory. To fix, edit file: $(root)/google/config/properties.mk )
endif

# Set which Google Cloud 'region' to use
# see: https://cloud.withgoogle.com/region-picker/
# Sample value:
#region ?= us-central1-a

ifndef region
$(error 'region' is mandatory. To fix, edit file: $(root)/google/config/properties.mk )
endif

# Set 'clusterName'
# This controls the name of the GKE cluster in use.
# If you already have a GKE cluster that you want to use, set the name of the existing GKE cluster here.
# If you do not yet have a GKE cluster, then running `make kube` will create a new GKE cluster with the name set here
# Sample value:
#clusterName ?= camunda-01

ifndef clusterName
$(error 'clusterName' is mandatory. To fix, edit file: $(root)/google/config/properties.mk )
endif

machineType ?= n1-standard-16
minSize ?= 1
maxSize ?= 6

# Camunda components will be installed into the following Kubernetes namespace
namespace ?= camunda
