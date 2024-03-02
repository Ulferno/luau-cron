local ServerScriptService = game:GetService("ServerScriptService")
local Cron = require(ServerScriptService:FindFirstChild("Cron"))

Cron.schedule("*/5 * * * * *", function()
	print("every five seconds!")
end)

Cron.schedule("40 */1 * * * *", function()
	print("40th second of the minute")
end)
