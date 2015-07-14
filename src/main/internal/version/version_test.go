package version

import (
	"testing"
)

func TestPrint(t *testing.T) {
	BLDTIME, GITHEAD, VERSION = "x", "y", "z"
	got, want := Print(), "x y z"
	if got != want {
		t.Errorf("print(): expected %s, actual %s", want, got)
	}
}

func BenchmarkPrint(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = Print()
	}
}
