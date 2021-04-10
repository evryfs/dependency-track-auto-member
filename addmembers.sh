#!/usr/bin/env bash

apicall() {
  curl -s -H "X-Api-Key: ${API_KEY}" -H "Content-type: application/json" "$@"
}

readonly PORTFOLIO_TEAM_UUID=$(apicall ${API_BASE}/team | jq -r '.[] | select(.name=="Portfolio Managers") | .uuid')

for user in $(apicall ${API_BASE}/user/oidc | jq -r '.[].username'); do
  apicall -XPOST -d "{ \"uuid\": \"${PORTFOLIO_TEAM_UUID}\"}" ${API_BASE}/user/${user}/membership
done
