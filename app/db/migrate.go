package main

import (
  "revel-docker/app/models"
)

func main(){
    DB.CreateTable(&users.User{})
}