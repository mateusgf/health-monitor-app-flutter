# Golang backend for health app

## Run the server
```
go run main.go
```

## Run the migrations
```
# Up
migrate -database "postgres://<user>:<password>@localhost:5432/<db_name>?sslmode=disable" -path migrations up

# Down
migrate -database "postgres://<user>:<password>@localhost:5432/<db_name>?sslmode=disable" -path migrations down
```

## Create a new migration
```
migrate create -ext sql -dir migrations -seq <migration_name>
```
