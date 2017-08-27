local app = require("app")

local function urlencode(str)

  --Ensure all newlines are in CRLF form
  str = string.gsub (str, "\r?\n", "\r\n")

  --Percent-encode all non-unreserved characters
  --as per RFC 3986, Section 2.3
  --(except for space, which gets plus-encoded)
  str = string.gsub (str, "([^%w%-%.%_%~ ])",
    function (c) return string.format ("%%%02X", string.byte(c)) end)

  --Convert spaces to plus signs
  str = string.gsub (str, " ", "%%20")

  return str
end

function main(text)
	-- edit here
	local url = "http://www.sf-express.com/CN/sc/dynamic_function/waybill/#search/bill-number/" .. urlencode(text)
	local txt = app.openURL(url);
	return txt
end
