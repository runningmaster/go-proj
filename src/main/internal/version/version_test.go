package version_test

import (
	"testing"

	"main/internal/version"
)

func TestPrint(t *testing.T) {
	version.BLDTIME, version.GITHEAD, version.VERSION = "x", "y", "z"
	got, want := version.Print(), "x y z"
	if got != want {
		t.Errorf("got %s, want %s", got, want)
	}
}

func BenchmarkPrint(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = version.Print()
	}
}
