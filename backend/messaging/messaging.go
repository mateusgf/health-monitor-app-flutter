package messaging

import (
	"log"

	"github.com/streadway/amqp"
)

var Conn *amqp.Connection
var Channel *amqp.Channel

func InitRabbitMQ() {
	var err error
	// Default RabbitMQ on Docker
	// @TODO: make this configurable for prod deployments
	Conn, err = amqp.Dial("amqp://guest:guest@localhost:5672/")
	if err != nil {
		log.Fatalf("Failed to connect to RabbitMQ: %v", err)
	}

	Channel, err = Conn.Channel()
	if err != nil {
		log.Fatalf("Failed to open a channel: %v", err)
	}

	err = Channel.ExchangeDeclare(
		"heart_rate_exchange", // name
		"fanout",              // type
		true,                  // durable
		false,                 // auto-delete
		false,                 // internal
		false,                 // no-wait
		nil,                   // args
	)
	if err != nil {
		log.Fatalf("Failed to declare exchange: %v", err)
	}

	_, err = Channel.QueueDeclare(
		"heart_rate_queue", // name
		true,               // durable
		false,              // delete when unused
		false,              // exclusive
		false,              // no-wait
		nil,                // args
	)
	if err != nil {
		log.Fatalf("Failed to declare queue: %v", err)
	}

	err = Channel.QueueBind(
		"heart_rate_queue",
		"",
		"heart_rate_exchange",
		false,
		nil,
	)
	if err != nil {
		log.Fatalf("Failed to bind queue: %v", err)
	}

	// UserDailyData queue & exchange
	err = Channel.ExchangeDeclare(
		"user_daily_data_exchange",
		"fanout",
		true,
		false,
		false,
		false,
		nil,
	)
	if err != nil {
		log.Fatalf("Failed to declare user_daily_data exchange: %v", err)
	}

	_, err = Channel.QueueDeclare(
		"user_daily_data_queue",
		true,
		false,
		false,
		false,
		nil,
	)
	if err != nil {
		log.Fatalf("Failed to declare user_daily_data queue: %v", err)
	}

	err = Channel.QueueBind(
		"user_daily_data_queue",
		"",
		"user_daily_data_exchange",
		false,
		nil,
	)
	if err != nil {
		log.Fatalf("Failed to bind user_daily_data queue: %v", err)
	}

	log.Println("RabbitMQ ready (exchange: heart_rate_exchange, queue: heart_rate_queue)")
}
