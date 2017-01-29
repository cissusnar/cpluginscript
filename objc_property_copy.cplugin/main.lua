function main(text)
	-- edit here
	if text then
		return "@property (nonatomic, copy) " .. text
	else
		return "@property (nonatomic, copy) "
	end
end
