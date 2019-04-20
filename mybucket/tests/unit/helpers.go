package test

import (
	"encoding/json"
	"io/ioutil"
	"os"
	"testing"
)

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

func setup(t *testing.T, policyPath string) *Policy {
	jsonFile, err := os.Open(policyPath)
	if err != nil {
		t.Error(err)
	}
	defer jsonFile.Close()

	policyByteValue, _ := ioutil.ReadAll(jsonFile)

	var policy Policy
	json.Unmarshal(policyByteValue, &policy)
	return &policy
}
