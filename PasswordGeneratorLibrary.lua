local PasswordGen = {
    ["Characters"] = {
        "a",
        "b",
        "c",
        "d",
        "e",
        "f",
        "g",
        "h",
        "i",
        "j",
        "k",
        "l",
        "m",
        "n",
        "o",
        "p",
        "q",
        "r",
        "s",
        "t",
        "u",
        "v",
        "w",
        "x",
        "y",
        "z",
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "0",
        "!",
        "#",
        "$",
        "%",
        "&",
        "/",
        "(",
        ")",
        "=",
        "ž",
        "š",
        "đ",
        "ć",
        "č",
        ";",
        ":",
        "-",
        "@",
        "{",
        "}",
        "ß",
        [[÷]],
        "÷",
        "€",
        "|",
        "_",
        "*",
        ">",
        "<",
    },
    ["Write"] = writefile,
    ["Read"] = readfile
    ["PasswordGenerated"] = ""
    ["CachedPassword"] = ""
    ["PasswordsSaved"] = (game:GetService("HttpService"):JSONDecode(readfile("RottenPasswordSaver.json")) or {
        ["https://roblox.com/"] = "urmomsercretpasswordomgnocrackpls"
    })
}

function PasswordGen:Generate(Https, Lenght, Difficult)
    for i = 1, Lenght do
        PasswordGen.PasswordGenerated = PasswordGen.PasswordGenerated.. PasswordGen.Characters[math.random(1, #PasswordGen.Characters)]
    end
    PasswordGen.CachedPassword = PasswordGen.PasswordGenerated
    PasswordGen.PasswordGenerated = ""
    table.insert(PasswordGen.PasswordsSaved, [Https] = PasswordGen.CachedPassword)
    return PasswordGen.CachedPassword
end

function PasswordGen:WritePasswords()
    if isfile("RottenPasswordSaver.json") then
        local Compare = game:GetService("HttpService"):JSONEncode(PasswordGen.PasswordsSaved)
        local Readed = readfile("RottenPasswordSaver.json")
        if Readed == Compare then
            return "No changes found. Didn't save."
        else
            writefile("RottenPasswordSaver.json", game:GetService("HttpService"):JSONEncode(PasswordGen.PasswordsSaved))
        end
    else
        writefile("RottenPasswordSaver.json", game:GetService("HttpService"):JSONEncode(PasswordGen.PasswordsSaved))
    end
end

return PasswordGen
