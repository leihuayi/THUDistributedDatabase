#/bin/bash
# ./2-remove_node_tempo.sh "SELECT id from thudb.\"user\" ORDER BY id DESC LIMIT 5;"
cd databases

echo ">>>> First, we gonna do a SQL query : $1 on a specific port 25258"
echo
read -p "Press enter to make the query"
echo "echo $1 | cockroach sql --insecure --port=25258"
echo "=========================="
echo $1 | cockroach sql --insecure --port=25258
echo "=========================="

echo
read -p "Press enter to stop a node on port 25258"
echo "cockroach quit --insecure --port=26258"
cockroach quit --insecure --port=25258

echo
echo "We gonna do the query on the same node, we prove that it is down"
read -p "Press enter to make the query"
echo "=========================="

echo "echo $1 | cockroach sql --insecure --port=25258"
echo $1 | cockroach sql --insecure --port=25258
echo "=========================="

echo
echo ">>>> We gonna restart it again. And see, what happened to the data we just added."
read -p "Press enter to start it again"
echo "cockroach start --insecure \
--locality=datacenter=hk-1 \
--store=THUddb-2 \
--host=localhost \
--port=25258 \
--http-port=8081 \
--cache=100MB \
--join=localhost:26257,localhost:26258,localhost:26259 &
"
cockroach start --insecure \
--locality=datacenter=hk-1 \
--store=THUddb-2 \
--host=localhost \
--port=25258 \
--http-port=8081 \
--cache=100MB \
--join=localhost:26257,localhost:26258,localhost:26259 &

echo
echo ">>>> What happened to the node?"
read -p "Press enter to make the query"

echo "=========================="
echo "echo $1 | cockroach sql --insecure --port=25258"
echo $1 | cockroach sql --insecure --port=25258
echo "=========================="

cd ..