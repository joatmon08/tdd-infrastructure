package test

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
	"testing"

	"github.com/joatmon08/tdd-infrastructure/mybucket/aws"
	"github.com/stretchr/testify/assert"
)

const BucketPolicyFilePath = "../../policies/bucket.json"
const AccountID = "REDACTED"

func setup(t *testing.T, policyPath string) *aws.Policy {
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

func TestPolicyHasVersionAndID(t *testing.T) {
	policy := setup(t, BucketPolicyFilePath)
	assert.Equal(t, "2012-10-17", policy.Version)
	assert.Equal(t, "MyBucketPolicy", policy.ID)
	assert.Equal(t, 3, len(policy.Statement))
	assert.Equal(t, "AllowWriteUser", policy.Statement[0].Sid)
	assert.Equal(t, "AllowReadUser", policy.Statement[1].Sid)
	assert.Equal(t, "AllowAdminRole", policy.Statement[2].Sid)
}

func TestPolicyHasMyBucketWriteUserStatement(t *testing.T) {
	policy := setup(t, BucketPolicyFilePath)
	assert.Equal(t, "AllowWriteUser", policy.Statement[0].Sid)
	assert.Equal(t, "Allow", policy.Statement[0].Effect)
	assert.Contains(t, policy.Statement[0].Principal.AWS, fmt.Sprintf("arn:aws:iam::%s:user/MyBucketWriteUser", AccountID))
	assert.Equal(t, 1, len(policy.Statement[0].Action))
	assert.Contains(t, policy.Statement[0].Action, "s3:PutObject")
	assert.Contains(t, policy.Statement[0].Resource, "arn:aws:s3:::MyBucket/*")
}

func TestPolicyHasMyBucketReadUserStatement(t *testing.T) {
	policy := setup(t, BucketPolicyFilePath)
	assert.Equal(t, "AllowReadUser", policy.Statement[1].Sid)
	assert.Equal(t, "Allow", policy.Statement[1].Effect)
	assert.Contains(t, policy.Statement[1].Principal.AWS, fmt.Sprintf("arn:aws:iam::%s:user/MyBucketReadUser", AccountID))
	assert.Equal(t, 1, len(policy.Statement[1].Action))
	assert.Contains(t, policy.Statement[1].Action, "s3:GetObject")
	assert.Contains(t, policy.Statement[1].Resource, "arn:aws:s3:::MyBucket/*")
}

func TestPolicyHasMyBucketAdminRoleStatement(t *testing.T) {
	policy := setup(t, BucketPolicyFilePath)
	assert.Equal(t, "AllowAdminRole", policy.Statement[2].Sid)
	assert.Equal(t, "Allow", policy.Statement[2].Effect)
	assert.Contains(t, policy.Statement[2].Principal.AWS, fmt.Sprintf("arn:aws:iam::%s:role/MyBucketAdminRole", AccountID))
	assert.Equal(t, 1, len(policy.Statement[2].Action))
	assert.Contains(t, policy.Statement[2].Action, "s3:*")
	assert.Contains(t, policy.Statement[2].Resource, "arn:aws:s3:::MyBucket")
	assert.Contains(t, policy.Statement[2].Resource, "arn:aws:s3:::MyBucket/*")
}
