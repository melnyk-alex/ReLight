-- Connect WiFi
-- Start REST API
-- WebUI with JS REST

local app = {}
app.modules = {}

function loadconfig()
    if file.exists("config.config") then
        print("Config file exists")
    end
end

loadconfig()

for k, v in pairs({}) do
    local status, module = pcall(dofile, v .. '.lua')

    if status then
        print('LOAD MODULE', v, 'LOADED')

        status, err = pcall(module.run, v .. '.lua')
    else
        print('LOAD MODULE', v, 'FAILED')
    end

    status = nil
    module = nil
end
