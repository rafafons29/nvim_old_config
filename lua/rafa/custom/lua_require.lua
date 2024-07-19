return function(dir)
  local scan = require('plenary.scandir')
  local lua_files = scan.scan_dir(dir, { depth = 10, add_dirs = false, hidden = false })

  for _, file in pairs(lua_files) do
    if file:sub(-4) == '.lua' then
      local module_path = file:sub(#dir + 2, -5):gsub('/', '.')
      if module_path then
        require(module_path)
      end
    end
  end
end

