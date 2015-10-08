-- TODO:
--      A way to reset sizes/colors to nil
--      Buttons for Pause, Restart?
--      Image strips

helpText = [[Hover a value and use your mousewheel to increase(up)/decrease(down) it. Press shift to reduce the amount of change.
You can also use your left mouse button and 'drag' the value to change it (shift is also usable). 
Use lctrl+s to save, lctrl+n to copy the current effect to a new file. And use the 'File' slider in the top left to load files.]]

guiElements = {
    -- {label = , tooltip = , value = , min = , max = , delta =, modDelta =, noLineBreak = , key = var, valueMap = , integer = }
    {label = "File", key = "filename", value = 1, min = 1, max = 1, integer = true, valueMap = {"<unsaved>"}},
    {},
    {label = "Background color"},
    {label = "R", key = "bgColorR", value = 0, min = 0, max = 255, delta = 10, noLineBreak = true, integer = true},
    {label = "G", key = "bgColorG", value = 0, min = 0, max = 255, delta = 10, noLineBreak = true, integer = true},
    {label = "B", key = "bgColorB", value = 0, min = 0, max = 255, delta = 10, integer = true},
    {},
    {label = "Blending", key = "blendMode", value = 1, min = 1, max = 6, valueMap = {"Additive", "Alpha", "Subtractive", "Multiplicative", "Premultiplied", "Replace"}},
    {label  = "Insert mode", key = "insertMode", value = 1, min = 1, max = 3, valueMap = {"Top", "Bottom", "Random"}, 
            tooltip = "Whether newly spawned particles appear on top, below or anywhere within existing particles"},
    {label = "Buffersize", key = "bufferSize", value = 100, min = 1, delta = 100, integer = true, 
            tooltip = "Sets the size of the buffer (the max allowed amount of particles in the system)"},
    {},
    {label = "Texture", key = "imageIndex", value = 1, min = 1, max = 1, valueMap = {"cosine.png"}},
    {label = "#Images in strip", key = "imagesInStrip", value = 1, min = 1, integer = true, 
            tooltip = "Allows the use of sprite sheets to animate particles over lifetime"},
    {label = "Offset X", key = "offsetX", value = 0, delta = 10, noLineBreak = true, 
            tooltip = "Set the offset position which the particle sprite is rotated around"},
    {label = "Y", key = "offsetY", value = 0, delta = 10, 
            tooltip = "Set the offset position which the particle sprite is rotated around"},
    {label = "Color Index", key = "colorIndex", value = 1, min = 1, max = 8, integer = true, 
            tooltip = "Select one of eight colors, the particle system will interpolate between each color evenly over the particle's lifetime"},
    {label = "R", key = "color1_r", value = 255, min = 0, max = 255, delta = 10, noLineBreak = true, integer = true, tooltip = "Red"},
    {label = "G", key = "color1_g", value = 255, min = 0, max = 255, delta = 10, noLineBreak = true, integer = true, tooltip = "Green"},
    {label = "B", key = "color1_b", value = 255, min = 0, max = 255, delta = 10, noLineBreak = true, integer = true, tooltip = "Blue"},
    {label = "A", key = "color1_a", value = 255, min = 0, max = 255, delta = 10, integer = true},
    {},
    {label = "Emitter lifetime", key = "emitterLifetime", value = -1.0, min = -1.0, delta = 1, modDelta = 0.05, 
            tooltip = "Sets how long the particle system should emit particles (in seconds, -1 makes it emits particles forever)"},
    {label = "Emission rate", key = "emissionRate", value = 20.0, min = 0.0, delta = 10, 
            tooltip = "Sets the amount of particles emitted per second"},
    {label = "Emit amount", key = "emitAmount", value = 20, min = 0, delta = 5, modDelta = 1, integer = true,
            tooltip = "For certain (non-continous) effects you should set the emission rate to 0 and using <space> to emit particles manually"},
    {label = "Direction", key = "direction", value = 1.5*math.pi, min = 0.0, max = 2.0*math.pi, delta = 0.1, 
            tooltip = "Sets the direction the particles will be emitted in (in radians)"},
    {label = "Direction spread", key = "directionSpread", value = 0.0, min = 0, max = 2*math.pi, delta = 0.1, 
            tooltip = "Sets the direction spread (in radians)"},
    {label = "Area spread", key = "areaSpreadType", value = 1, min = 1, max = 3, valueMap = {"Uniform", "Normal", "none"}, 
            tooltip = "Sets the distribution of the area spread"},
    {label = "dx", key = "areaSpreadX", value = 0, min = 0, delta = 10, 
            tooltip = "Maximum spawn distance from the emitter for uniform and standard deviation for normal distribution."},
    {label = "dy", key = "areaSpreadY", value = 0, min = 0, delta = 10, 
            tooltip = "Maximum spawn distance from the emitter for uniform and standard deviation for normal distribution."},
    {},
    {label = "Particle lifetime min", key = "particleLifetimeMin", value = 1.0, min = 0, delta = 1, modDelta = 0.05, 
            tooltip = "Sets the minimum lifetime of the particles (in seconds)"},
    {label = "max", key = "particleLifetimeMax", value = 1.0, min = 0, delta = 1, modDelta = 0.05, 
            tooltip = "Sets the maximum lifetime of the particles (in seconds)"},
    {label = "Relative rotation", key = "relativeRotation", value = 1, min = 1, max = 2, valueMap = {"false", "true"}, integer = true, 
            tooltip = "Sets whether particle angles and rotations are relative to their velocities"},
    {label = "Size index", key = "sizeIndex", min = 1, max = 8, value = 1, integer = true, 
            tooltip = "Select one of eight indices, the particle system will interpolate between each size evenly over the particle's lifetime"},
    {label = "Size", key = "size1", value = 1.0, delta = 0.1, 
            tooltip = "Base size of a particle for current index. 1.0 is normal size."},
    {label = "Size variation", key = "sizeVariation", value = 0.0, min = 0, max = 1, delta = 0.1, 
            tooltip = "Size variation of a particle for current index"},
    {label = "Rotation min", key = "rotationMin", value = 0, min = 0, max = 2*math.pi, delta = 0.1, 
            tooltip = "Sets the rotation of the image upon particle creation (in radians)"},
    {label = "max", key = "rotationMax", value = 0, min = 0, max = 2*math.pi, delta = 0.1, 
            tooltip = "Sets the rotation of the image upon particle creation (in radians)"},
    {label = "Speed min", key = "speedMin", value = 400, delta = 10, 
            tooltip = "Sets the speed of the particles"},
    {label = "Speed max", key = "speedMax", value = 500, delta = 10, 
            tooltip = "Sets the speed of the particles"},
    {label = "Linear acceleration"},
    {label = "x min", key = "linAccelXMin", value = 0, delta = 0.1, modDelta = 0.05, noLineBreak = true, 
            tooltip="Sets the linear acceleration (acceleration along the x and y axes) for particles"},
    {label = "y min", key = "linAccelYMin", value = 0, delta = 0.1, modDelta = 0.05, 
            tooltip="Sets the linear acceleration (acceleration along the x and y axes) for particles"},
    {label = "x max", key = "linAccelXMax", value = 0, delta = 0.1, modDelta = 0.05, noLineBreak = true, 
            tooltip = "Sets the linear acceleration (acceleration along the x and y axes) for particles"},
    {label = "y max", key = "linAccelYMax", value = 0, delta = 0.1, modDelta = 0.05, 
            tooltip = "Sets the linear acceleration (acceleration along the x and y axes) for particles"},
    {label = "Radial acceleration min", key = "radAccelMin", value = 0, delta = 0.1, modDelta = 0.05, 
            tooltip = "Set the radial acceleration (away from the emitter)"},
    {label = "max", key = "radAccelMax", value = 0, delta = 0.1, modDelta = 0.05, 
            tooltip = "Set the radial acceleration (away from the emitter)"},
    {label = "Tangential acceleration min", key = "tangAccelMin", value = 0, delta = 0.1, modDelta = 0.05, 
            tooltip = "Sets the tangential acceleration (acceleration perpendicular to the particle's direction)"},
    {label = "max", key = "tangAccelMax", value = 0, delta = 0.1, modDelta = 0.05, 
            tooltip = "Sets the tangential acceleration (acceleration perpendicular to the particle's direction)"},
    {label = "Linear damping min", key = "linDampMin", value = 0, delta = 0.1, modDelta = 0.05, 
            tooltip = "Sets the amount of linear damping (constant deceleration) for particles"},
    {label = "max", key = "linDampMax", value = 0, delta = 0.1, modDelta = 0.05, 
            tooltip = "Sets the amount of linear damping (constant deceleration) for particles"},
    {label = "Spin min", key = "spinMin", value = 0, delta = 0.1, modDelta = 0.05, noLineBreak = true, 
            tooltip = "Sets the spin of the sprite"},
    {label = "max", key = "spinMax", value = 0, delta = 0.1, modDelta = 0.05, 
            tooltip = "Sets the spin of the sprite"},
    {label = "Spin variation", key = "spinVariation", value = 0, min = 0, max = 1, delta = 0.1, 
            tooltip = "Sets the amount of spin variation"},
}

function love.load()
    values = {} -- maybe remove this and use getElementByKey

    local i, textureElement = getElementByKey("imageIndex")
    textureElement.valueMap = {}
    local files = love.filesystem.getDirectoryItems("particleImages")
    for i, file in ipairs(files) do 
        textureElement.valueMap[i] = file
    end
    textureElement.max = #textureElement.valueMap
    assert(#textureElement.valueMap > 0, "At least one image must be present in ./particleImages/.")
    
    for _, element in ipairs(guiElements) do 
        if element.key then values[element.key] = element.value end
        if element.delta == nil then element.delta = 1 end
        if element.modDelta == nil then element.modDelta = element.delta/10 end
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
    local lineHeight = 21
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
    
    local initImage = getImage("particleImages/" .. textureElement.valueMap[textureElement.value])
    particleSystem = love.graphics.newParticleSystem(initImage, 100)
    particleSystem:setPosition((love.window.getWidth() + panelWidth)/2, love.window.getHeight()/2)
    values.offsetX, values.offsetY = initImage:getWidth()/2, initImage:getHeight()/2
    updateParticleSystem()

    updateFileList()
end

do
    local imageMap = {}
    function getImage(path)
        local img = imageMap[path]
        if img == nil then 
            imageMap[path] = love.graphics.newImage(path)
            return imageMap[path]
        else
            return img
        end
    end
end

function getElementByKey(key)
    for i, element in ipairs(guiElements) do 
        if element.key == key then return i, element end
    end 
end

function updateParticleSystem()    
    if particleSystem:getBufferSize() ~= values.bufferSize then particleSystem:setBufferSize(values.bufferSize) end
    
    local i, textureElem = getElementByKey("imageIndex")
    local path = "particleImages/" .. textureElem.valueMap[textureElem.value]
    local texture = getImage(path)
    if particleSystem:getTexture() ~= texture then 
        particleSystem:setTexture(texture) 
        values.offsetX = texture:getWidth()/2
        values.offsetY = texture:getHeight()/2
    end
    
    particleSystem:setOffset(values.offsetX, values.offsetY)

    local colors = {}
    local channels = {"r", "g", "b", "a"}
    for i = 1, 8 do
        local broken = false
        for c = 1, 4 do 
            local index = (i-1)*4 + c
            colors[index] = values["color"..i.."_"..channels[c]]
            if colors[index] == nil then broken = true; break end
        end
        if broken then break end
    end
    particleSystem:setColors(unpack(colors))

    particleSystem:setEmitterLifetime(values.emitterLifetime)
    particleSystem:setEmissionRate(values.emissionRate)
    particleSystem:setDirection(values.direction)
    particleSystem:setSpread(values.directionSpread)
    local spreadType = {"uniform", "normal", "none"}
    particleSystem:setAreaSpread(spreadType[values.areaSpreadType], values.areaSpreadX, values.areaSpreadY)

    particleSystem:setParticleLifetime(values.particleLifetimeMin, values.particleLifetimeMax)
    particleSystem:setRelativeRotation(values.relativeRotation > 1)

    local sizes = {}
    for i = 1, 8 do 
        sizes[i] = values["size"..i]
        if sizes[i] == nil then break end
    end
    particleSystem:setSizes(unpack(sizes))

    particleSystem:setSizeVariation(values.sizeVariation)
    particleSystem:setRotation(values.rotationMin, values.rotationMax)
    particleSystem:setSpeed(values.speedMin, values.speedMax)
    particleSystem:setLinearAcceleration(values.linAccelXMin, values.linAccelYMin, values.linAccelXMax, values.linAccelYMax)
    particleSystem:setRadialAcceleration(values.radAccelMin, values.radAccelMax)
    particleSystem:setTangentialAcceleration(values.tangAccelMin, values.tangAccelMax)
    particleSystem:setLinearDamping(values.linDampMin, values.linDampMax)
    particleSystem:setSpin(values.spinMin, values.spinMax)
    particleSystem:setSpinVariation(values.spinVariation)
end

function updateValue(element)
    if element.min and element.value < element.min then element.value = element.min end
    if element.max and element.value > element.max then element.value = element.max end
    if element.integer or element.valueMap then element.value = math.floor(element.value + 0.5) end
    values[element.key] = element.value

    local i, colorIndexElem = getElementByKey("colorIndex")
    local channels = {"r", "g", "b", "a"}
    for c = 1, 4 do
        local key = "color" .. colorIndexElem.value .. "_" .. channels[c]
        guiElements[i+c].key = key; 
        if values[key] == nil then 
            values[key] = guiElements[i+c].value 
        else
            guiElements[i+c].value = values[key]
        end 
    end
    
    local j, sizeIndexElem = getElementByKey("sizeIndex")
    local key = "size" .. sizeIndexElem.value
    guiElements[j+1].key = key
    if values[key] == nil then 
        values[key] = guiElements[j+1].value 
    else 
        guiElements[j+1].value = values[key]
    end

    local file = guiElements[1].valueMap[guiElements[1].value]
    if currentFile ~= file and file ~= "<unsaved>" then 
        currentFile = file
        load()
    end 

    updateParticleSystem()
end

function updateFileList()
    guiElements[1].valueMap = love.filesystem.getDirectoryItems("saved")
    guiElements[1].max = #guiElements[1].valueMap
    if currentFile then 
        for i, file in ipairs(guiElements[1].valueMap) do 
            if file == currentFile then 
                guiElements[1].value = i
            end
        end 
    else 
        guiElements[1].max = guiElements[1].max + 1
        table.insert(guiElements[1].valueMap, 1, "<unsaved>")
        guiElements[1].value = 1
    end
end

function save()
    if currentFile then 
        local str = "return {\n"
        for k, v in pairs(values) do 
            str = str .. "\t" .. k .. " = " .. tostring(v) .. ",\n"
        end
        str = str .. "}\n"
        love.filesystem.write("saved/" .. currentFile, str)

        updateFileList()
    else 
        saveNew()
    end
end

function load()
    if currentFile then 
        values = assert(loadstring(love.filesystem.read("saved/" .. currentFile)))()
        updateFileList()
    end
end

function saveNew()
    local animals = {"Bear", "Zebra", "Moose", "Giraffe", "Llama", "Turtle", "Alligator", "Goat", "Hippo", "Sloth"}
    local adjectives = {"Angsty", "Depressed", "Ecstatic", "Confused", "Obsessed", "Intrigued", "Lonely", "Emancipated", "Talkative", "Confrontational"}
    local filename = nil
    repeat 
        filename = adjectives[love.math.random(1,#adjectives)] .. animals[love.math.random(1,#animals)] .. ".lua"
    until not love.filesystem.exists(filename)

    currentFile = filename
    love.window.setTitle(currentFile .. " - SparklEd")
    save()
end

function love.keypressed(key, isrepeat)
    if key == " " and not isrepeat then 
        particleSystem:emit(values.emitAmount)
    end 

    if love.keyboard.isDown("lctrl") then
        if key == "s" then 
            save()
        elseif key == "n" then 
            saveNew()
        end
    end 
end

function love.mousemoved(x, y, dx, dy)
    guiElements.hovered = nil
    for _, element in ipairs(guiElements) do 
        if element.value and x > element.x and x < element.x + element.w and y > element.y and y < element.y + element.h then
            guiElements.hovered = element
            break
        end
    end 
    
    local dragged = guiElements.dragged
    if dragged then 
        local factor = dragged.dragFactor * (love.keyboard.isDown("lshift") and dragged.modDelta/dragged.delta or 1.0)
        dragged.value = dragged.value + dragged.dragFactor * dx
        updateValue(dragged)
    end
end

function love.mousepressed(x, y, button)
    local hovered = guiElements.hovered
    if hovered and hovered.value then 
        local delta = love.keyboard.isDown("lshift") and hovered.modDelta or hovered.delta
        
        if button == "wu" then 
            hovered.value = hovered.value + delta
        elseif button == "wd" then 
            hovered.value = hovered.value - delta
        elseif button == "l" then 
            guiElements.dragged = hovered
            
            if hovered.min and hovered.max then 
                local alpha = math.min(1, math.max(0, (x - hovered.x) / hovered.w))
                hovered.value = hovered.min + alpha * (hovered.max - hovered.min)
                hovered.dragFactor = (hovered.max - hovered.min) / hovered.w
            else
                -- kind of arbitrary
                hovered.dragFactor = hovered.delta / hovered.w * 10.0
            end
        end
        updateValue(hovered)
    end

    if x > panelWidth then 
        particleSystem:setPosition(x, y)
    end 
end

function love.mousereleased(x, y, button)
    if button == "l" then guiElements.dragged = nil end
end

function love.update(dt)
    love.graphics.setBackgroundColor(values.bgColorR, values.bgColorG, values.bgColorB)
    particleSystem:update(dt)
end

function love.draw()

    local blendModes = {"additive", "alpha", "subtractive", "multiplicative", "premultiplied", "replace"}
    love.graphics.setBlendMode(blendModes[values.blendMode])
    love.graphics.draw(particleSystem)

    love.graphics.setBlendMode("alpha")
    local font = love.graphics.getFont()
    local textHeight = font:getHeight()
    
    local winW, winH = love.window.getDimensions()
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.rectangle("fill", margin, margin, panelWidth, winH - margin*2)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.rectangle("line", margin, margin, panelWidth, winH - margin*2)
    
    for _, element in ipairs(guiElements) do 
        if element.label then 
            if element.min and element.max then 
                local alpha = (element.value - element.min) / (element.max - element.min)
                love.graphics.setColor(50, 50, 0, 255)
                love.graphics.rectangle("fill", element.x, element.y, element.w * alpha, element.h)
            end
        
            love.graphics.setColor(guiElements.hovered == element and {255, 255, 255, 255} or {180, 180, 180, 255})
            local y = element.y + element.h/2 - textHeight/2
            love.graphics.print(element.label .. (element.value and ":" or ""), element.x + 5, y)
            
            if element.value then 
                local valueStr = element.valueMap and element.valueMap[element.value] or 
                                        (element.integer and tonumber(element.value) or string.format("%.3f", element.value))
                love.graphics.print(valueStr, element.x + element.w - font:getWidth(valueStr) - 5, y)  
            end
        end
    end 

    local tooltip = helpText
    if guiElements.hovered then 
        local element = guiElements.hovered
        tooltip = element.tooltip or ""

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
        love.graphics.print(valueInfo, winW - font:getWidth(valueInfo) - 10, winH - 25)
    end
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print(tooltip, winW - font:getWidth(tooltip) - 10, winH - 50)
end