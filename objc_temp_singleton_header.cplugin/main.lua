function main(text)
	-- edit here
    header = [[
    @interface  <##>(Singleton)

    + (<##>*)sharedInstance;

    @end
    ]]
	return header:gsub("<##>", text)
end
