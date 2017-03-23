require 'base64'

function main(text)
	-- edit here
	local str = text:gsub(" ", "")
	str = str:gsub("\n", "")
	return dec(str)
end

