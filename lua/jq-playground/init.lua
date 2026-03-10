local M = {}

function M.setup(opts)
  local confmod = require("jq-playground.config")

  confmod.config = vim.tbl_deep_extend("force", confmod.default_config, opts or {})

  vim.api.nvim_create_user_command("JqPlayground", function(params)
    require("jq-playground.playground").init_playground(params.fargs[1])
  end, {
    desc = "Start jq query editor and live preview",
    nargs = "?",
    complete = "file",
  })
end

function M.run_query()
  require("jq-playground.playground").run_query()
end

function M.get_bufs()
  return require("jq-playground.playground").get_bufs()
end

return M
