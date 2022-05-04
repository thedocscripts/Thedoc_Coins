Thedoc.Functions = {}

local function GetCoins(license)
    if license then
        local result = MySQL.Sync.fetchAll("SELECT * FROM Thedoc_Coins WHERE license = @license", {["license"] = license})
        if result[1] ~= nil then
            return result[1].coins
        else
            return false
        end
    else
        return nil
    end
end


local function IsPremium(license)
    if license then
        local result = MySQL.Sync.fetchAll("SELECT * FROM Thedoc_Coins WHERE license = @license", {["license"] = license})
        if result[1] ~= nil then
            return result[1].premium
        else
            return "User not in database"
        end
    else
        return "Please add license as argument"
    end
end






Thedoc.Functions.GetCoins = GetCoins
exports('GetCoins', GetCoins)

Thedoc.Functions.IsPremium = IsPremium
exports('IsPremium', IsPremium)
