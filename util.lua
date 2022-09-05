local util = {}

function util.sort_handspecs(handspecs)
	local sorted = {}
	for _, handspec in pairs(handspecs) do
		table.insert(sorted, handspec)
	end
	table.sort(sorted, function(hs1, hs2)
		return (hs1.sort_order or 32767) < (hs2.sort_order or 32767)
	end)
	return sorted
end

hand_monoid.util = util
