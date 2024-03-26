NAME=$1
PROVIDER=$2
CLUSTER=$3
REGION=$4
NODE_SIZE=$5
VERSION=$6
MIN_NODE_COUNT=$7

FILE_PATH=infra/${NAME}-cluster.yaml

cp crossplane/cluster-template.yaml $FILE_PATH
yq --inplace ".metadata.name = \"${NAME}\"" $FILE_PATH
yq --inplace ".spec.id = \"${NAME}\"" $FILE_PATH
yq --inplace ".spec.compositionSelector.matchLabels.provider = \"${PROVIDER}\"" $FILE_PATH
yq --inplace ".spec.compositionSelector.matchLabels.cluster = \"${CLUSTER}\"" $FILE_PATH
yq --inplace ".spec.parameters.region = \"${REGION}\"" $FILE_PATH
yq --inplace ".spec.parameters.nodeSize = \"${NODE_SIZE}\"" $FILE_PATH
yq --inplace ".spec.parameters.version = \"${VERSION}\"" $FILE_PATH
yq --inplace ".spec.parameters.minNodeCount = ${MIN_NODE_COUNT}" $FILE_PATH
