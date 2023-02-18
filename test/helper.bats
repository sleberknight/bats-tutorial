setup() {
    load 'test_helper/common-setup'
    _common_setup

    source "$PROJECT_ROOT/src/helper.sh"
}

# Not entirely sure why the tutorial uses the following files, since both
# are always different than the actual FIRST_RUN_FILE defined in project.sh

teardown() {
  rm -f "$NON_EXISTENT_FIRST_RUN_FILE"
  rm -f "$EXISTING_FIRST_RUN_FILE"
}

@test "Check first run" {
    NON_EXISTENT_FIRST_RUN_FILE=$(mktemp -u)  # only create the name, not the file itself

    assert _is_first_run
    refute _is_first_run
    refute _is_first_run

    EXISTING_FIRST_RUN_FILE=$(mktemp)
    refute _is_first_run
    refute _is_first_run
}
