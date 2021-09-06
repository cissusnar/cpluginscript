function main(text)
    -- edit here
    local domain = text:match('^%w+://([^/]+)')
    if domain == nil then return "" end
    return domain
end
