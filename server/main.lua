local QBCore = exports['qb-core']:GetCoreObject()

Thedoc = {}

Thedoc.Functions = {}

exports('GetThedocCoins', function()
    return Thedoc
end)


AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    loaddatabase()
  end)
  
function loaddatabase()
    Citizen.CreateThread(function()
        Wait(5000)
        MySQL.Sync.execute([[
           
            CREATE TABLE IF NOT EXISTS `Thedoc_Coins` (
                `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                `license` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
                `coins` INT(10)  NOT NULL,
                `premium` INT(1)  NOT NULL,
                PRIMARY KEY (`id`) USING BTREE
            )
            COLLATE='utf8mb4_general_ci'
            ENGINE=InnoDB
            ;
            
        ]])
    
       print("Loaded DATABASE...")
    end)
    
end
  
local function GetCoins(license)
    if license then
        return print("HOla")
    else
        return "License Missing"
    end
end

Thedoc.Functions.GetCoins = GetCoins
exports('GetCoins', GetCoins)
