ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

print('^1Donate System Made By ^3ToxikosPSL ^0')

TriggerEvent('es:addGroupCommand', 'adddc', 'superadmin', function(source, args, user)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(args[1])
	local amount  = tonumber(args[2])

	if amount ~= nil then
		if xPlayer.getAccount('donate_coins') ~= nil then
			xPlayer.addAccountMoney('donate_coins', amount)
            TriggerClientEvent('esx:showNotification', _source, amount..'DonateCoins Added To ID: '..args[1])
		else
			TriggerClientEvent('esx:showNotification', _source, '.')
		end
	else
		TriggerClientEvent('esx:showNotification', _source, 'Invalid Amount')
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'You Dont Have Permissions.' } })
end, {help = 'giveaccountmoney', params = {{name = "id", help = 'id_param'}, {name = "amount", help = 'money_amount'}}})

TriggerEvent('es:addGroupCommand', 'removedc', 'superadmin', function(source, args, user)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(args[1])
	local amount  = tonumber(args[2])

	if amount ~= nil then
		if xPlayer.getAccount('donate_coins') ~= nil then
			xPlayer.removeAccountMoney('donate_coins', amount)
            TriggerClientEvent('esx:showNotification', _source, amount..' DonateCoins Removed From ID: '..args[1])
		else
			TriggerClientEvent('esx:showNotification', _source, '.')
		end
	else
		TriggerClientEvent('esx:showNotification', _source, 'Invalid Amount')
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'You Dont Have Permissions.' } })
end, {help = 'giveaccountmoney', params = {{name = "id", help = 'id_param'}, {name = "amount", help = 'money_amount'}}})