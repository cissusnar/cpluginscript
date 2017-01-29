function main(text)
	-- edit here
	if text then
		return "@property (nonatomic, strong) " .. text
	else
		return "@property (nonatomic, strong) "
	end
end
