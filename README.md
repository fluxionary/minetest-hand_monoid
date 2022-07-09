# hand_monoid

a minetest mod.

player monoid for controlling the look and abilities of the player's hand.

## API usage:

* ```
  hand_monoid.monoid:add_change(player, {
      groupcaps = {crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1}}
  }, change_id)
  ```
  override group capabilities
* `hand_monoid.monoid:add_change(player, {groupcaps = {[group] = {}}}, change_id)`
  remove group's capabilites
* `hand_monoid.monoid:add_change(player, {name = hand}, change_id)`
  change the hand item (allows e.g. creating new hand looks e.g. skinsdb)
