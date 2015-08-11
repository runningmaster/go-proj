package main

import (
	"testing"
)

func TestRangeN(t *testing.T) {
	got, want := rangeN(5), 5
	if got != want {
		t.Errorf("got %d, want %d", got, want)
	}
}

func BenchmarkRangeN(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = rangeN(1000)
	}
}

func BenchmarkRangeN2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = rangeN2(1000)
	}
}
