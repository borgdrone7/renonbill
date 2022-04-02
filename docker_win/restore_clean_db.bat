docker-compose -f renonbill.yml -p renonbill down --remove-orphans
docker-compose -f renonbill.yml -p renonbill up -d --build db
docker exec -it renonbill_db_1 bash -c "sleep 10s"
docker exec -it renonbill_db_1 bash -c "psql -U renonbill -d postgres -c 'DROP DATABASE IF EXISTS renonbill;'"
docker exec -it renonbill_db_1 bash -c "psql -U renonbill -d postgres -c 'CREATE DATABASE renonbill;'"
docker exec -it renonbill_db_1 bash -c "psql -U renonbill -d renonbill -f /db/clean_db.sql"
docker-compose -f renonbill.yml -p renonbill down --remove-orphans
