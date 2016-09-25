local module = {}
module.config = {
    current = 0
}

function module.run(app)
    -- LOAD LAST CURENT
    module.config.current = app.config.light.last

end

return module