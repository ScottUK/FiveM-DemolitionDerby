local MaxSlots = 32
local WaitingDuration = 5 --Seconds

AddEventHandler('playerConnecting', function(PlayerName, KickReason, Deferrals)
	local UseQueue = tonumber(GetConvarInt('UseQueue', 0)) == 1
	local QueueMaxTries = tonumber(GetConvarInt('QueueMaxTries', 10))
	local ReservedSlots = tonumber(GetConvarInt('ReservedSlots', 2))

	if UseQueue then
		Deferrals.defer()

		local Source = source

		local Tries = 0
		Citizen.CreateThread(function()
			while Tries < QueueMaxTries do
				Citizen.Wait(0)
				Tries = Tries + 1
				if GetNumPlayerIndices() < (MaxSlots - ReservedSlots) then
					Deferrals.update('Yeah, got a free Slot. Joining now!')
					Deferrals.done()
					return
				elseif GetNumPlayerIndices() >= (MaxSlots - ReservedSlots) then
					if IsPlayerAceAllowed(Source, 'DD') and not (GetNumPlayerIndices() == MaxSlots) then
						Deferrals.update('Admin detected, using reserved slot. Joining now!')
						Deferrals.done()
					else
						Deferrals.update('No free Slot available, trying again in ' .. WaitingDuration .. ' Seconds. - Tries: ' .. Tries .. '/' .. QueueMaxTries)
					end
				end
				if Tries ~= QueueMaxTries then
					Citizen.Wait(WaitingDuration * 1000)
				end
			end
			Deferrals.done('No free Slot available, try again later.')
		end)
	end
end)

