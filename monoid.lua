local sort_handspecs = hand_monoid.util.sort_handspecs
local table_is_empty = hand_monoid.util.table_is_empty

hand_monoid.monoid_def = {
	combine = function(handspec1, handspec2)
		local handspec = table.copy(handspec1)

		for k, v in pairs(handspec2) do
			if k == "damage_groups" then
				handspec.damage_groups = handspec.damage_groups or {}
				for group, damage in pairs(v) do
					handspec.damage_groups[group] = (handspec.damage_groups[group] or 0) + damage
				end

			elseif k == "groupcaps" then
				handspec.groupcaps = handspec.groupcaps or {}
				for group, caps in pairs(v) do
					if table_is_empty(caps) then
						handspec.groupcaps[group] = nil

					else
						handspec.groupcaps[group] = caps
					end
				end

			else
				handspec[k] = v
			end
		end

		return handspec
	end,

	fold = function(handspecs)
		local handspec = hand_monoid.monoid_def.identity
		for _, other in ipairs(sort_handspecs(handspecs)) do
			handspec = hand_monoid.monoid_def.combine(handspec, other)
		end
		return handspec
	end,

	identity = {
		name = "hand_monoid:hand",

		full_punch_interval = hand_monoid.settings.full_punch_interval,
		max_drop_level = hand_monoid.settings.max_drop_level,
		punch_attack_uses = hand_monoid.settings.punch_attack_uses,
		damage_groups = hand_monoid.settings.damage_groups,
		groupcaps = hand_monoid.settings.groupcaps,
	},

	apply = function(handspec, player)
		local hand_stack = ItemStack(handspec.name or "hand_monoid:hand")
		local meta = hand_stack:get_meta()
		meta:set_tool_capabilities({
			full_punch_interval = handspec.full_punch_interval,
			max_drop_level = handspec.max_drop_level,
			punch_attack_uses = handspec.punch_attack_uses,
			damage_groups = handspec.damage_groups,
			groupcaps = handspec.groupcaps,
		})
		local inv = player:get_inventory()
		if inv:get_size("hand") == 0 then
			inv:set_size("hand", 1)
		end
		inv:set_stack("hand", 1, hand_stack)
	end,

	on_change = function(old_total, new_total, player)
	end,
}

hand_monoid.monoid = player_monoids.make_monoid({
	combine = function(handspec1, handspec2)
		return hand_monoid.monoid_def.combine(handspec1, handspec2)
	end,

	fold = function(handspecs)
		return hand_monoid.monoid_def.fold(handspecs)
	end,

	identity = hand_monoid.monoid_def.identity,

	apply = function(handspec, player)
		return hand_monoid.monoid_def.apply(handspec, player)
	end,

	on_change = function(old_total, new_total, player)
		return hand_monoid.monoid_def.on_change(old_total, new_total, player)
	end,
})
