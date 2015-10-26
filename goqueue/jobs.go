package main

import (
	"github.com/jrallison/go-workers"
	"github.com/k0kubun/pp"
)

type Hookable struct{}

func (r *Hookable) Call(queue string, msg *workers.Msg, next func() bool) (acknowledge bool) {
	// pp.Println(queue, msg, next)
	// do something before each message is processed
	acknowledge = next()
	// do something after each message is processed
	return
}

func Echo(msg *workers.Msg) {
	pp.Println("Echo", msg)
	// message.Jid()
	// message.Args() is a wrapper around go-simplejson (http://godoc.org/github.com/bitly/go-simplejson)
}
