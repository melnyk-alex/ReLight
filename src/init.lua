-- Connect WiFi
-- Start REST API
-- WebUI with JS REST

local app = {}
app.config = {}
app.config.modules = {}
app.modules = {}

-- LOAD CONFIG
app.cfg = dofile('config.lua')
app.cfg.load(app)

-- LOAD MODULES
dofile('modules.lua').load(app)

print('SYSTEM', 'STARTED')

return app