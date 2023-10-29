-- [yue]: error.yue
local _module_0 = { } -- 1
--[[
    MIT License

    Copyright (c) 2023 Retro

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
]]
local capture_stack -- 24
capture_stack = function(start_pos) -- 24
	if start_pos == nil then -- 24
		start_pos = 1 -- 24
	end -- 24
	local stack = { } -- 25
	for i = 1 + start_pos, 16 do -- 26
		local info = debug.getinfo(i, "Snl") -- 27
		if not info then -- 28
			break -- 28
		end -- 28
		stack[#stack + 1] = info -- 29
	end -- 29
	return stack -- 30
end -- 24
local Error -- 32
do -- 32
	local _class_0 -- 32
	local _base_0 = { -- 32
		name = "Error", -- 43
		__tostring = function(self) -- 43
			if self.fileName then -- 44
				return tostring(self.fileName) .. ":" .. tostring(self.lineNumber or 0) .. ": " .. tostring(self.name) .. ": " .. tostring(self.message) -- 45
			else -- 47
				return tostring(self.name) .. ": " .. tostring(self.message) -- 47
			end -- 44
		end -- 32
	} -- 32
	if _base_0.__index == nil then -- 32
		_base_0.__index = _base_0 -- 32
	end -- 47
	_class_0 = setmetatable({ -- 32
		__init = function(self, message, fileName, lineNumber) -- 37
			self.message = message -- 37
			self.fileName = fileName -- 37
			self.lineNumber = lineNumber -- 37
			self.stack = capture_stack(4) -- 38
			if self.stack[1] then -- 39
				self.fileName = self.fileName or self.stack[1].short_src -- 40
				self.lineNumber = self.lineNumber or self.stack[1].currentline -- 41
			end -- 39
		end, -- 32
		__base = _base_0, -- 32
		__name = "Error" -- 32
	}, { -- 32
		__index = _base_0, -- 32
		__call = function(cls, ...) -- 32
			local _self_0 = setmetatable({ }, _base_0) -- 32
			cls.__init(_self_0, ...) -- 32
			return _self_0 -- 32
		end -- 32
	}) -- 32
	_base_0.__class = _class_0 -- 32
	local self = _class_0; -- 32
	self.__inherited = function(self, child) -- 34
		child.__base.name = child.__name or self.name -- 35
	end -- 34
	Error = _class_0 -- 32
end -- 47
_module_0["Error"] = Error -- 32
local TypeError -- 49
do -- 49
	local _class_0 -- 49
	local _parent_0 = Error -- 49
	local _base_0 = { } -- 49
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 49
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 49
			_base_0[_key_0] = _val_0 -- 49
		end -- 49
	end -- 49
	if _base_0.__index == nil then -- 49
		_base_0.__index = _base_0 -- 49
	end -- 49
	setmetatable(_base_0, _parent_0.__base) -- 49
	_class_0 = setmetatable({ -- 49
		__init = function(self, ...) -- 49
			return _class_0.__parent.__init(self, ...) -- 49
		end, -- 49
		__base = _base_0, -- 49
		__name = "TypeError", -- 49
		__parent = _parent_0 -- 49
	}, { -- 49
		__index = function(cls, name) -- 49
			local val = rawget(_base_0, name) -- 49
			if val == nil then -- 49
				local parent = rawget(cls, "__parent") -- 49
				if parent then -- 49
					return parent[name] -- 49
				end -- 49
			else -- 49
				return val -- 49
			end -- 49
		end, -- 49
		__call = function(cls, ...) -- 49
			local _self_0 = setmetatable({ }, _base_0) -- 49
			cls.__init(_self_0, ...) -- 49
			return _self_0 -- 49
		end -- 49
	}) -- 49
	_base_0.__class = _class_0 -- 49
	if _parent_0.__inherited then -- 49
		_parent_0.__inherited(_parent_0, _class_0) -- 49
	end -- 49
	TypeError = _class_0 -- 49
end -- 49
_module_0["TypeError"] = TypeError -- 49
return _module_0 -- 49
