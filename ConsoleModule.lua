local Library = {}
local Colors = {
    ["red"] = "@@RED@@",
    ["green"] = "@@GREEN@@",
    ["blue"] = "@@BLUE@@",
    ["yellow"] = "@@YELLOW@@",
    ["light_blue"] = "@@LIGHT_BLUE@@",
    ["black"] = "@@BLACK@@",
    ["white"] = "@@WHITE@@",
}

function Library:PrintStar(text, color)
    pcall(function()
        if Colors[color] then
            rconsoleprint(Colors["white"])
            rconsoleprint("[")
            rconsoleprint(Colors[color])
            rconsoleprint("*")
            rconsoleprint(Colors["white"])
            rconsoleprint("]: ")
            rconsoleprint(text)
        else
            messagebox("Argument #2 (PrintStar:color), Missing index in 'Colors' Table", "Rotten Hub - Console // Identity#1111", 0)
        end
        return
    end)
end

function Library:PrintExm(text, color)
    pcall(function()
        if Colors[color] then
            rconsoleprint(Colors["white"])
            rconsoleprint("[")
            rconsoleprint(Colors[color])
            rconsoleprint("!")
            rconsoleprint(Colors["white"])
            rconsoleprint("]: ")
            rconsoleprint(text)
        else
            messagebox("Argument #2 (PrintStar:color), Missing index in 'Colors' Table", "Rotten Hub - Console // Identity#1111", 0)
        end
        return
    end)
end

function Library:ReturnQuestion(text, color)
    pcall(function()
        if Colors[color] then
            rconsoleprint(Colors["white"])
            rconsoleprint("[")
            rconsoleprint(Colors[color])
            rconsoleprint("?")
            rconsoleprint(Colors["white"])
            rconsoleprint("]: ")
            rconsoleprint(text.. "\n")
        else
            messagebox("Argument #2 (ReturnQuestion:color), Missing index in 'Colors' Table", "Rotten Hub - Console // Identity#1111", 0)
        end
        local sus = rconsoleinput()
        rconsoleprint("[!]: Text // Option: ".. tostring(sus))
        return tostring(sus)
    end)
end

function Library:FormatNumber(number)
    number = tostring(number)
    return number:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", ""):split(" ")[1]
end

function Library:GetGameName(place)
    local GameName = game:GetService("MarketplaceService"):GetProductInfo(place).Name
    return tostring(GameName)
end

function Library:MessageBox(title, description, symbol)
    if tonumber(symbol) ~= nil then
        messagebox(description, title, tonumber(symbol))
    else   
        messagebox("Argument #3 (MessageBox:symbol), Number expected got string", "Rotten Hub - Console // Identity#1111", 0)
    end
end

function Library:GetTime()
    return tostring(os.date("%X"))
end

function Library:GetDate()
    return tostring(os.date("%d/%m/%y"))
end

return Library
