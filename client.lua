DevMode(false)

Citizen.CreateThread(function()
    local n3d = CreateNui3d("utility_lib_1", "html/ui.html")
end)

CreateLoop(function()
    if IsPedReloading(PlayerPedId()) then -- If reloading hide the HUD
        if n3d:visible() then
            n3d:hide()
        end
    else
        if IsControlPressed(0, 25) and IsPedArmed(PlayerPedId(), 4) then -- if is armed and is aiming
            if not n3d:visible() then -- Show the HUD the first time
                n3d:show(GetEntityCoords(PlayerPedId()))

                local _, weaponHash = GetCurrentPedWeapon(PlayerPedId())
                local obj = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 2.0, GetWeapontypeModel(weaponHash))

                n3d:attach(obj, vector3(0.6, 0.0, 0.7))
                n3d:rotation(90.0, true)

                local _, ammo = GetAmmoInClip(PlayerPedId(), weaponHash)
                local maxammo = GetAmmoInPedWeapon(PlayerPedId(), weaponHash)

                n3d:msg({
                    ammo = ammo,
                    maxammo = maxammo - ammo
                })
            end

            if IsControlPressed(0, 24) then
                local _, weaponHash = GetCurrentPedWeapon(PlayerPedId())
                local _, ammo = GetAmmoInClip(PlayerPedId(), weaponHash)
                local maxammo = GetAmmoInPedWeapon(PlayerPedId(), weaponHash)

                n3d:msg({
                    ammo = ammo,
                    maxammo = maxammo - ammo
                })
            end
        else
            if n3d:visible() then
                n3d:hide()
            end
        end
    end
end)

--[[
RegisterCommand("giveweapon", function()
    GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), 255)
end)
]]
