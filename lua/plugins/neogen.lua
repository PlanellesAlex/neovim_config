return {
    "danymat/neogen",
    version = "*",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("neogen").setup({
            enabled        = true,
            snippet_engine = "luasnip",
        })

        -- Neteja les cometes dels tipus: "foo_class" → foo_class
        local function clean_type(t)
            if not t then return nil end
            return t:gsub('^"(.*)"$', '%1'):gsub("^'(.*)'$", '%1')
        end

        -- Genera docstring Google style per funcions
        local function generate_python_docstring()
            local node = vim.treesitter.get_node()
            while node and node:type() ~= "function_definition" do
                node = node:parent()
            end
            if not node then
                vim.notify("Cursor no dins d'una funció", vim.log.levels.WARN)
                return
            end

            local params = {}
            local return_type = nil

            for child in node:iter_children() do
                if child:type() == "parameters" then
                    for param in child:iter_children() do
                        local t = param:type()
                        if t == "identifier" then
                            local name = vim.treesitter.get_node_text(param, 0)
                            if name ~= "self" and name ~= "cls" then
                                table.insert(params, { name = name, type = nil })
                            end
                        elseif t == "typed_parameter" or t == "typed_default_parameter" then
                            local pname, ptype = nil, nil
                            for c in param:iter_children() do
                                if c:type() == "identifier" and not pname then
                                    local n = vim.treesitter.get_node_text(c, 0)
                                    if n ~= "self" and n ~= "cls" then pname = n end
                                elseif c:type() == "type" then
                                    ptype = clean_type(vim.treesitter.get_node_text(c, 0))
                                end
                            end
                            if pname then
                                table.insert(params, { name = pname, type = ptype })
                            end
                        end
                    end
                elseif child:type() == "return_type" then
                    for c in child:iter_children() do
                        if c:type() ~= "->" then
                            return_type = clean_type(vim.treesitter.get_node_text(c, 0))
                        end
                    end
                end
            end

            local def_row  = node:start()
            local def_line = vim.api.nvim_buf_get_lines(0, def_row, def_row + 1, false)[1]
            local indent   = def_line:match("^(%s*)") .. "    "

            local lines = {}
            table.insert(lines, indent .. '"""[TODO:description]')

            if #params > 0 then
                table.insert(lines, indent .. "Args:")
                for _, p in ipairs(params) do
                    if p.type then
                        table.insert(lines, indent .. "    " .. p.name .. " (" .. p.type .. "):")
                    else
                        table.insert(lines, indent .. "    " .. p.name .. ":")
                    end
                    table.insert(lines, indent .. "        [TODO:description]")
                end
            end

            -- Sempre posa Returns: excepte si és None explícit
            if return_type ~= "None" then
                table.insert(lines, indent .. "Returns:")
                table.insert(lines, indent .. "    [TODO:return]")
            end

            table.insert(lines, indent .. '"""')

            -- Troba la primera línia del body (després del : de tancament)
            local body_row = def_row + 1
            local total_lines = vim.api.nvim_buf_line_count(0)
            for i = def_row, total_lines do
                local l = vim.api.nvim_buf_get_lines(0, i, i + 1, false)[1] or ""
                if l:match(":%s*$") then  -- línia que acaba amb :
                    body_row = i + 1
                    break
                end
            end

            vim.api.nvim_buf_set_lines(0, body_row, body_row, false, lines)
            vim.api.nvim_win_set_cursor(0, { body_row + 1, #indent })
        end

        -- Genera docstring Google style per classes amb Methods:
        local function generate_class_docstring()
            local node = vim.treesitter.get_node()
            while node and node:type() ~= "class_definition" do
                node = node:parent()
            end
            if not node then
                vim.notify("Cursor no dins d'una classe", vim.log.levels.WARN)
                return
            end

            -- Recull tots els mètodes de la classe (inclosos els decorats)
            local methods = {}
            for child in node:iter_children() do
                if child:type() == "block" then
                    for item in child:iter_children() do
                        local func_node = nil
                        if item:type() == "function_definition" then
                            func_node = item
                        elseif item:type() == "decorated_definition" then
                            -- busca la function_definition dins del decorated_definition
                            for c in item:iter_children() do
                                if c:type() == "function_definition" then
                                    func_node = c
                                    break
                                end
                            end
                        end
                        if func_node then
                            for c in func_node:iter_children() do
                                if c:type() == "identifier" then
                                    local name = vim.treesitter.get_node_text(c, 0)
                                    if name ~= "__init__" then
                                        table.insert(methods, name)
                                    end
                                    break
                                end
                            end
                        end
                    end
                end
            end

            local def_row  = node:start()
            local def_line = vim.api.nvim_buf_get_lines(0, def_row, def_row + 1, false)[1]
            local indent   = def_line:match("^(%s*)") .. "    "

            local lines = {}
            table.insert(lines, indent .. '"""[TODO:description]')

            if #methods > 0 then
                table.insert(lines, indent .. "Methods:")
                for _, m in ipairs(methods) do
                    table.insert(lines, indent .. "    " .. m .. "():")
                    table.insert(lines, indent .. "        [TODO:description]")
                end
            end

            table.insert(lines, indent .. '"""')

            local body_row  = def_row + 1
            local total_lines = vim.api.nvim_buf_line_count(0)
            for i = def_row, total_lines do
                local l = vim.api.nvim_buf_get_lines(0, i, i + 1, false)[1] or ""
                if l:match(":%s*$") then
                    body_row = i + 1
                    break
                end
            end

            vim.api.nvim_buf_set_lines(0, body_row, body_row, false, lines)
            vim.api.nvim_win_set_cursor(0, { body_row + 1, #indent })
        end

        -- Keymaps per filetype
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "python" },
            callback = function()
                vim.keymap.set("n", "<leader>nd", generate_python_docstring,
                    { buffer = true, desc = "[N]eogen [D]ocstring with types" })
                vim.keymap.set("n", "<leader>nf", generate_python_docstring,
                    { buffer = true, desc = "[N]eogen [F]unction docstring with types" })
                vim.keymap.set("n", "<leader>nc", generate_class_docstring,
                    { buffer = true, desc = "[N]eogen [C]lass docstring with methods" })
            end,
        })

        -- C i C++: generador custom Doxygen per sobre de la funció amb tipus
        local function generate_cpp_docstring()
            local node = vim.treesitter.get_node()
            while node and node:type() ~= "function_definition" do
                node = node:parent()
            end
            if not node then
                vim.notify("Cursor no dins d'una funció", vim.log.levels.WARN)
                return
            end

            local params = {}
            local return_type = nil

            for child in node:iter_children() do
                local t = child:type()
                -- Tipus de retorn
                if t == "primitive_type" or t == "type_identifier" or t == "qualified_identifier" then
                    if not return_type then
                        return_type = vim.treesitter.get_node_text(child, 0)
                    end
                end
                -- Paràmetres
                if t == "function_declarator" then
                    for sub in child:iter_children() do
                        if sub:type() == "parameter_list" then
                            for param in sub:iter_children() do
                                if param:type() == "parameter_declaration" then
                                    local ptype, pname = nil, nil
                                    for c in param:iter_children() do
                                        local ct = c:type()
                                        if ct == "primitive_type" or ct == "type_identifier" or ct == "qualified_identifier" then
                                            ptype = vim.treesitter.get_node_text(c, 0)
                                        elseif ct == "identifier" or ct == "pointer_declarator" then
                                            pname = vim.treesitter.get_node_text(c, 0)
                                            pname = pname:gsub("^%*+", "")  -- treu * dels pointers
                                        end
                                    end
                                    if pname and pname ~= "" then
                                        table.insert(params, { name = pname, type = ptype })
                                    end
                                end
                            end
                        end
                    end
                end
            end

            local def_row  = node:start()
            local def_line = vim.api.nvim_buf_get_lines(0, def_row, def_row + 1, false)[1]
            local indent   = def_line:match("^(%s*)")

            local lines = {}
            table.insert(lines, indent .. "/**")
            table.insert(lines, indent .. " * @brief [TODO:description]")

            if #params > 0 then
                table.insert(lines, indent .. " *")
                for _, p in ipairs(params) do
                    if p.type then
                        table.insert(lines, indent .. " * @param " .. p.name .. " (" .. p.type .. ") [TODO:description]")
                    else
                        table.insert(lines, indent .. " * @param " .. p.name .. " [TODO:description]")
                    end
                end
            end

            if return_type and return_type ~= "void" then
                table.insert(lines, indent .. " *")
                table.insert(lines, indent .. " * @return [TODO:return]")
            end

            table.insert(lines, indent .. " */")

            -- Insereix per SOBRE de la funció
            vim.api.nvim_buf_set_lines(0, def_row, def_row, false, lines)
            vim.api.nvim_win_set_cursor(0, { def_row + 1, #indent })
        end

        -- C i C++: fa servir el generador custom
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "c", "cpp" },
            callback = function()
                vim.keymap.set("n", "<leader>nd", generate_cpp_docstring,
                    { buffer = true, desc = "[N]eogen [D]oxygen function" })
                vim.keymap.set("n", "<leader>nf", generate_cpp_docstring,
                    { buffer = true, desc = "[N]eogen [F]unction doxygen" })
                vim.keymap.set("n", "<leader>nc", function()
                    require("neogen").generate({ type = "class" })
                end, { buffer = true, desc = "[N]eogen [C]lass doxygen" })
            end,
        })
    end,
}
