local Module = {}

function Module.ReturnUrlContent(url)
    local Fetch = tostring(game:HttpGet(url))
    return Fetch
end

function Module.LoadUrl(url)
    local Fetch = game:HttpGet(url)
    loadstring(Fetch)()
end

function Module.WriteFile(args)
    local arguments = {args}
    writefile(arguments.Path, arguments.Content)
end

function Module.ReadFile(args)
    local arguments = {args}
    return readfile(args.Path)
end

function Module.DecryptJson(args)
    local arguments = {args}
    return game:GetService("HttpService"):JSONDecode(arguments.Content)
end

function Module.EncryptJson(args)
    local arguments = {args}
    return game:GetService("HttpService"):JSONEncode(arguments.Content)
end

function Module.ReturnSecretSuccessWord()
    return "Kumalalalalala presta u ken flake mesti ion mego lezba"
end

function Module.GetExploit()
    local Exploit = identifyexecutor()
    return tostring(Exploit)
end

return Module
