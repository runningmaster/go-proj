//go:generate go run gen.go

package version

import (
	"fmt"
	"os"
	"path/filepath"
	"strconv"
	"strings"
)

// String returns the version according to http://semver.org/
func String() string {
	s := strings.Join(
		[]string{
			strconv.Itoa(major),
			strconv.Itoa(minor),
			strconv.Itoa(patch),
		},
		".",
	)
	if prerelease != "" {
		s = fmt.Sprintf("%s-%s", s, prerelease)
	}
	return s
}

// StringFull returns the version with build metadata
func StringFull() string {
	return fmt.Sprintf("%s+%s.%s", String(), buildtime, gitcommit)
}

// Reset changes default autogenerated main version values
func Reset(mjr, mnr, ptch int, pre string) {
	major = mjr
	minor = mnr
	patch = ptch
	prerelease = cleanup(pre)
}

// FIXME (for testing golint)
func AppName() string {
	return filepath.Base(os.Args[0])
}

func cleanup(s string) string {
	r := strings.NewReplacer(
		"-", "",
		"+", "",
	)
	return r.Replace(s)
}