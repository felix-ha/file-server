package main

import "testing"

func TestExample(t *testing.T) {
	result := 2 + 2
	if result != 4 {
		t.Errorf("Expected result to be 4, got %d", result)
	}
}
