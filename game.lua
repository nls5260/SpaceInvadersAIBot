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
	local score = scoreLeft*10000 + scoreMiddle*100 + scoreRight
	local state = memory.readbyte(0x0048)
	return score, state
end

function _M.getTile(x, y)
	return memory.readbyte(0x0400 + y*0x000A + x)
end

function _M.getInputs()
	_M.getPositions()

	local inputs = {}
	local inputDeltaDistance = {}

	inputs[#inputs+1] = currentX
	inputs[#inputs+1] = currentY
	inputs[#inputs+1] = memory.readbyte(0x0042)
	inputs[#inputs+1] = memory.readbyte(0x00BF)
	inputDeltaDistance[#inputDeltaDistance+1] = 1
	inputDeltaDistance[#inputDeltaDistance+1] = 1
	inputDeltaDistance[#inputDeltaDistance+1] = 1
	inputDeltaDistance[#inputDeltaDistance+1] = 1

	for dy=0,19,1 do
		string = ""
		for dx=0,9,1 do
			val = _M.getTile(dx, dy)
			if val == 239 then
				val = 0
			else
				val = 1
			end
			inputs[#inputs+1] = val
			inputDeltaDistance[#inputDeltaDistance+1] = 20 - dy*.05
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
