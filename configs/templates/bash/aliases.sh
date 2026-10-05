# Optional interactive Bash development aliases.
# Source provenance: abaltazapinto/scripts at c367a2fbef46eec94f16277a1c8e8bd4c2fda822
# LINUX_GERAIS/linux_pthreads_valgrind_commands.md, sections 1–4 and 8.
# No PATH, credentials, machine identifiers or automatic sourcing.
alias ll='ls -lah'
alias ccw='cc -Wall -Wextra -Werror'
alias ccwp='cc -Wall -Wextra -Werror -g -O0 -pthread'
alias val='valgrind --leak-check=full --show-leak-kinds=all'
alias valrace='valgrind --tool=helgrind'
