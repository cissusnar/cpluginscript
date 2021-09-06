function main(text)
    -- edit here
    local domain = text:match('^%w+://([^/]+)')
    return domain
end
