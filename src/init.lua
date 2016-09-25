-- Connect WiFi
-- Start REST API
-- WebUI with JS REST

local app = {
    cfgfile = 'config.json'
}
app.config = {}
app.config.modules = {}
app.modules = {}

-- LOAD CONFIG
dofile('config.lua').load(app)

-- LOAD MODULES
dofile('modules.lua').load(app)

print('SYSTEM', 'STARTED')

return app