function main(text)
	-- edit here
	if text then
		return "@property (nonatomic, weak) " .. text
	else
		return "@property (nonatomic, weak) "
	end
end
