local replicatedStorage = game:GetService("ReplicatedStorage")
local Reference = {}
Reference.objectName = "TopbarXReference"

function Reference.addToReplicatedStorage(): boolean | ObjectValue
	local existingItem = replicatedStorage:FindFirstChild(Reference.objectName)
	if existingItem then
		return false
	end
	local objectValue = Instance.new("ObjectValue")
	objectValue.Name = Reference.objectName
	objectValue.Value = script.Parent
	objectValue.Parent = replicatedStorage
	return objectValue
end

function Reference.getObject(): ObjectValue | boolean
	local objectValue = replicatedStorage:FindFirstChild(Reference.objectName)
	if objectValue then
		return objectValue
	end
	return false
end

return Reference
