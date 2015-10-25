package main

import (
	"os"

	"github.com/jrallison/go-workers"
)

type Map map[string]interface{}
type Maps []Map

func main() {
	workers.Configure(map[string]string{
		"server":   "localhost:6379",
		"database": "0",
		"process":  "0",
		"pool":     "30",
	})

	workers.Enqueue("default", "ActiveJob::QueueAdapters::SidekiqAdapter::JobWrapper", Maps{
		Map{
			"queue_name": "default",
			"job_class":  "EchoJob",
			"arguments": Maps{
				Map{"goqueue": os.Args[1]},
			},
		},
	})
}
