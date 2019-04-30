package test

import (
	"bytes"
	"fmt"
	"os/exec"
	"testing"

	"github.com/stretchr/testify/assert"
)

const AccountID = "REDACTED"

func setup(t *testing.T, resource string) string {
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

func TestIAMHasExpectedWriteUserAndPolicy(t *testing.T) {
	policy := setup(t, "aws_iam_user_policy.bucket_write_user")
	assert.Contains(t, policy, "MyBucketWriteUser")
	assert.Contains(t, policy, "s3:PutObject")
}

func TestIAMHasExpectedReadUserAndPolicy(t *testing.T) {
	policy := setup(t, "aws_iam_user_policy.bucket_read_user")
	assert.Contains(t, policy, "MyBucketReadUser")
	assert.Contains(t, policy, "s3:GetObject")
}

func TestIAMHasExpectedAdminRoleAndPolicy(t *testing.T) {
	policy := setup(t, "aws_iam_role_policy_attachment.bucket_admin_role")
	assert.Contains(t, policy, "MyBucketAdminRole")
	assert.Contains(t, policy, "s3:*")
}
