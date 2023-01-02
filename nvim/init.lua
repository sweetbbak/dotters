if pcall(require, "hotpot") then
    -- Setup hotpot.nvim
    require("hotpot").setup({
        provide_require_fennel = true,
        enable_hotpot_diagnostics = false,
        compiler = {
            modules = {
                -- not default but recommended, align lua lines with fnl source
                -- for more debuggable errors, but less readable lua.
                correlate = true,
            },
            macros = {
                -- allow macros to access vim global, needed for nyoom modules
                env = "_COMPILER",
                compilerEnv = _G,
                allowGlobals = true,
            },
        },
    })
    require("core")
else
    print("Unable to require hotpot")
end
