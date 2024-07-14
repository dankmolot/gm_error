local _module_0 = { }
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
local isstring, tostring, ErrorNoHaltWithStack, ErrorNoHalt, getmetatable = _G.isstring, _G.tostring, _G.ErrorNoHaltWithStack, _G.ErrorNoHalt, _G.getmetatable
local format, rep = string.format, string.rep
local concat = table.concat
local Error
do
	local _class_0
	local _base_0 = {
		name = "Error",
		__tostring = function(self)
			if self.fileName then
				return format("%s:%d: %s: %s", self.fileName, self.lineNumber or 0, self.name, self.message)
			end
			return self.name .. ": " .. self.message
		end,
		display = function(self)
			if isstring(self) then
				return ErrorNoHaltWithStack(self)
			end
			local lines, length = {
				"\n[ERROR] " .. tostring(self)
			}, 1
			local stack = self.stack
			for index = 1, #stack do
				length = length + 1
				local info = stack[index]
				lines[length] = format("%s %d. %s - %s:%d", rep(" ", index), index, info.name or "unknown", info.short_src, info.currentline)
			end
			length = length + 1
			lines[length] = "\n"
			ErrorNoHalt(concat(lines, "\n", 1, length))
			return
		end
	}
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	_class_0 = setmetatable({
		__init = function(self, message, fileName, lineNumber, stackPos)
			self.message = message
			self.fileName = fileName
			self.lineNumber = lineNumber
			local stack = Error.captureStack(stackPos or 3)
			self.stack = stack
			local first = stack[1]
			if first then
				self.fileName = self.fileName or first.short_src
				self.lineNumber = self.lineNumber or first.currentline
			end
		end,
		__base = _base_0,
		__name = "Error"
	}, {
		__index = _base_0,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	local self = _class_0;
	self.__inherited = function(self, child)
		child.__base.name = child.__name or self.name
	end
	self.captureStack = function(stackPos)
		if stackPos == nil then
			stackPos = 1
		end
		local stack, length = { }, 0
		for level = 1 + (stackPos or 1), 16 do
			local info = getinfo(level, "Snl")
			if not info then
				break
			end
			length = length + 1
			stack[length] = info
		end
		return stack, length
	end
	self.is = function(obj, name)
		if name == nil then
			name = "Error"
		end
		local meta = getmetatable(obj)
		local cls = meta and meta.__class
		while cls do
			if cls.__name == name then
				return true
			end
			cls = cls.__parent
		end
		return false
	end
	Error = _class_0
end
_module_0["Error"] = Error
local iserror = Error.is
_module_0["iserror"] = iserror
local NotImplementedError
do
	local _class_0
	local _parent_0 = Error
	local _base_0 = { }
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "NotImplementedError",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	NotImplementedError = _class_0
end
_module_0["NotImplementedError"] = NotImplementedError
local RuntimeError
do
	local _class_0
	local _parent_0 = Error
	local _base_0 = { }
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "RuntimeError",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	RuntimeError = _class_0
end
_module_0["RuntimeError"] = RuntimeError
local RangeError
do
	local _class_0
	local _parent_0 = Error
	local _base_0 = { }
	for _key_0, _val_0 in pairs(_parent_0.__base) do
		if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
			_base_0[_key_0] = _val_0
		end
	end
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	setmetatable(_base_0, _parent_0.__base)
	_class_0 = setmetatable({
		__init = function(self, ...)
			return _class_0.__parent.__init(self, ...)
		end,
		__base = _base_0,
		__name = "RangeError",
		__parent = _parent_0
	}, {
		__index = function(cls, name)
			local val = rawget(_base_0, name)
			if val == nil then
				local parent = rawget(cls, "__parent")
				if parent then
					return parent[name]
				end
			else
				return val
			end
		end,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	if _parent_0.__inherited then
		_parent_0.__inherited(_parent_0, _class_0)
	end
	RangeError = _class_0
end
_module_0["RangeError"] = RangeError
local TypeError
local _class_0
local _parent_0 = Error
local _base_0 = { }
for _key_0, _val_0 in pairs(_parent_0.__base) do
	if _base_0[_key_0] == nil and _key_0:match("^__") and not (_key_0 == "__index" and _val_0 == _parent_0.__base) then
		_base_0[_key_0] = _val_0
	end
end
if _base_0.__index == nil then
	_base_0.__index = _base_0
end
setmetatable(_base_0, _parent_0.__base)
_class_0 = setmetatable({
	__init = function(self, ...)
		return _class_0.__parent.__init(self, ...)
	end,
	__base = _base_0,
	__name = "TypeError",
	__parent = _parent_0
}, {
	__index = function(cls, name)
		local val = rawget(_base_0, name)
		if val == nil then
			local parent = rawget(cls, "__parent")
			if parent then
				return parent[name]
			end
		else
			return val
		end
	end,
	__call = function(cls, ...)
		local _self_0 = setmetatable({ }, _base_0)
		cls.__init(_self_0, ...)
		return _self_0
	end
})
_base_0.__class = _class_0
if _parent_0.__inherited then
	_parent_0.__inherited(_parent_0, _class_0)
end
TypeError = _class_0
_module_0["TypeError"] = TypeError
return _module_0
