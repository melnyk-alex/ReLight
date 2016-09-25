local module = {}

function module.load(app)
    if file.exists(app.cfgfile) then
        if file.open(app.cfgfile, 'r') then
            local status, data = pcall(cjson.decode, file.read(1024))
            file.close()

            print('statsuusus', status)

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

return module