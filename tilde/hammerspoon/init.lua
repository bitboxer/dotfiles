function configureKeyboard(data)
    local isKeyboardAffected = data.vendorID == 12951 and data.productID == 6505
    if isKeyboardAffected and data.eventType == "added" then
        hs.keycodes.setLayout("U.S.")
    end
    if isKeyboardAffected and data.eventType == "removed" then
        hs.keycodes.setLayout("Deutsch (Programmieren)")
    end
end

local keyboardWatcher = hs.usb.watcher.new(configureKeyboard)
keyboardWatcher:start()

wifiWatcher = nil
homeSSID = "bighappymushylump"
lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == homeSSID and lastSSID ~= homeSSID then
        -- We just joined our home WiFi network
        hs.network.configuration.open():setLocation("Home")
    elseif newSSID ~= homeSSID and lastSSID == homeSSID then
        -- We just departed our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(0)
        hs.network.configuration.open():setLocation("Automatic")
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
