#!/usr/bin/env bash

OPERATOR_NAMESPACE="yks"

if [[ -z "${TMP_DIR}" ]]; then
  TMP_DIR=".tmp"
fi
mkdir -p "${TMP_DIR}"

YAML_FILE=${TMP_DIR}/amq-subscription.yaml

set -e

echo "Removing AMQ operator from ${OPERATOR_NAMESPACE} namespace"
kubectl delete -f ${YAML_FILE} -n "${OPERATOR_NAMESPACE}"

set +e
#
#sleep 2
#count=0
#while kubectl get csv -n "${OPERATOR_NAMESPACE}" | grep -q strimzi-cluster-operator; do
#  if [[ $count -eq 10 ]]; then
#    echo "Timed out waiting for AMQ CSV to be deleted from ${OPERATOR_NAMESPACE}"
#    exit 1
#  fi
#
#  echo "Waiting for AMQ CSV to be deleted from ${OPERATOR_NAMESPACE}"
#  sleep 15
#  count=$((count+1))
#done
