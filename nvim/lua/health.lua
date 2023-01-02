 local _local_1_ = require("core.lib.autoload") local autoload = _local_1_["autoload"]
 local _local_2_ = autoload("core.lib") local nil_3f = _local_2_["nil?"]
 local config = autoload("lspconfig")
 local _local_3_ = vim.health local report_start_21 = _local_3_["report_start"]
 local report_info_21 = _local_3_["report_info"]
 local report_ok_21 = _local_3_["report_ok"]
 local report_warn_21 = _local_3_["report_warn"]
 local report_error_21 = _local_3_["report_error"]

 local function executable_3f(command) _G.assert((nil ~= command), "Missing argument command on /home/sweet/.config/nvim/fnl/modules/editor/format/config.fnl:10")
 return (1 == vim.fn.executable(command)) end

 local function report_21(name) _G.assert((nil ~= name), "Missing argument name on /home/sweet/.config/nvim/fnl/modules/editor/format/config.fnl:13")
 assert(("string" == type(name)), "expected string for name")
 local command do local t_4_ = config if (nil ~= t_4_) then t_4_ = (t_4_)[name] else end if (nil ~= t_4_) then t_4_ = (t_4_).cmd else end if (nil ~= t_4_) then t_4_ = (t_4_)[1] else end command = t_4_ end
 if nil_3f(command) then
 return report_warn_21(string.format("**%s**: the command is not defined.", name)) elseif executable_3f(command) then

 return report_ok_21(string.format("**%s**: the command '_%s_' is executable.", name, command)) else

 return report_error_21(string.format("**%s**: the command '_%s_' is not executable.", name, command)) end end


 local function check_21()
 report_start_21("LSP server executables")
 local configured_servers = config.available_servers() local configured_servers0
 do table.sort(configured_servers) configured_servers0 = configured_servers end

 if (0 == #configured_servers0) then
 return report_info_21("no lsp servers have been configured.") else
 for _, server in ipairs(configured_servers0) do
 report_21(server) end return nil end end

 return {check = check_21}