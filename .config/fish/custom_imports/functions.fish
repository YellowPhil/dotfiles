function zw
  eval $argv
  zellij pipe --name zj-status-bar:cli:tab_alert --args "pane_id=$ZELLIJ_PANE_ID,exit_code=$status"
end
