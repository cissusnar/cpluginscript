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
    if string.find(pt, ".*var.*") then
        r = "<#returnType#> (^<#blockName#>)(<#parameterTypes#>) = ^<#returnType#>(<#parameters#>) {<#...#>};"
    elseif string.find(pt, ".*prop.*") then
        r = "@property (nonatomic, copy, nullable) " .. "<#returnType#> (^" .. text .. ")(<#parameterTypes#>);"
    elseif string.find(pt, ".*func.*") then
        r = "- (void)<#someMethodThatTakesABlock#>:(<#returnType#> (^nullability)(<#parameterTypes#>))<#blockName#>;"
    elseif string.find(pt, ".*typedef.*") then
        r = "typedef <#returnType#> (^<#TypeName#>)(<#parameterTypes#>);"
    else
        r = "@property (nonatomic, copy, nullable) " .. "<#returnType#> (^" .. text .. ")(<#parameterTypes#>);"
    end
    return r
end

