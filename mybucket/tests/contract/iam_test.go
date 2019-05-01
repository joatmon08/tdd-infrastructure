package test

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
	"os/exec"
	"strings"
	"testing"

	"github.com/joatmon08/tdd-infrastructure/mybucket/aws"
	"github.com/stretchr/testify/assert"
)

const BucketPolicyFilePath = "../../policies/bucket.json"
const AccountID = "REDACTED"

func getIAMOutput(t *testing.T, resource string) string {
	target := fmt.Sprintf("-target=%s", resource)
	cmd := exec.Command("terraform", "plan", "-state=tests/contract/test.tfstate", "-var-file=test.tfvars", "-lock=false", target)
	cmd.Dir = "../.."
	var out bytes.Buffer
	cmd.Stdout = &out
	err := cmd.Run()
	if err != nil {
		t.Error(err)
	}
	return out.String()
}

func getBucketInput(t *testing.T, policyPath string) *aws.Policy {
	jsonFile, err := os.Open(policyPath)
	if err != nil {
		t.Error(err)
	}
	defer jsonFile.Close()

	policyByteValue, _ := ioutil.ReadAll(jsonFile)

	var policy aws.Policy
	json.Unmarshal(policyByteValue, &policy)
	return &policy
}

func TestIAMHasExpectedWriteUserAndPolicy(t *testing.T) {
	iamPolicyOutput := getIAMOutput(t, "aws_iam_user_policy.bucket_write_user")
	bucketPolicyInput := getBucketInput(t, BucketPolicyFilePath)
	user := strings.Split(bucketPolicyInput.Statement[0].Principal.AWS, "/")[1]
	assert.Contains(t, iamPolicyOutput, user)
	assert.Contains(t, iamPolicyOutput, bucketPolicyInput.Statement[0].Action[0])
}

func TestIAMHasExpectedReadUserAndPolicy(t *testing.T) {
	iamPolicyOutput := getIAMOutput(t, "aws_iam_user_policy.bucket_read_user")
	bucketPolicyInput := getBucketInput(t, BucketPolicyFilePath)
	user := strings.Split(bucketPolicyInput.Statement[1].Principal.AWS, "/")[1]
	assert.Contains(t, iamPolicyOutput, user)
	assert.Contains(t, iamPolicyOutput, bucketPolicyInput.Statement[1].Action[0])
}

func TestIAMHasExpectedAdminRoleAndPolicy(t *testing.T) {
	iamPolicyOutput := getIAMOutput(t, "aws_iam_role_policy_attachment.bucket_admin_role")
	bucketPolicyInput := getBucketInput(t, BucketPolicyFilePath)
	role := strings.Split(bucketPolicyInput.Statement[2].Principal.AWS, "/")[1]
	assert.Contains(t, iamPolicyOutput, role)
	assert.Contains(t, iamPolicyOutput, bucketPolicyInput.Statement[2].Action[0])
}
