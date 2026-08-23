-- Автоматично шукаємо Environment Detector та Monitor в мережі
local env = peripheral.find("environmentDetector")
local monitor = peripheral.find("monitor")

if not env or not monitor then
    print("Error: Environment Detector or Monitor not found in network!")
    return
end

monitor.setTextScale(1)
monitor.clear()

while true do
    monitor.setCursorPos(1, 1)
    monitor.write("=== METEO STATION ===")
    
    local time = env.getTime()
    local isRaining = env.isRaining()
    local isThundering = env.isThundering()
    local dimension = env.getDimension()
    
    monitor.setCursorPos(1, 3)
    monitor.write("Time: " .. tostring(time))
    
    monitor.setCursorPos(1, 4)
    if isThundering then
        monitor.write("Weather: Thunder ⚡")
    elseif isRaining then
        monitor.write("Weather: Rain 🌧️")
    else
        monitor.write("Weather: Clear ☀️")
    end
    
    monitor.setCursorPos(1, 6)
    monitor.write("Dim: " .. tostring(dimension))
    
    os.sleep(2)
    monitor.clear()
end
