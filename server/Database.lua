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
           
            CREATE TABLE IF NOT EXISTS `thedoc_coins` (
            `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
            `license` varchar(50) NOT NULL,
            `coins` int(10) NOT NULL DEFAULT 0,
            `premium` int(1) NOT NULL DEFAULT 0,
            PRIMARY KEY (`id`) USING BTREE
            ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4;
            
        ]])
    
       print("Loaded DATABASE...")
    end)
    
end