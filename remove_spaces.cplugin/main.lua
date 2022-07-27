function main(text)
	-- edit here
	if text == nil then
		return ""
	end
	return text:gsub(" ", "")
end

