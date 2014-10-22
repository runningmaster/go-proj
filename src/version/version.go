package version

import "fmt"

// make build sets this automaticaly
var (
	BLDTIME string
	GITHEAD string
	VERSION string
)

func Print() string {
	return fmt.Sprintf("%s %s %s", BLDTIME, GITHEAD, VERSION)
}
