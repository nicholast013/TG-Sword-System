if not script.Parent:FindFirstChild("Torso"):FindFirstChild("bleed") then
local decal = Instance.new("Decal", script.Parent:FindFirstChild("Torso"))
decal.Texture = "http://www.roblox.com/asset/?id=449475289"
decal.Transparency = 0.6 
decal.Name = "bleed"
end

repeat
	wait(1)
	script.Time.Value -= 1
	script.Parent:FindFirstChild("Humanoid"):TakeDamage(math.random(5,10))
until script.Time == 0
script:Destroy()