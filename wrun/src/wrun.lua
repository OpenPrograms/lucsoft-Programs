local args = {...}
local inet = require("internet")
if args[1] == "help" or "-h" then
  print("wRun 1.0 Run from Web - Written by lucsoft")
  print("Usage")
  print("wrun URL | runs normal")
  print("wrun URL -q | runs quiet and no clear")
  print("wrun [help | -q] | opens help")
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
  f = load(code)
  f()
end
