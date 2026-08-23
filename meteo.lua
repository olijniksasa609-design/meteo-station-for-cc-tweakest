local env = peripheral.wrap("environmentDetector_0")
local monitor = peripheral.wrap("monitor_5")

if not env or not monitor then
    print("Error: Detector or Monitor not found!")
    return
end

monitor.setTextScale(1)
monitor.clear()

while true do
    monitor.setCursorPos(1, 1)
    monitor.write("=== METEO ===")
    
    local time = env.getTime()
    local isRaining = env.isRaining()
    local isThundering = env.isThundering()
    
    monitor.setCursorPos(1, 3)
    monitor.write("Time: " .. tostring(time))
    
    monitor.setCursorPos(1, 4)
    if isThundering then
        monitor.write("Weather: Thunder")
    elseif isRaining then
        monitor.write("Weather: Rain")
    else
        monitor.write("Weather: Clear")
    end
    
    os.sleep(2)
    monitor.clear()
end
