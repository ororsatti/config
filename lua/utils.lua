M = {}

function M.dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then
        k = '"' .. k .. '"'
      end
      s = s .. '[' .. k .. '] = ' .. M.dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

function M.is_in_deno()
  local lspconfig = require 'lspconfig'
  local is_in_deno_repo = lspconfig.util.root_pattern('deno.json', 'import_map.json', 'deno.jsonc')(vim.fn.getcwd())
  local is_in_deno_part_of_repo = vim.fn.match(vim.fn.expand '%:p', 'supabase/functions') > -1
  return is_in_deno_repo or is_in_deno_part_of_repo
end

M.harpoon_bindings = { 't', 'g', 'd', 'a' }
M.harpoon_notation = function(char)
  return string.format('<C-%s>', char)
end

M.get_index_name = function(i)
  if i == 1 then
    return '1st'
  end
  if i == 2 then
    return '2nd'
  end
  if i == 3 then
    return '3rd'
  end

  return string.format('%sth', i)
end

M.map = function(arr, f)
  local t = {}
  for i = 1, #arr do
    t[i] = f(arr[i])
  end
  return t
end

M.optional_group = vim.api.nvim_create_augroup('optional', { clear = true })

return M
