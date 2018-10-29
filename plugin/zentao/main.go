package main

import (
	"flag"
	"fmt"
	"os"

	zentaoapi "github.com/kai1987/zentao-api"
)

var (
	showHelp = flag.Bool("help", false, "show help")
	host     = flag.String("host", "", "specify host")
	account  = flag.String("account", "", "specify account")
	password = flag.String("password", "", "specify password")
	to       = flag.String("to", "", "specify to")
	title    = flag.String("title", "", "specify title")
	content  = flag.String("content", "", "specify content")
	product  = flag.Int("product", 0, "specify product")
	project  = flag.Int("project", 0, "specify project")
	module   = flag.Int("module", 0, "specify module")
)

func main() {
	flag.Parse()
	if *showHelp {
		flag.Usage()
		return
	}
	zentaoapi.Conf.Host = *host
	zentaoapi.Conf.Account = *account
	zentaoapi.Conf.Password = *password
	zentaoapi.Login()
	params := zentaoapi.BuildParamsBrief(*product, *project, *module, 3, *to, "code review", *title, *content)
	_, err := zentaoapi.New(*product, 0, 0, params)

	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	} else {
		os.Exit(0)
	}
}
