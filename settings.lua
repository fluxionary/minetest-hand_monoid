local hand_caps = minetest.registered_items[""].tool_capabilities

local s = minetest.settings

local deserialize = futil.deserialize or futil.parse_lua

hand_monoid.settings = {
	full_punch_interval = tonumber(s:get("hand_monoid.full_punch_interval")) or hand_caps.full_punch_interval,
	max_drop_level = tonumber(s:get("hand_monoid.max_drop_level")) or hand_caps.max_drop_level,
	punch_attack_uses = tonumber(s:get("hand_monoid.punch_attack_uses")) or hand_caps.punch_attack_uses,
	damage_groups = deserialize(s:get("hand_monoid.damage_groups")) or hand_caps.damage_groups,
	groupcaps = deserialize(s:get("hand_monoid.groupcaps")) or hand_caps.groupcaps,
}
