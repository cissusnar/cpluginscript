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
            r = r .. "\nUILabel * " .. pt .. " = [UILabel new];"
        end
        if string.find(pt, "^_label") then
            r = r .. "\n" .. pt .. " = [UILabel new];"
        end
        if string.find(pt, "^button") then
            r = r .. "\nUIButton * " .. pt .. " = [UIButton new];"
        end
        if string.find(pt, "^_button") then
            r = r .. "\n" .. pt .. " = [UIButton new];"
        end
        if string.find(pt, "^tableView") then 
            r = r .. "\nUITableView * " .. pt .. " = [UITableView new];"
        end
        if string.find(pt, "^_tableView") then 
            r = r .. "\n" .. pt .. " = [UITableView new];"
        end
        if string.find(pt, "^imageView") then 
            r = r .. "\nUIImageView * " .. pt .. " = [UIImageView new];"
        end
        if string.find(pt, "^_imageView") then 
            r = r .. "\n" .. pt .. " = [UIImageView new];"
        end
    end
	return r
end

