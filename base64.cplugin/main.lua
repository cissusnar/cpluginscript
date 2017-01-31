require 'base64'

function main(text)
	-- edit here
	local bs = enc(text)
	local r_str = bs .. "\n--快贴 base和谐 编码"
	return r_str
end


print(main("here"))
