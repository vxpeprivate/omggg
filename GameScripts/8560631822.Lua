
--// Game Micro
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
local checkpublicreponum = 0
local checkpublicrepo

checkpublicrepo = function(id)
	local suc, req = pcall(function() return requestfunc({
		Url = "https://raw.githubusercontent.com/randomdude11135/IClient/main/GameScripts/" .. id .. ".Lua",
		Method = "GET"
	}) end)
	if not suc then
		checkpublicreponum = checkpublicreponum + 1
		task.wait(2)
		return checkpublicrepo(id)
	end
	if req.StatusCode == 200 then
		return req.Body
	end
	return nil
end
shared.UseGameDataOf = 6872274481
local publicrepo = checkpublicrepo("6872274481")
if publicrepo then
	loadstring(publicrepo)()
end
