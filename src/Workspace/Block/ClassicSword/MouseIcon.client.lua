--Made by Luckymaxer
Player = game.Players.LocalPlayer
UIS = game:GetService("UserInputService")
Mouse_Icon = "rbxasset://textures/GunCursor.png"
Reloading_Icon = "rbxasset://textures/GunWaitCursor.png"

Tool = script.Parent

Mouse = nil

UIS.InputBegan:Connect(function(input, gpe)
	if (gpe) then
		return
	end
	
	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		script.Parent.BlockEvent:FireServer(Player.Name, true)
	end
end)

UIS.InputEnded:Connect(function(input, gpe)
	if (gpe) then
		return
	end
	
	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		script.Parent.BlockEvent:FireServer(Player.Name, false)
	end
end)

function UpdateIcon()
	if Mouse then
		Mouse.Icon = Tool.Enabled and Mouse_Icon or Reloading_Icon
	end
end

function OnEquipped(ToolMouse)
	Mouse = ToolMouse
	UpdateIcon()
end

function OnChanged(Property)
	if Property == "Enabled" then
		UpdateIcon()
	end
end

Tool.Equipped:Connect(OnEquipped)
Tool.Changed:Connect(OnChanged)
