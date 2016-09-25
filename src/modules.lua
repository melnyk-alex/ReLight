local module = {}

function module.load(app)
    for i, name in pairs(app.config.modules) do
        local status, loadedModule = pcall(dofile, name .. '.lua')

        if status then
            print('LOAD MODULE', name, 'LOADED')

            local status, error = pcall(loadedModule.run, app)

            if status then
                app.modules[name] = loadedModule
                print('MODULE', name, 'RUNNING')
            else
                print('MODULE', name, 'ERROR', error)
            end

            error = nil
        else
            print('LOAD MODULE', name, 'FAILED')
        end

        -- CLEAR
        status = nil
        loadedModule = nil
    end
end

return module