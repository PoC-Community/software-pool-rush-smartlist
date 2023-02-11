package Server

import (
	"github.com/joho/godotenv"
	"github.com/kelseyhightower/envconfig"
	"log"
)

type Spec struct {
	Port   string `envconfig:"SERVER_PORT"`
	Host   string `envconfig:"SERVER_HOST"`
	Secret string `envconfig:"JWT_SECRET"`
}

func importConfigFromEnvFile() Spec {
	err := godotenv.Load()
	if err != nil {
		log.Fatalf("Error loading .env file: %v", err)
	}
	var config Spec
	err = envconfig.Process("", &config)
	if err != nil {
		log.Fatalf("Error processing environment variables: %v", err)
	}
	return config
}

func GetConfig() Spec {
	config := importConfigFromEnvFile()
	return config
}
