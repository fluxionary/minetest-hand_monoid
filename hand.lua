--[[
minetest.override_item("", {
        wield_scale = {x=1,y=1,z=2.5},
        tool_capabilities = {
                full_punch_interval = 0.9,
                max_drop_level = 0,
                groupcaps = {
                        crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
                        snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
                        oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
                },
                damage_groups = {fleshy=1},
        }
})
]]
local def = table.copy(minetest.registered_items[""])

minetest.override_item("", {
	tool_capabilities = {},
})

def.tool_capabilities.full_punch_interval = hand_monoid.settings.full_punch_interval
def.tool_capabilities.max_drop_level = hand_monoid.settings.max_drop_level
def.tool_capabilities.groupcaps = hand_monoid.settings.groupcaps
def.tool_capabilities.damage_groups = hand_monoid.settings.damage_groups
def.tool_capabilities.punch_attack_uses = hand_monoid.settings.punch_attack_uses

minetest.register_tool("hand_monoid:hand", def)
