Thedoc.Functions = {}

local function GetCoins(license)
    if license then
        local result = MySQL.Sync.fetchAll("SELECT * FROM Thedoc_Coins WHERE license = @license", {["license"] = license})
        if result[1] ~= nil then
            return result[1].coins
        else
            return false, "User Not in Database"
        end
    else
        return false, "License missing in arg"
    end
end

Thedoc.Functions.GetCoins = GetCoins
exports('GetCoins', GetCoins)


print(Thedoc.Functions.GetCoins())
