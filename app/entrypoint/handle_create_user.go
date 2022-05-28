package entrypoint

import (
	"encoding/json"
	"net/http"
	"observability/repository"

	"github.com/aws/aws-lambda-go/events"
)

func HandleCreateUser(req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {

	var user repository.User
	err := json.Unmarshal([]byte(req.Body), &user)
	if err != nil {
		return events.APIGatewayProxyResponse{
			StatusCode: http.StatusInternalServerError,
			Body:       err.Error(),
		}, nil
	}

	repository.CreateUser(user)

	return events.APIGatewayProxyResponse{
		StatusCode: http.StatusCreated,
		Body:       "Created",
	}, nil

}
