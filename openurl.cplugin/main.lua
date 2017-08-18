local app = require("app")

function urlencode(str)
if (str) then
str = string.gsub (str, "\n", "\r\n")
--str = string.gsub (str, "([^%w ])",
--function (c) return string.format ("%%%02X", string.byte(c)) end)
str = string.gsub (str, " ", "+")
end
return str
end

function main(text)
	-- edit here
	local txt = app.openURL(urlencode(text));
	return txt
end
