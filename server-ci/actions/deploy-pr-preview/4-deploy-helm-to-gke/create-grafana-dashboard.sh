#!/usr/bin/env bash
set -x
jq --arg app_name "$app_name" \
  --arg query0 "{cluster_name=\"${cluster_name}\",container=\"server\",namespace=\"${app_namespace}\"}" \
  --arg query1 "{cluster_name=\"${cluster_name}\",container=\"server-worker\",namespace=\"${app_namespace}\"}" \
  --arg query2 "{cluster_name=\"${cluster_name}\",container=\"server-beat\",namespace=\"${app_namespace}\"}" \
  --arg query3 "{cluster_name=\"${cluster_name}\",container=\"cp\",namespace=\"${app_namespace}\"}" \
  --arg query4 "{cluster_name=\"${cluster_name}\",container=\"server-cdc\",namespace=\"${app_namespace}\"}" \
  '.dashboard.panels[0].targets[0].expr = $query0
    | .dashboard.panels[1].targets[0].expr = $query1
    | .dashboard.panels[2].targets[0].expr = $query2
    | .dashboard.panels[3].targets[0].expr = $query3
    | .dashboard.panels[4].targets[0].expr = $query4
    | .dashboard.title = $app_name + "-logs"
    | .dashboard.tags += [$app_name]
    | .message = "Create " + $app_name + "-logs dashboard"' ${action_path}/server-logs.json > ${app_name}.json

response=$(curl -sS -XPOST -H "Authorization: Bearer ${grafana_api_key}" \
  -H "Content-Type: application/json" \
  -L ${grafana_host}/api/dashboards/db \
  -d @./${app_name}.json)

echo "::set-output name=url::$(echo ${response} | jq -r '.url')"
echo "::set-output name=uid::$(echo ${response} | jq -r '.uid')"
