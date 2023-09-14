local logger = hs.logger.new('init script', 'debug')

function isExternalKeyboard(usbDevice)
    -- logger.df("pname %s, vname %s, vId %s, pId %s", usbDevice.productName, usbDevice.vendorName, usbDevice.vendorID, usbDevice.productID)
    return usbDevice.vendorID == 12951 and usbDevice.productID == 6505
end

function configureKeyboard(event)
    if isExternalKeyboard(event) and event.eventType == "added" then
        logger.log("Setting US keyboard after plugging in")
        hs.keycodes.setLayout("U.S.")
    end
    if isExternalKeyboard(event) and event.eventType == "removed" then
        logger.log("Setting German keyboard after plugging in")
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
        logger.log("Keyboard set after wake up")
        logger.log(keyboardLayout)
        hs.keycodes.setLayout(keyboardLayout)
    end
end

function string.starts(String, Start)
    return string.sub(String or "", 1, string.len(Start)) == Start
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

    logger.log("SSIDs")
    logger.log(lastSSID)
    logger.log(newSSID)
    logger.log(string.starts(newSSID, homeSSID))
    if (string.starts(newSSID, homeSSID) and (lastSSID == nil or not string.starts(lastSSID, homeSSID))) then
        -- We just joined our home WiFi network
        logger.log("--> Home SSID")
        hs.network.configuration.open():setLocation("Home")
    elseif not string.starts(newSSID, homeSSID) and (lastSSID == nil or string.starts(lastSSID, homeSSID)) then
        -- We just departed our home WiFi network
        logger.log("--> Other SSID")
        hs.audiodevice.defaultOutputDevice():setVolume(0)
        hs.network.configuration.open():setLocation("Automatic")
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()

function wakeUpCallback(event)
    if (event == hs.caffeinate.watcher.screensDidUnlock) then
        ssidChangedCallback()
    end
end

wakeUpWatcher = hs.caffeinate.watcher.new(wakeUpCallback)
wakeUpWatcher:start()

hs.hotkey.bind({"left_ctrl"}, "f16", function()
    hs.application.open('iTerm.app')
end)

hs.hotkey.bind({"left_ctrl"}, "f17", function()
    hs.application.open('Visual Studio Code.app')
end)

