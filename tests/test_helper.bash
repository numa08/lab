export LAB_TEST_DIR="${BATS_TMPDIR}/lab"

export LAB_CWD="${LAB_TEST_DIR}/cwd"

export PATH="${BATS_TEST_DIRNAME}/../libexec:$PATH"

export GITLAB_HOST="gitlab.server.com"

mkdir -p "${LAB_TEST_DIR}"
mkdir -p "${LAB_CWD}"

setup() {
  cd ${LAB_CWD}
}

teardown() {
  rm -rf "${LAB_TEST_DIR}"
}

load lib/assertions
load lib/mocks
