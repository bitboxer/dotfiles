local usbLogger = hs.logger.new('usb', 'debug')

function isExternalKeyboard(usbDevice)
    -- usbLogger.df("pname %s, vname %s, vId %s, pId %s", usbDevice.productName, usbDevice.vendorName, usbDevice.vendorID, usbDevice.productID)
    return usbDevice.vendorID == 12951 and usbDevice.productID == 6505
end

function configureKeyboard(event)
    if isExternalKeyboard(event) and event.eventType == "added" then
        hs.keycodes.setLayout("U.S.")
    end
    if isExternalKeyboard(event) and event.eventType == "removed" then
        hs.keycodes.setLayout("Deutsch (Programmieren)")
    end
end

function checkKeyboardOnWakeup(event)
    if (event == hs.caffeinate.watcher.screensDidWake) then
        local usbDevices = hs.usb.attachedDevices()
        if usbDevices == nil then
            return
        end

        local keyboardLayout = "Deutsch (Programmieren)"
        for index, usbDevice in pairs(usbDevices) do
            if isExternalKeyboard(usbDevice) then
                keyboardLayout = "U.S."
            end
        end
        hs.keycodes.setLayout(keyboardLayout)
    end
end

function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

local keyboardWatcher = hs.usb.watcher.new(configureKeyboard)
keyboardWatcher:start()

local wakeupWatcher = hs.caffeinate.watcher.new(checkKeyboardOnWakeup)
wakeupWatcher:start()

wifiWatcher = nil
homeSSID = "bighappymushylump"
lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if string.starts(newSSID, homeSSID) and string.starts(lastSSID, homeSSID) then
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
