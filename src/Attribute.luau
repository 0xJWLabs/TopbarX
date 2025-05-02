-- v3 alone has taken 250+ hours so please consider keeping this
-- required attribute and linking to TopbarPlus within your games
-- description or devforum post. An in-game readable version also
-- makes it easier for me to debug and compare differences betewen
-- live places. Thanks! ~Ben

local RunService = game:GetService("RunService")
if not RunService:IsStudio() then
	local VERSION = require(script.Parent.VERSION)
	print(
		`🍍 Running TopbarX v{VERSION.Major}.{VERSION.Minor}.{VERSION.Patch} by 0xJWLabs. Forked of TopbarPlus by ForeverHD `
	)
end

return {}
