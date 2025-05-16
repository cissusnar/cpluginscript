--local app = require("app")

-- 判断是否是合法域名（必须包含至少一个点）
function is_domain(s)
    return s:match("^%w[%w%-]*%.%w[%w%-%.]*%w$") ~= nil
end

-- 判断是否是 URL（任意 scheme://host...）
function is_url(s)
    return s:match("^[%a][%w+%-%.]*://") ~= nil
end

-- 提取文本中所有域名和 URL，结果去重
function extract_domains_and_urls(text)
    local results = {}
    local seen = {}
	for word in text:gmatch("[^%s%p]+[%w%-%.:/%?&=]*") do
		if not seen[word] then
			if is_domain(word) then
				local tmp_url = "https://" .. word
				table.insert(results, tmp_url)
			end
			if is_url(word) then
				table.insert(results, word)
			end
			seen[word] = true
		end
	end
	return results
end


local function urlencode(str)
	--Ensure all newlines are in CRLF form
	str = string.gsub (str, "\r?\n", "%%0A")
	--Convert spaces to plus signs
	str = string.gsub (str, " ", "%%20")
	return str
end

function main(text)
	local found = extract_domains_and_urls(text)
	for _, item in ipairs(found) do
		app.openURL(urlencode(item))
	end
	return ""
end

