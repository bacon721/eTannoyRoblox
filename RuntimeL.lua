-- Limits.lua
-- "OneTannoyAtATime" script, check config for more information.
-- u r u even her????
local Config = require(script.Parent)
local LoadedConfig = nil
local Target = nil

if Config ~= nil then
	LoadedConfig = Config
end

if not LoadedConfig then
	script:Destroy()
	return
end

Target = script.Parent.Parent.Tannoys

if not Target then
	warn("There was an error trying to load -Runtime_L- .")
	script:Destroy()
	return
end

script.Parent = Target

if (LoadedConfig.OneTannoyAtATime == false) then
	script:Destroy()
	return
end

local Event = Instance.new("BindableFunction",script)
Event.Name = "Node"



Event.OnInvoke = function(plr,type)
	if type == "OnLogin" then
		if plr:GetAttribute("Locked") == false then
			plr:SetAttribute("Locked",true)
			return true
		end
		return false
	end
	if type == "Logout" then
		plr:SetAttribute("Locked",false)
		return
	end
end

