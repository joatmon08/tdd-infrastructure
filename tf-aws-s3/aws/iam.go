package aws

type Principal struct {
	AWS string `json:"AWS"`
}

type Statement struct {
	Sid       string    `json:"Sid"`
	Effect    string    `json:"Effect"`
	Principal Principal `json:"Principal"`
	Action    []string  `json:"Action"`
	Resource  []string  `json:"Resource"`
}

type Policy struct {
	Version   string      `json:"Version"`
	ID        string      `json:"Id"`
	Statement []Statement `json:"Statement"`
}
