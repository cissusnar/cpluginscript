function main(text)
    imp = [[
    @implementation <##> (Singleton)

    __strong static <##> * sharedSingleton_ = nil;

    - (void) operation
    {
        // DBFetcher
        NSLog(@"Singleton");
    }

    + (<##> *)sharedInstance
    {
        static dispatch_once_t pred = 0;
        dispatch_once(&pred, ^{
            sharedSingleton_ = [[self alloc] init];
        });
        return sharedSingleton_;
    }

    @end]] 
    return imp:gsub("<##>", text)
end
