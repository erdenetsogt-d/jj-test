package main

import (
  "github.com/labstack/echo/v4"
   "net/http"
)

func main() {


    router := NewRouter()

    router.Logger.Fatal(router.Start(":8000"))
}
func NewRouter() *echo.Echo {
    e := echo.New()

    e.GET("/", hello)

    return e
}
func hello(c echo.Context) error {

  return c.String(http.StatusOK, "Hello, World!")
}
