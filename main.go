package main

import (
	"net/http"
	"observability/entrypoint"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

func router(req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {

	if req.HTTPMethod == "POST" {
		return entrypoint.HandleCreateUser(req)
	}

	return events.APIGatewayProxyResponse{
		StatusCode: http.StatusMethodNotAllowed,
		Body:       http.StatusText(http.StatusMethodNotAllowed),
	}, nil
}

func main() {
	lambda.Start(router)
}
