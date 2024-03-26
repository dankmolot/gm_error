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
		end, -- 49
		display = function(self) -- 49
			if isstring(self) then -- 50
				return ErrorNoHaltWithStack(self) -- 51
			end -- 50
			local lines = { } -- 53
			lines[#lines + 1] = "\n[ERROR] " .. tostring(self) -- 54
			for i, info in ipairs(self.stack) do -- 55
				lines[#lines + 1] = tostring(string.rep(" ", i)) .. " " .. tostring(i) .. ". " .. tostring(info.name or "unknown") .. " - " .. tostring(info.short_src) .. ":" .. tostring(info.currentline) -- 56
			end -- 56
			lines[#lines + 1] = "\n" -- 57
			return ErrorNoHalt(table.concat(lines, "\n")) -- 58
		end -- 32
	} -- 32
	if _base_0.__index == nil then -- 32
		_base_0.__index = _base_0 -- 32
	end -- 58
	_class_0 = setmetatable({ -- 32
		__init = function(self, message, fileName, lineNumber, stackPos) -- 37
			if stackPos == nil then -- 37
				stackPos = 4 -- 37
			end -- 37
			self.message = message -- 37
			self.fileName = fileName -- 37
			self.lineNumber = lineNumber -- 37
			self.stack = capture_stack(stackPos) -- 38
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
end -- 58
_module_0["Error"] = Error -- 32
local TypeError -- 60
do -- 60
	local _class_0 -- 60
	local _parent_0 = Error -- 60
	local _base_0 = { } -- 60
	for _key_0, _val_0 in pairs(_parent_0.__base) do -- 60
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 60
			_base_0[_key_0] = _val_0 -- 60
		end -- 60
	end -- 60
	if _base_0.__index == nil then -- 60
		_base_0.__index = _base_0 -- 60
	end -- 60
	setmetatable(_base_0, _parent_0.__base) -- 60
	_class_0 = setmetatable({ -- 60
		__init = function(self, ...) -- 60
			return _class_0.__parent.__init(self, ...) -- 60
		end, -- 60
		__base = _base_0, -- 60
		__name = "TypeError", -- 60
		__parent = _parent_0 -- 60
	}, { -- 60
		__index = function(cls, name) -- 60
			local val = rawget(_base_0, name) -- 60
			if val == nil then -- 60
				local parent = rawget(cls, "__parent") -- 60
				if parent then -- 60
					return parent[name] -- 60
				end -- 60
			else -- 60
				return val -- 60
			end -- 60
		end, -- 60
		__call = function(cls, ...) -- 60
			local _self_0 = setmetatable({ }, _base_0) -- 60
			cls.__init(_self_0, ...) -- 60
			return _self_0 -- 60
		end -- 60
	}) -- 60
	_base_0.__class = _class_0 -- 60
	if _parent_0.__inherited then -- 60
		_parent_0.__inherited(_parent_0, _class_0) -- 60
	end -- 60
	TypeError = _class_0 -- 60
end -- 60
_module_0["TypeError"] = TypeError -- 60
local RuntimeError -- 61
local _class_0 -- 61
local _parent_0 = Error -- 61
local _base_0 = { } -- 61
for _key_0, _val_0 in pairs(_parent_0.__base) do -- 61
	if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then -- 61
		_base_0[_key_0] = _val_0 -- 61
	end -- 61
end -- 61
if _base_0.__index == nil then -- 61
	_base_0.__index = _base_0 -- 61
end -- 61
setmetatable(_base_0, _parent_0.__base) -- 61
_class_0 = setmetatable({ -- 61
	__init = function(self, ...) -- 61
		return _class_0.__parent.__init(self, ...) -- 61
	end, -- 61
	__base = _base_0, -- 61
	__name = "RuntimeError", -- 61
	__parent = _parent_0 -- 61
}, { -- 61
	__index = function(cls, name) -- 61
		local val = rawget(_base_0, name) -- 61
		if val == nil then -- 61
			local parent = rawget(cls, "__parent") -- 61
			if parent then -- 61
				return parent[name] -- 61
			end -- 61
		else -- 61
			return val -- 61
		end -- 61
	end, -- 61
	__call = function(cls, ...) -- 61
		local _self_0 = setmetatable({ }, _base_0) -- 61
		cls.__init(_self_0, ...) -- 61
		return _self_0 -- 61
	end -- 61
}) -- 61
_base_0.__class = _class_0 -- 61
if _parent_0.__inherited then -- 61
	_parent_0.__inherited(_parent_0, _class_0) -- 61
end -- 61
RuntimeError = _class_0 -- 61
_module_0["RuntimeError"] = RuntimeError -- 61
return _module_0 -- 61
