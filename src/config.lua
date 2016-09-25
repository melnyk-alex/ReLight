local module = {
    configfile = 'config.json',
    maximum = 1024
}

function module.load(app)
    if file.exists(module.configfile) then
        if file.open(module.configfile, 'r') then
            local status, data = pcall(cjson.decode, file.read(module.maximum))
            file.close()

            if status then
                app.config = data

                print('CONFIG', 'LOADED')
            else
                print('CONFIG', 'FAILED', 'LOAD')
            end
        else
            print('CONFIG', 'FAILED', 'OPEN')
        end
    else
        print('CONFIG', 'NOT FOUND')
    end
end

function module.save(app, data)
    if file.open(module.configfile, 'w') then
        local status, error = pcall(cjson.encode, data)

        if status then
            app.config = data
        else
            print('CONFIG', 'SAVE', 'ERORR', error)
        end
    end
end

return module