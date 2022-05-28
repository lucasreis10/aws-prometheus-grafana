package repository

import (
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/dynamodb"
)

const AWS_REGION = "us-east-1"
const TABLE_NAME = "user"

var db = dynamodb.New(session.New(), aws.NewConfig().WithRegion(AWS_REGION))
