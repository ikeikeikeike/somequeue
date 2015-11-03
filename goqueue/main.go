package main

import (
	"fmt"
	"os"
	"runtime"

	"github.com/jrallison/go-workers"
)

type M map[string]interface{}

func main() {
	workers.Configure(map[string]string{
		"server":   "localhost:6379",
		"database": "0",
		"process":  fmt.Sprint(runtime.NumCPU()),
		"pool":     "30",
	})

	// Enqueue
	if len(os.Args) > 1 {
		workers.Enqueue("default", "ActiveJob::QueueAdapters::SidekiqAdapter::JobWrapper", []M{
			M{
				"queue_name": "default",
				"job_class":  "EchoJob",
				"arguments": []M{
					M{"goqueue": os.Args[1]},
				},
			},
		})
		return
	}

	// Run worker
	workers.Middleware.Append(&Hookable{})
	workers.Process("default", Echo, 10)
	go workers.StatsServer(8989)
	workers.Run()
}
