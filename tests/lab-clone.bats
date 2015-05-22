#!/usr/bin/env bats

load test_helper

@test "without arguments, display usage" {
  run lab-clone

  assert_failure
  assert_line "Usage: lab clone <user>/<repo>"
}

@test "incorrect argument, display usage" {
  run lab-clone first_arg

  assert_failure
  assert_line "Usage: lab clone <user>/<repo>"
}

@test "too many arguments, display usage" {
  run lab-clone a/b wrong

  assert_failure
  assert_line "Usage: lab clone <user>/<repo>"
}

@test "clone from the gitlab url" {
  mock_command git

  run lab-clone user/repo

  assert_success "git clone gitlab@${GITLAB_HOST}:user/repo.git user/repo"
}
