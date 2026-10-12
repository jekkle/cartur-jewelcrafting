# Cartur's Jewelcrafting

**Smoothbrain's Jewelcrafting, carried on.** Jewelcrafting was retired on Thunderstore in 2026. This is
the same mod - Smoothbrain's code and art, used with their permission - kept working on Valheim 1.0
and with bugs players reported fixed.

All credit for Jewelcrafting goes to its creators:

- **Smoothbrain** - [the original mod on Thunderstore](https://thunderstore.io/c/valheim/p/Smoothbrain/Jewelcrafting/)
- **blaxxun-boop** - author of the code, [github.com/blaxxun-boop/Jewelcrafting](https://github.com/blaxxun-boop/Jewelcrafting)
- **Azumatt** - contributor
- The models, effects and icons are theirs.
- Translations by the community: Ukrainian by **VoronUA**, Russian by **AMORAKI**, Chinese by
  **2077141408**, plus the translators of the original files.

## What it does

A risk and reward socket system for your gear.

- **Gems.** Gemstone formations grow in the world, and creatures can drop uncut gems. Seven colours -
  Ruby, Sapphire, Emerald, Onyx, Spinel, Sulfur and Humite.
- **Gemcutters Table.** Cut an uncut gem into a Simple gem - it can shatter into shards - and refine
  gems further into Advanced and Perfect ones.
- **Sockets.** Add sockets to weapons and armour at the Gemcutters Table, up to 3 by default. Adding
  a socket can fail, and by default a failed attempt destroys the item - or set it to cost
  materials instead.
- **Effects.** 80 gem effects: elemental damage, life steal, gliding, faster draws, better loot,
  and many more. What a gem does depends on its colour and where it sits.
- **Synergies.** Wear the right mix of gem colours for an extra effect.
- **Fusion boxes** merge two gems into a stronger fused gem, and **jewelry** - necklaces and rings -
  carries effects of its own.
- A **Jewelcrafting** skill that makes cutting and socketing safer as it rises.

Almost every number is configurable, and the effects, drops and costs can be rewritten with YAML
files in your config folder (turn on "Use External YAML").

## Fixed in this version

From the original's issue tracker:

- **No crystals on dedicated servers** (#129) - formations near the spawn area were owned by the
  server, which never ran them. A nearby player now takes them over.
- **Socket costs on upgraded items** (#114) - the socket tab showed the wrong cost for items above
  quality 1. It now shows what is charged.
- **Error when hovering a socketed crossbow** (#118) - Resonating Echoes, and Pyromaniac, crashed on
  effects shown as a range.
- **Daring raised bosses with "Daring Affects Bosses" off** (#116, #100).
- **Picking up past your weight limit while gliding** (#76).
- **New translations:** Ukrainian; Russian and Chinese brought up to date.

## Install

r2modman or Thunderstore Mod Manager. Needs BepInEx. Install it on the server too in multiplayer.

Not compatible with Epic Loot - both add sockets to gear.

---

*Free, and always will be. If it improved your game you can [tip me on Patreon](https://www.patreon.com/c/cartur).*

**[Discord](https://discord.gg/nd5RqpwNkz)** — bug reports, install help, and mod requests.
Bug reports get their own thread so nothing is lost in a chat scroll, and requests are voted on.

**More from Cartur:**
[Map Pins](https://thunderstore.io/c/valheim/p/Cartur/Carturs_Map_Pins/) ·
[HD Blood](https://thunderstore.io/c/valheim/p/Cartur/Carturs_HD_Blood/) ·
[Compass and Clock](https://thunderstore.io/c/valheim/p/Cartur/Carturs_Compass_and_Clock/) ·
[Safe Stamina](https://thunderstore.io/c/valheim/p/Cartur/Carturs_Safe_Stamina/) ·
[Follow Command](https://thunderstore.io/c/valheim/p/Cartur/Carturs_Follow_Command/) ·
[Flooring](https://thunderstore.io/c/valheim/p/Cartur/Carturs_Flooring/) ·
[UI](https://thunderstore.io/c/valheim/p/Cartur/Carturs_UI_HUD/) ·
[Waste Management](https://thunderstore.io/c/valheim/p/Cartur/Carturs_Waste_Management/) ·
[Feeding Trough](https://thunderstore.io/c/valheim/p/Cartur/Carturs_Feeding_Trough/) ·
[Build Camera](https://thunderstore.io/c/valheim/p/Cartur/Carturs_Build_Camera/) ·
[Combat Text](https://thunderstore.io/c/valheim/p/Cartur/Carturs_Combat_Text/) ·
[Farming](https://thunderstore.io/c/valheim/p/Cartur/Carturs_Farming/) ·
[Mining](https://thunderstore.io/c/valheim/p/Cartur/Carturs_Mining/) ·
[Sailing](https://thunderstore.io/c/valheim/p/Cartur/Carturs_Sailing/) ·
[Cooking](https://thunderstore.io/c/valheim/p/Cartur/Carturs_Cooking/) ·
[Blacksmithing](https://thunderstore.io/c/valheim/p/Cartur/Carturs_Blacksmithing/)
