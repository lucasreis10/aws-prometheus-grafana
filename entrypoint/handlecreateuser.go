package entrypoint

import (
	"net/http"

	"github.com/aws/aws-lambda-go/events"
)

func HandleCreateUser(req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {

	return events.APIGatewayProxyResponse{
		StatusCode: http.StatusCreated,
		Body:       "Created",
	}, nil

}
