#Use Go v1.20 as the base image

FROM golang:1.20-alpine
#Set the working directory to /app

WORKDIR /app
#Copy the rest of the backend code to the container

COPY . .
#Build the Go application

RUN go mod tidy

RUN go build Rush
#Expose port 8080 for the API to listen on

EXPOSE 3000
#Set the command to start the API

CMD ["./Rush"]
