- should probably use (this link)[https://pokeapi.co/api/v2/type/] to fetch data: https://pokeapi.co/api/v2/type/

Player should take a SaveData object that loads all relevant information about the player's save data.

Stop players from advancing through an area until they beat all trainers?

Areas live inside Regions.

# Minimum Viable Product

### Game Loop

### Player
- Player can move between 2 Areas in a Region.
- Player can fight Monsters encountered when searching tall grass.
- Player can elect to talk to non-trainer characters in the area.
- Can save current state in Database and load relevant info again when restarting game.

### World
- Only has one Region.
- Regions comprise multiple Areas.
- Areas can contain other Areas. 
- Buildings are their own Areas.

### Monsters
- Have ElementTypes, but don't apply multipliers in Battle.
- Have predefined BattleMoves that don't change.
- If stats are viable, only three exist: Speed, Attack, Defense. 
- Are not affected by Conditions.

### BattleMove
- Do not possess a Type.
	- Therefore, do not apply more or less damage to other Monsters when used.
- Certain Moves can be used outside of Battles for specific purposes.

### ElementType
- Up to two ETs possessed by a single Monster.

### Conditions
- Do not exist.

### Inventory
- Contains all Items.
- Has a quantity column that tracks how many of a given Item are in the Player's possession.

### Prompt / Display 
- No raw mode. 
- Redraws for every update.

### MainMenu
- Save Player data.
- See Inventory contents.

### Schema 

Monster >---< MonsterMove >---< Move ; a MonsterMove belongs to a Monster and a Move.

Monster >---< PlayerMonsters >---< Player ; Monsters belong to a Trainer (or to the Wild)

Item >--- Inventory --- Player ; An Item belongs to a Player through an Inventory. A Player has many Items.

World ---< Region ---< Area ; A World has many Regions. A Region has many Areas.

Area ---< Monster

Area ---< Character

Area ---< Trainer

---

`monsters` ; string :name, int :hp, int :attack, int :defense, int :speed, integer :level

`player` ; string :name

`player_monsters` ; integer :trainer_id, integer :monster_id

`move` ; string :name, int :damage

`monster_moves` ; integer :monster_id, integer :move_id

`items` ; string :name, integer :catch_rate

`inventories` ; integer :player_id, integer :item_id

`areas` ; string :name

`player_locations` ; integer :player_id, integer :area_id


# Classes

## Area

### attributes

- `desc` ; returns short description of the area.

### methods

- `required_trainers` ; returns all trainers 

## Trainer

### attributes

- `location_id` (integer, leads to Room object): where this Trainer is. Also applies to Player.

- `inventory_id` (integer): used to get Items from Inventory table.

## Monster

### attributes

- `trainer_id` (integer); used to look up which Trainer a Monster belongs to.

- `original_trainer_id` (integer); used to look up name of original Trainer in the event of a Trade.

### methods

- `available_moves`, returns array of AvailableBattleMove.

## ElementType

### attributes

- `strong_against_id` ; leads to ElementTypes that a given ElementType is effective against.
- `weak_against_id` ; leads to ElementTypes that a given ElementType is ineffective against.
- `strongly_defended_id`

## Condition

### attributes

- `volatile` (boolean): volatile conditions only lasts for as long as their duration, a Monster is in battle, or until the battle ends. Non-volatile conditions last until their duration ends or an antidote is applied.

- `applied_effect_id` (integer, leads to Effect object): the effect that is applied to the affected Monster.

- `abbreviation` (string): the displayed name of this condition. Used in Battle and StatusScreen.

##
