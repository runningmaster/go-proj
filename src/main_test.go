package main

import (
	"testing"
)

func TestRangeN(t *testing.T) {
	got, want := rangeN(5), 5
	if got != want {
		t.Errorf("print(): expected %d, actual %d", want, got)
	}
}

func BenchmarkRangeN(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = rangeN(1000)
	}
}
