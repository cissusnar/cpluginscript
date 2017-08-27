local app = require("app")

local function urlencode(str)

  --Ensure all newlines are in CRLF form
  str = string.gsub (str, "\r?\n", "%%0A")
  --Convert spaces to plus signs
  str = string.gsub (str, " ", "%%20")

  return str
end

function main(text)
	-- edit here
	local txt = app.openURL(urlencode(text));
	return txt
end
