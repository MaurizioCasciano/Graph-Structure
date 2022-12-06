#!/bin/bash -eu

# turn on bash's job control
set -m

# Start the primary process and put it in the background
echo "Starting Neo4j in background"

/startup/docker-entrypoint.sh neo4j &

# Wait for Neo4j
echo "Checking to see if Neo4j has started..."
wget --quiet --tries=10 --waitretry=10 -O /dev/null "http://${HOST}:${HTTP_PORT}"
echo "Confirming Neo4j has started"

# Execute Neo4j scripts
cypher-shell -a "neo4j://${HOST}:${BOLT_PORT}" -u "${ADMIN_NEO4J_USERNAME}" \
  -p "${ADMIN_NEO4J_PASSWORD}" -d system -P "username => '${GRAPH_NEO4J_USERNAME}'" \
  -P "password => '${GRAPH_NEO4J_PASSWORD}'" -f /neo4j/cypher-scripts/create-user.cypher

echo "Bringing Neo4j into the foreground"
# now we bring the primary process back into the foreground and leave it there
fg %1
