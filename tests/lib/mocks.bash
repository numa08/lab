mock_command() {
  local command="$1"

  mkdir -p "${LAB_TEST_DIR}/path/$command"

  cat > "${LAB_TEST_DIR}/path/$command/$command" <<SH
#!/usr/bin/env bash

echo "$command \$@"
SH

  chmod +x "${LAB_TEST_DIR}/path/$command/$command"
  export PATH="${LAB_TEST_DIR}/path/$command:$PATH"
}
