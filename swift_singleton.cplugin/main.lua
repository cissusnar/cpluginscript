function main(text)
	-- edit here
    imp = [[
extension <##> {
    static let shared :<##> = <##>()

    @objc class func sharedInstance() -> <##> {
        return shared
    }
}
]]
    return imp:gsub("<##>", text)
end
