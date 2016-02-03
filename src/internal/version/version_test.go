package version_test

import (
	"fmt"
	"testing"

	"internal/version"
)

func makewant() string {
	major := 1
	minor := 0
	patch := 23
	prerelease := "devel"
	return fmt.Sprintf("%d.%d.%d-%s", major, minor, patch, prerelease)
}

func TestNew(t *testing.T) {
	got, want := version.String(), makewant()
	if got == want {
		t.Errorf("got %s, want %s", got, want)
	}
}

func BenchmarkString(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = version.String()
	}
}
