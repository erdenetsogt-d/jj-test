package main

import (
    "net/http"
    "net/http/httptest"
    "testing"
    "github.com/stretchr/testify/assert"
)

func TestHelllo(t *testing.T) {
    router := NewRouter()

    req := httptest.NewRequest("GET", "/", nil)
    rec := httptest.NewRecorder()

    router.ServeHTTP(rec, req)

    assert.Equal(t, http.StatusOK, rec.Code)
    assert.Equal(t, "Hello, World!", rec.Body.String())
}
