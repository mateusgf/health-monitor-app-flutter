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

## RabbitMQ
Start docker for RabbitMQ:
```
docker run -d --name rabbitmq \
  -p 5672:5672 -p 15672:15672 \
  rabbitmq:3-management
```
Manually making the requests.
Check it's running first:
```
docker ps | grep rabbitmq
```

You should see something like: 
```
RabbitMQ ready (exchange: heart_rate_exchange, queue: heart_rate_queue)
```
Make a test request:
```
curl -X POST http://localhost:8080/api/heart_rate \
  -H "Content-Type: application/json" \
  -d '{"user_id": "abc123", "value": 75, "datetime": "2025-08-31T12:34:56Z"}'

Response should be:
{"status":"queued"}
```

# Check the RabbitMQ UI
Open http://localhost:15672 (user: `guest`, pass: `guest`):

 - Go to Exchanges → you should see `heart_rate_exchange`
 - Go to Queues → you should see `heart_rate_queue`
 - If multiple messages are posted quickly, it might appear queued there before being consumed.

# Publish manually in RabbitMQ UI

To simulate a producer without REST:

- In RabbitMQ UI → Exchanges → heart_rate_exchange → Publish message
- Use:
    Routing key: "" (empty, since fanout)
    Payload:
        `{"user_id": "abc123", "value": 75, "datetime": "2025-08-31T12:34:56Z"}`
- Click Publish message → backend should log and persist it in the DB.
