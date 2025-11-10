
local function victory()
    print("We finished the maze!")
    turtle.up()
    for _ = 1,4 do
        turtle.turnRight()
    end    
end

local function look()
    local ok, data = turtle.inspectDown()
    
    if ok and data.name:find("green") then
        print("At start")
    end
end

local function lookAhead()
	turtle.detect()
	local val1 = turtle.detect()

	print("detecting...")
	if val1 == true then
		print("found block, turning...")
		turtle.turnRight()
		val1 = turtle.detect()
		
		if val1 == true then
			turtle.turnLeft()
			turtle.turnLeft()
			val1 = turtle.detect()
			
		end
	end
			
	while val1 == false do
		turtle.forward()
		val1 = turtle.detect()
	
	end
					
	
end         
local function checkVictory()
	local ok, data = turtle.inspectDown()
    	if ok and data.name:find("yellow") then
      		victory()
      		return true
    	end    
    
    	return false
end

turtle.refuel(10)
if turtle.getFuelLevel() < 10 then
    print("Insert fuel in slot 1")
    return
end

while true do
    local done = look()
    if done then
        return
    end
lookAhead()
checkVictory()
lookAhead()
    end
