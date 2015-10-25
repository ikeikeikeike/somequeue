package main

import (
	"os"
	"github.com/jrallison/go-workers"
)

type M map[string]interface{}

func main() {
	workers.Configure(map[string]string{
		"server":   "localhost:6379",
		"database": "0",
		"process":  "0",
	})

	workers.Enqueue("default", "ActiveJob::QueueAdapters::SidekiqAdapter::JobWrapper", []M{
		M{
			"queue_name": "default",
			"job_class":  "EchoJob",
			"arguments": []M{
				M{"goqueue": os.Args[1]},
			},
		},
	})
}
