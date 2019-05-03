local args = ...
local inet = require("internet")
if args[1] == "help" or args[1] == "-h" or args[1] == nil then
  print("wRun 1.1 Run from Web - Written by lucsoft\nUsage\nwrun URL | runs normal\nwrun URL -q | runs quiet and no clear\nwrun [help | -h] | opens help")
else
  if args[2] ~= "-q" then
    print("Loading " .. args[1] .. "")
  end
  local hndl = inet.request(args[1])
  local code = ""
  for chunk in hndl do
    code = code .. chunk
  end
  if args[2] ~= "-q" then
    os.execute("clear")
  end
  f = load(code)()
  return f
end
