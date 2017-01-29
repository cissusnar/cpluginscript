function main(text)
	-- edit here
	if text then
		return "@property (nonatomic, assign) " .. text
	else
		return "@property (nonatomic, assign) "
	end
end
