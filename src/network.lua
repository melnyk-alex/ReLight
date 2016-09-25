local module = {}
module.config = {}
module.config.ssid = "Beta"
module.config.pasw = "Intel1394"

function module.run()
    wifi.setmode(wifi.STATION)
    wifi.setphymode(wifi.PHYMODE_G)
    wifi.sta.eventMonReg(wifi.STA_GOTIP, function()
        ip = wifi.sta.getip()
        print('CONNECTED', ip)
    end)
    wifi.sta.config(module.config.ssid, module.config.pasw)
end

return module