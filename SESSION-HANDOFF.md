# Session handoff — mod-playerbots pivot

**Resume chat:** `claude --resume 7ee8bc2b-1a3d-438f-8a60-258f9b2fec5f`
(transcript copied into this project's `~/.claude/projects/…-azerothcore-playerbots/` folder)

## What this tree is
Pivot of the server base from trickerer **NPCBots** → **mod-playerbots core fork**
(`Playerbot` branch) + the existing modules/customizations. Windows = local
build/test; prod deploy target = `ssh acore` Linux at `/opt`.

- Source: `src/`, `modules/` (incl. `modules/mod-arac`)
- Build + running server: `build/bin/RelWithDebInfo/`
  - worldserver.exe → port **8086**, authserver.exe → port **3724**
  - configs in `configs/` point at the `*_pb` databases
- Databases (MySQL 3306, user `acore/acore`): `acore_auth_pb`,
  `acore_characters_pb`, `acore_world_pb`, `acore_playerbots_pb`
- Game data (DataDir, SHARED w/ live repack):
  `D:\GAMES\Repack AzerothCore NPCBots\Data`

## DONE this session
- Build gate + full runtime validated (LAN login, 10 bots online).
- Durable RC-too-long build fix: `fix_rc_includes.ps1` (run after every cmake
  configure, before building worldserver).
- **Custom races (12–21) working end-to-end**, incl. correct factions:
  - Root cause of "Error creating character": playerbots fork's `RaceMgr`
    skips any race flagged `CHRRACES_FLAGS_NOT_PLAYABLE` in `ChrRaces.dbc`, so
    `GetMaxRaces()` capped at 12 → all custom races refused. NPCBots ignored
    that flag, which is why it worked there.
  - Fix 1 (DBC): cleared NOT_PLAYABLE on 12–21 AND set per-race faction fields
    (FactionID f2, TeamID f7, alliance f13) in
    `…\Data\dbc\ChrRaces.dbc` (backup: `ChrRaces.dbc.bak-prearac-20260603`).
  - Fix 2 (DB): cloned create-data into 12–21 — Alliance races from Human(1),
    Horde races from Orc(2). Scripts: `arac_races_13_21.sql`,
    `arac_horde_races.sql` (applied to `acore_world_pb`).
  - Faction split (from core enum names, confirmed in client):
    - Alliance: 12 Void Elf, 16 Worgen, 17 Pandaren-A, 19 Lightforged, 20 DH-A
    - Horde:    13 Vulpera, 14 Nightborne, 15 Pandaren-H, 18 Zandalari, 21 DH-H

## NEXT
1. Capture the custom-race fix as reproducible artifacts for prod (DBC byte
   patch + the two SQL files) — prod will hit the SAME not-playable gate.
2. Optional polish: per-race start zones/racials/stats (currently Alliance=Human,
   Horde=Orc clones); Goblin (race 9) is also not-playable + has no data if wanted.
3. Stage 39 green modules + 12 yellow (test BG/LFG/scaling/AH), DROP
   mod-autobalance (BG crash) → rebuild via `fix_rc_includes.ps1`.
4. Re-apply other repack customizations (auto-GM trigger, module SQL, playerbots.conf tuning).
5. Deploy pivot to prod (acore Linux): build, fresh DBs, migrate.

## Constraints (carry forward)
- Windows box shares MySQL 3306 with a LIVE healthcare prod DB — use `acore/acore`
  only, never root, never stop that mysqld.
- Never run a 2nd worldserver next to the live repack one (OOM history). Do test
  boots with the live repack server STOPPED.
- Windows builds: cap parallelism (`/m:1 /p:CL_MPCount=4`) or it OOMs; build from
  PowerShell (git-bash mangles MSBuild args).
