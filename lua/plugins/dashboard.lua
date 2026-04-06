local p = require("config.colorpalette")

-- ── Highlights ────────────────────────────────────────────────────────────────
local function set_hl()
    vim.api.nvim_set_hl(0, "DashHeader",    { fg = p.cursor,        bold = true })
    vim.api.nvim_set_hl(0, "DashTitle",     { fg = p.purple_bright, bold = true })
    vim.api.nvim_set_hl(0, "DashSubtitle",  { fg = p.purple })
    vim.api.nvim_set_hl(0, "DashKey",       { fg = p.cursor,        bold = true })
    vim.api.nvim_set_hl(0, "DashLabel",     { fg = p.fg })
    vim.api.nvim_set_hl(0, "DashDim",       { fg = p.fg_dim })
    vim.api.nvim_set_hl(0, "DashFile",      { fg = p.lavender })
    vim.api.nvim_set_hl(0, "DashFilePath",  { fg = p.fg_dim,        italic = true })
    vim.api.nvim_set_hl(0, "DashSeparator", { fg = p.purple_bright })
    vim.api.nvim_set_hl(0, "DashInfo",      { fg = p.cyan })
    vim.api.nvim_set_hl(0, "DashBattery",   { fg = p.green })
    vim.api.nvim_set_hl(0, "DashBatteryLow",{ fg = p.mode_replace })
end

-- ── Utils ─────────────────────────────────────────────────────────────────────
local function get_battery()
    local raw = vim.fn.system("WMIC Path Win32_Battery Get EstimatedChargeRemaining /Value 2>nul")
    local pct = raw:match("EstimatedChargeRemaining=(%d+)")
    if pct then
        local n = tonumber(pct)
        local icon = n > 80 and "󰁹" or n > 60 and "󰂀" or n > 40 and "󰁾" or n > 20 and "󰁼" or "󰁺"
        return icon .. " " .. pct .. "%", n
    end
    return "󰁹 100%", 100  -- PC sense bateria
end

local function get_uptime()
    local raw = vim.fn.system(
        'powershell -NoProfile -Command "(New-TimeSpan -Start (gcim Win32_OperatingSystem).LastBootUpTime).ToString(\'d\\d\\ hh\\h\\ mm\\m\')" 2>nul'
    )
    raw = raw:gsub("%s+", "")
    if raw == "" then return "N/A" end
    return raw
end

local function get_datetime()
    return os.date("  %A, %d %B %Y     %H:%M")
end

local function get_cwd()
    local cwd = vim.fn.getcwd()
    -- Escurça el path si és molt llarg
    if #cwd > 50 then
        cwd = "…" .. cwd:sub(-47)
    end
    return " " .. cwd
end

local function get_recent_files(max)
    max = max or 8
    local files = {}
    for _, f in ipairs(vim.v.oldfiles) do
        if vim.fn.filereadable(f) == 1 then
            table.insert(files, f)
            if #files >= max then break end
        end
    end
    return files
end

-- ── Render ────────────────────────────────────────────────────────────────────
local function render(buf)
    if not vim.api.nvim_buf_is_valid(buf) then return end

    local width   = vim.api.nvim_win_get_width(0)
    local battery, batt_pct = get_battery()
    local uptime  = get_uptime()
    local datetime = get_datetime()
    local cwd     = get_cwd()
    local files   = get_recent_files(8)

    local function center(s)
        local pad = math.max(0, math.floor((width - vim.fn.strwidth(s)) / 2))
        return string.rep(" ", pad) .. s
    end

    local logo = {
        "                                                     ",
        "                                                     ",
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        "                                                     ",
	"────────────────── by Alex P ────────────────────────"
    }

    -- Construeix les línies i els highlights
    local lines     = {}
    local highlights = {}  -- { line, col_start, col_end, hl_group }

    local function add(text, hl, centered)
        local l = centered ~= false and center(text) or text
        table.insert(lines, l)
        if hl then
            local row = #lines - 1
            local col = l:find(vim.pesc(text:sub(1,1))) or 0
            table.insert(highlights, { row, col - 1, col - 1 + #l, hl })
        end
    end

    local function sep()
        local s = string.rep("─", math.floor(width * 0.6))
        add(s, "DashSeparator")
    end

    -- Logo
    for _, line in ipairs(logo) do
        add(line, "DashHeader")
    end

    -- Info sistema
    -- sep()
    add(datetime,              "DashInfo")
    add(" " .. cwd,           "DashDim")
    add("󰔟 Uptime: " .. uptime, "DashInfo")

    -- Bateria
    local batt_hl = batt_pct <= 20 and "DashBatteryLow" or "DashBattery"
    add(battery, batt_hl)
    sep()

    -- Fitxers recents
    add("  Recent Files", "DashTitle")
    add("", nil)

    local keys = { "a", "s", "d", "f", "g", "h", "j", "k" }
    -- Padding basat en display width (suporta unicode/accents)
    local function pad(s, width)
        local sw = vim.fn.strwidth(s)
        if sw >= width then return s end
        return s .. string.rep(" ", width - sw)
    end

    for i, filepath in ipairs(files) do
        local key      = keys[i] or tostring(i)
        local fname    = vim.fn.fnamemodify(filepath, ":t")
        local fdir     = vim.fn.fnamemodify(filepath, ":~:h")
        if vim.fn.strwidth(fdir) > 35 then
            fdir = "…" .. fdir:sub(-32)
        end
        local entry = "  [" .. key .. "]  " .. pad(fname, 32) .. "  " .. pad(fdir, 35)
        local row = #lines
        local line = center(entry)
        table.insert(lines, line)
        -- Highlights per parts
        local key_s = line:find("%[" .. key .. "%]")
        if key_s then
            table.insert(highlights, { row, key_s - 1, key_s + #key + 1, "DashKey" })
        end
        local fname_s = line:find(vim.pesc(fname))
        if fname_s then
            table.insert(highlights, { row, fname_s - 1, fname_s - 1 + #fname, "DashFile" })
        end
        local fdir_s = line:find(vim.pesc(fdir))
        if fdir_s then
            table.insert(highlights, { row, fdir_s - 1, fdir_s - 1 + #fdir, "DashFilePath" })
        end
    end

    add("", nil)
    sep()
    add("  [q] Sortir    [e] Nou fitxer    [r] Refresh", "DashDim")

    -- Escriu al buffer
    vim.api.nvim_set_option_value("modifiable", true,  { buf = buf })
    vim.api.nvim_set_option_value("readonly",   false, { buf = buf })
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
    vim.api.nvim_set_option_value("readonly",   true,  { buf = buf })

    -- Aplica highlights
    local ns = vim.api.nvim_create_namespace("dashboard")
    vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
    for _, h in ipairs(highlights) do
        local row, cs, ce, hl = h[1], h[2], h[3], h[4]
        if cs >= 0 and ce > cs then
            pcall(vim.api.nvim_buf_add_highlight, buf, ns, hl, row, cs, ce)
        end
    end
end

-- ── Keymaps del dashboard ─────────────────────────────────────────────────────
local function setup_keymaps(buf)
    local keys = { "a", "s", "d", "f", "g", "h", "j", "k" }
    local files = get_recent_files(8)

    local opts = { buffer = buf, nowait = true, silent = true }

    -- Obre el fitxer corresponent a la tecla
    for i, key in ipairs(keys) do
        vim.keymap.set("n", key, function()
            if files[i] then
                vim.cmd("edit " .. vim.fn.fnameescape(files[i]))
            end
        end, opts)
    end

    vim.keymap.set("n", "q", "<cmd>qa<CR>",        opts)
    vim.keymap.set("n", "e", "<cmd>enew<CR>",       opts)
    vim.keymap.set("n", "r", function() render(buf) end, opts)
    -- Desactiva navegació inútil en el dashboard
    vim.keymap.set("n", "<Up>",   "<Nop>", opts)
    vim.keymap.set("n", "<Down>", "<Nop>", opts)
end

-- ── Obre el dashboard ─────────────────────────────────────────────────────────
local function open_dashboard()
    -- Només obre si no hi ha fitxers oberts i no hi ha arguments
    if vim.fn.argc() > 0 then return end

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_current_buf(buf)

    vim.api.nvim_set_option_value("buftype",    "nofile",     { buf = buf })
    vim.api.nvim_set_option_value("bufhidden",  "wipe",       { buf = buf })
    vim.api.nvim_set_option_value("swapfile",   false,        { buf = buf })
    vim.api.nvim_set_option_value("buflisted",  false,        { buf = buf })
    vim.api.nvim_set_option_value("filetype",   "dashboard",  { buf = buf })
    vim.opt_local.number         = false
    vim.opt_local.relativenumber = false
    vim.opt_local.cursorline     = false
    vim.opt_local.signcolumn     = "no"
    vim.opt_local.colorcolumn    = ""
    vim.opt_local.list           = false  -- amaga trailing spaces i dots

    set_hl()
    render(buf)
    setup_keymaps(buf)

    -- Refresh automàtic cada minut
    local timer = vim.uv.new_timer()
    timer:start(60000, 60000, vim.schedule_wrap(function()
        if vim.api.nvim_buf_is_valid(buf) then
            render(buf)
        else
            timer:stop()
        end
    end))
end

-- ── Plugin spec per lazy.nvim ─────────────────────────────────────────────────
return {
    "nvim-lua/plenary.nvim",  -- dependència mínima per no trencar lazy
    lazy = false,
    priority = 9999,
    config = function() end,
    init = function()
        vim.api.nvim_create_autocmd("VimEnter", {
            once = true,
            callback = function()
                vim.schedule(function()
                    set_hl()
                    open_dashboard()
                end)
            end,
        })
    end,
}
