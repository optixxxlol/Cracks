-- solaris_games folder at https://anonfiles.com/94qbw3Uaud/solaris_games_zip (sorry this got removed and i dont have a backup so this crack wont work anymore unless u can get the scripts urself)

do -- syn.request hook
    local fake_response = ("0"):rep(64);

    replaceclosure(syn.request, newcclosure(function(payload)
        local url = payload.Url;

        if url == "https://solarishub.dev/keysystem/HWID.php" or url == "https://solarishub.dev/keysystem/Verify.php" then
            return {Body = fake_response};
        end;
    end));
end;

local script_paths = {
    placeid = ("solaris_games/%s.lua"):format(game.PlaceId);
    gameid = ("solaris_games/%s.lua"):format(game.GameId);
    universal = "solaris_games/universal.lua";
};

return loadfile(isfile(script_paths.placeid) and script_paths.placeid or isfile(script_paths.gameid) and script_paths.placeid or script_paths.universal)();
