
--[[
	
	Updated Giver Script (modified for keycards)
	
	kiloe2 11/20/2022
	
]]

-- Settings
local TOOL_NAME = "Katana"
local DEBOUNCE_DELAY = 10 -- This is per player!

-- Variables
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

local Tool = Lighting:WaitForChild(TOOL_NAME)

local Color = script.Parent.Configuration.BrickColor

local Debounces = {}

-- Functions
local function SetDebounce(Player) -- NOTE: Yields!
	if typeof(Player) ~= "string" then Player = Player.Name end
	
	Debounces[Player] = true
	
	task.wait(DEBOUNCE_DELAY)
	
	Debounces[Player] = nil -- Set to nil instead of false to avoid excess memory use
end

-- Events
Color:GetPropertyChangedSignal("Value"):Connect(function()
	script.Parent.Handle.BrickColor = BrickColor.new(Color.Value) -- If value is invalid, BrickColor.new automatically defaults to Medium stone grey. No further handling needed.
end)

script.Parent.Hitbox.Touched:Connect(function(Part)
	local Player = Players:GetPlayerFromCharacter(Part:FindFirstAncestorWhichIsA("Model"))
	
	if not Player then return end
	if Debounces[Player.Name] then return end
	
	local ToolClone = Tool:Clone()
	ToolClone.Parent = Player.Backpack
	
	SetDebounce(Player)
end)