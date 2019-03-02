config = require "config"
local _M = {}

function _M.getPositions()
	currentX = memory.readbyte(0x0040)
	currentY = memory.readbyte(0x0041)
end

function _M.getScore()
	local scoreLeft = memory.readbyte(0x0055)
	local scoreMiddle = memory.readbyte(0x0054)
	local scoreRight = memory.readbyte(0x0053)
	local score = scoreRight --TODO use full score
	return score
end

function _M.getTile(x, y)
	return memory.readbyte(0x0400 + y*0x000A + x)
end

function _M.getInputs()
	_M.getPositions()

	local inputs = {}
	local inputDeltaDistance = {}

	for dy=0,19,1 do
		for dx=0,9,1 do
			inputs[#inputs+1] = _M.getTile(dx, dy)
			inputDeltaDistance[#inputDeltaDistance+1] = 1
		end
	end

	return inputs, inputDeltaDistance
end

function _M.clearJoypad()
	controller = {}
	for b = 1,#config.ButtonNames do
		controller["P1 " .. config.ButtonNames[b]] = false
	end
	joypad.set(controller)
end

return _M
