function magiclines(s)
        if s:sub(-1)~="\n" then s=s.."\n" end
        return s:gmatch("(.-)\n")
end

function main(text)
	-- edit here
    r = ""
    for line in magiclines(text) do
        pt = string.gsub(line,"%s+", "")
        if string.find(pt, "^label") then
            r = r .. "\n@property (nonatomic, strong) UILabel * " .. pt .. ";"
        end
        if string.find(pt, "^button") then
            r = r .. "\n@property (nonatomic, strong) UIButton * " .. pt .. ";"
        end
        if string.find(pt, "^tableView") then 
            r = r .. "\n@property (nonatomic, strong) UITableView * " .. pt .. ";"
        end
        if string.find(pt, "^imageView") then 
            r = r .. "\n@property (nonatomic, strong) UIImageView * " .. pt .. ";"
        end
    end
	return r
end

