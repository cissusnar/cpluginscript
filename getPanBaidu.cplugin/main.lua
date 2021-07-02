function main(text)
	 i = string.find(text, "pan.baidu.com")
    if i == nil then return end
	_,_,str=string.find(text,"提取码.-(%w%w%w%w)");
	return str
end