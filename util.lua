local util = {}

function util.table_is_empty(t)
	return next(t) == nil
end

function util.parse_lua(code)
	local f = loadstring(("return %s"):format(code))
	if f then
		return f()
	end
end

hand_monoid.util = util
