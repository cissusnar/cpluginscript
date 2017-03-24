function magiclines(s)
    if s:sub(-1)~="\n" then s=s.."\n" end
    return s:gmatch("(.-)\n")
end

function checkStynax(s)
    len = string.len(s)
    lastchar = string.sub(s, len, len)
    print(lastchar)
    if lastchar == ";" then
        return s;
    else
        return s .. ";"
    end
end

function main(text)
    -- edit here
    r = ""
    pt = string.lower(string.gsub(text,"%s+", ""))
    if string.find(pt, ".*delegate.*") then
        r = "@property (nonatomic, weak) " .. text
    elseif string.find(pt, ".*view.*") then
        r = "@property (nonatomic, strong) " .. text
    elseif string.find(pt, ".*block.*") then
        r = "@property (nonatomic, copy, nullability) " .. "<#returnType#> (^" .. text .. ")(<#parameterTypes#>)"
    elseif string.find(pt, "^cg.*") then
        r = "@property (nonatomic, assign) " .. text
    elseif string.find(pt, "^bool.*") then
        r = "@property (nonatomic, assign) " .. text
    elseif string.find(pt, ".*float.*") then
        r = "@property (nonatomic, assign) " .. text
    elseif string.find(pt, ".*double.*") then
        r = "@property (nonatomic, assign) " .. text
    elseif string.find(pt, ".*long.*") then
        r = "@property (nonatomic, assign) " .. text
    elseif string.find(pt, ".*unsigned.*") then
        r = "@property (nonatomic, assign) " .. text
    elseif string.find(pt, ".*int.*") then
        r = "@property (nonatomic, assign) " .. text
    elseif string.find(pt, ".*nsstring.*") then
        r = "@property (nonatomic, copy) " .. text
    else
        r = "@property (nonatomic, strong) " .. text
    end
    return checkStynax(r)
end

