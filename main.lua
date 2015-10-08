-- TODO: Buttons for Pause, Restart (+ shortcut = space)
--       Save/Load/New

function love.load()
    values = {} -- maybe remove this and use getElementByKey
    guiElements = {
        -- {label = , tooltip = , value = , min = , max = , delta =, modDelta =, noLineBreak = , key = var, valueMap = , integer = }
        {label = "Background color"},
        {label = "R", key = "bgColorR", value = 0, min = 0, max = 255, delta = 10, modDelta = 1, noLineBreak = true, integer = true},
        {label = "G", key = "bgColorG", value = 0, min = 0, max = 255, delta = 10, modDelta = 1, noLineBreak = true, integer = true},
        {label = "B", key = "bgColorB", value = 0, min = 0, max = 255, delta = 10, modDelta = 1, integer = true},
        {},
        {label = "Blending", key = "blendMode", value = 1, min = 1, max = 6, valueMap = {"Additive", "Alpha", "Subtractive", "Multiplicative", "Premultiplied", "Replace"}, tooltip = "BLABLA"},
        {label  = "Insert mode", key = "insertMode", value = 1, min = 1, max = 3, valueMap = {"Top", "Bottom", "Random"}},
        {label = "Buffersize", key = "bufferSize", value = 10000, min = 1, delta = 100, modDelta = 10, integer = true},
        {},
        {label = "Texture"},
        {label = "#Images in strip", key = "imagesInStrip", value = 1, min = 1, integer = true},
        {label = "Offset X", key = "offsetX", value = 0, delta = 0.1, modDelta = 0.01, noLineBreak = true},
        {label = "Y", key = "offsetY", value = 0, delta = 0.01, modDelta = 0.01},
        {label = "Color Index", key = "colorIndex", value = 1, min = 1, max = 8, integer = true},
        {label = "R", key = "color1_r", value = 255, min = 0, max = 255, delta = 10, modDelta = 1, noLineBreak = true, integer = true},
        {label = "G", key = "color1_g", value = 255, min = 0, max = 255, delta = 10, modDelta = 1, noLineBreak = true, integer = true},
        {label = "B", key = "color1_b", value = 255, min = 0, max = 255, delta = 10, modDelta = 1, noLineBreak = true, integer = true},
        {label = "A", key = "color1_a", value = 255, min = 0, max = 255, delta = 10, modDelta = 1, integer = true},
        {},
        {label = "Emitter lifetime", key = "emitterLifetime", value = -1.0, min = -1.0, delta = 1, modDelta = 0.05},
        {label = "Emission rate", key = "emissionRate", value = 20.0, min = 0.0, delta = 10, modDelta = 1},
        {label = "Direction", key = "direction", value = 0.0, delta = 0.1, modDelta = 0.01},
        {label = "Direction spread", key = "directionSpread", value = 2*math.pi, min = 0, max = 2*math.pi, delta = 0.1, modDelta = 0.01},
        {label = "Area spread", key = "areaSpreadType", value = 1, min = 1, max = 3, valueMap = {"Uniform", "Normal", "none"}},
        {label = "dx", key = "areaSpreadX", value = 0, delta = 1, modDelta = 0.1},
        {label = "dy", key = "areaSpreadY", value = 0, delta = 1, modDelta = 0.1},
        {},
        {label = "Particle lifetime min", key = "particleLifetimeMin", value = 1.0, min = 0, delta = 1, modDelta = 0.05},
        {label = "max", key = "particleLifetimeMax", value = 1.0, min = 0, delta = 1, modDelta = 0.05},
        {label = "Relative rotation", key = "relativeRotation", value = 1, min = 1, max = 2, valueMap = {"false", "true"}, integer = true},
        {label = "Size index", key = "sizeIndex", min = 1, max = 8, value = 1, integer = true},
        {label = "Size", key = "size1", value = 1.0, delta = 0.1, modDelta = 0.01},
        {label = "Size variation", key = "sizeVariation", value = 0.0, min = 0, max = 1, delta = 0.1, modDelta = 0.01},
        {label = "Rotation min", key = "rotationMin", value = 0, min = 0, max = 2*math.pi, delta = 0.1, modDelta = 0.01},
        {label = "max", key = "rotationMax", value = 0, min = 0, max = 2*math.pi, delta = 0.1, modDelta = 0.01},
        {label = "Speed min", key = "speedMin", value = 0, delta = 10, modDelta = 1},
        {label = "Speed max", key = "speedMax", value = 0, delta = 10, modDelta = 1},
        {label = "Linear acceleration"},
        {label = "x min", key = "linAccelXMin", value = 0, delta = 0.1, modDelta = 0.05, noLineBreak = true},
        {label = "y min", key = "linAccelYMin", value = 0, delta = 0.1, modDelta = 0.05, noLineBreak = true},
        {label = "x max", key = "linAccelXMax", value = 0, delta = 0.1, modDelta = 0.05, noLineBreak = true},
        {label = "y max", key = "linAccelYMax", value = 0, delta = 0.1, modDelta = 0.05},
        {label = "Radial acceleration min", key = "radAccelMin", value = 0, delta = 0.1, modDelta = 0.05},
        {label = "max", key = "radAccelMax", value = 0, delta = 0.1, modDelta = 0.05},
        {label = "Tangential acceleration min", key = "tangAccelMin", value = 0, delta = 0.1, modDelta = 0.05},
        {label = "max", key = "tangAccelMax", value = 0, delta = 0.1, modDelta = 0.05},
        {label = "Linear damping min", key = "linDampMin", value = 0, delta = 0.1, modDelta = 0.05, noLineBreak = true},
        {label = "max", key = "linDampMax", value = 0, delta = 0.1, modDelta = 0.05},
        {label = "Spin min", key = "spinMin", value = 0, delta = 0.1, modDelta = 0.05, noLineBreak = true},
        {label = "max", key = "spinMax", value = 0, delta = 0.1, modDelta = 0.0},
        {label = "Spin variation", key = "spinVariation", value = 0, min = 0, max = 1, delta = 0.1, modDelta = 0.01},
    }
    
    for _, element in ipairs(guiElements) do 
        if element.key then values[element.key] = element.value end
    end
    
    guiElements.lines = {{}}
    for _, element in ipairs(guiElements) do 
        table.insert(guiElements.lines[#guiElements.lines], element)
        if not element.noLineBreak then 
            table.insert(guiElements.lines, {})
        end 
    end
    
    margin = 5
    panelWidth = 300
    local lineHeight = 22
    local cursorX, cursorY = margin, 5
    for _, line in ipairs(guiElements.lines) do 
        for _, element in ipairs(line) do
            element.x, element.y = cursorX, cursorY
            element.w, element.h = panelWidth / #line, lineHeight
            cursorX = cursorX + element.w
        end
        cursorX = margin
        cursorY = cursorY + lineHeight
    end
end

function love.mousemoved(x, y, dx, dy)
    for _, element in ipairs(guiElements) do 
        element.hovered = element.value and x > element.x and x < element.x + element.w and y > element.y and y < element.y + element.h 
    end 
    
    if guiElements.dragged then updateSlider(guiElements.dragged, x) end
end

function updateSlider(element, mouseX)
    if element.min and element.max then 
        local alpha = math.min(1, math.max(0, (mouseX - element.x) / element.w))
        element.value = element.min + alpha * (element.max - element.min)
        updateValue(element)
    end
end

function updateValue(element)
    if element.min and element.value < element.min then element.value = element.min end
    if element.max and element.value > element.max then element.value = element.max end
    if element.integer or element.valueMap then element.value = math.floor(element.value + 0.5) end
    values[element.key] = element.value
end

function love.mousepressed(x, y, button)
    -- only one object can be hovered. (This assumption is not yet made in mousemoved)
    local hovered = nil
    for _, element in ipairs(guiElements) do 
        if element.hovered then 
            hovered = element
            break
        end 
    end

    if hovered and hovered.value then 
        local delta = 1
        if hovered.delta then delta = hovered.delta end
        if love.keyboard.isDown("lshift") and hovered.modDelta then delta = hovered.modDelta end
        
        if button == "wd" then 
            hovered.value = hovered.value + delta
        elseif button == "wu" then 
            hovered.value = hovered.value - delta
        elseif button == "l" then 
            guiElements.dragged = hovered
            updateSlider(hovered, x)
        end
        updateValue(hovered)
    end
end

function love.mousereleased(x, y, button)
    if button == "l" then guiElements.dragged = nil end
end

function love.draw()
    local font = love.graphics.getFont()
    local textHeight = font:getHeight()
    
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.rectangle("fill", margin, margin, panelWidth, love.window.getHeight() - margin*2)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.rectangle("line", margin, margin, panelWidth, love.window.getHeight() - margin*2)
    
    for _, element in ipairs(guiElements) do 
        if element.label then 
            if element.min and element.max then 
                local alpha = (element.value - element.min) / (element.max - element.min)
                love.graphics.setColor(50, 50, 0, 255)
                love.graphics.rectangle("fill", element.x, element.y, element.w * alpha, element.h)
            end
        
            love.graphics.setColor(element.hovered and {255, 255, 255, 255} or {180, 180, 180, 255})
            local y = element.y + element.h/2 - textHeight/2
            love.graphics.print(element.label .. (element.value and ":" or ""), element.x + 5, y)
            
            if element.value then 
                local valueStr = element.valueMap and element.valueMap[element.value] or string.format("%.3f", element.value)
                love.graphics.print(valueStr, element.x + element.w - font:getWidth(valueStr) - 5, y)  
            end
            
            if element.hovered then 
                love.graphics.setColor(0, 255, 255, 255)
                love.graphics.rectangle("line", element.x, element.y, element.w, element.h)
                
                -- show tooltips
                local valueInfo = ""
                if element.valueMap then 
                    valueInfo = "Possible values: " .. table.concat(element.valueMap, ", ")
                else
                    local parts = {}
                    if element.min then table.insert(parts, "min: " .. element.min) end
                    if element.max then table.insert(parts, "max: " .. element.max) end
                    if element.delta then table.insert(parts, "delta: " .. element.delta) end
                    if element.modDelta then table.insert(parts, "modified delta (left shift): " .. element.modDelta) end
                    valueInfo = table.concat(parts, ", ")
                end
                
                love.graphics.setColor(255, 255, 255, 255)
                local ww, wh = love.window.getDimensions()
                love.graphics.print(valueInfo, ww - font:getWidth(valueInfo) - 10, wh - 25)
                if element.tooltip then 
                    love.graphics.print(element.tooltip, ww - font:getWidth(element.tooltip) - 10, wh - 50)
                end
            end
        end
    end 
end