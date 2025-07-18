# Database explain

### Tables

* accounts: Stores user account information, including login credentials, ban status, and personal details.
* alliance: Manages alliances between guilds, including their names, ranks, and member guilds.
* bbs_replies: Contains replies to threads in the in-game bulletin board system (BBS).
* bbs_threads: Stores the main threads of the in-game bulletin board system (BBS).
* buddies: Manages the friend lists for all characters, including pending requests.
* cashshop: Defines the items available in the cash shop, along with their properties.
* channelconfig: Holds specific configuration settings for each game channel.
* channels: Lists all available game channels and their world assignments.
* characters: The central table for all character data, including stats, job, level, and inventory.
* cheatlog: Records instances of cheating or rule violations by players.
* cooldowns: Tracks active cooldowns for character skills to prevent reuse before the designated time.
* dueyitems: Manages items sent through the in-game "Duey" parcel delivery system.
* dueypackages: Tracks packages, including sender, receiver, and contents, for the Duey system.
* eventstats: Logs participation and statistics for in-game events.
* famelog: Records all changes in fame between characters.
* gmlog: A log of all commands executed by Game Masters (GMs).
* guilds: Contains all information about in-game guilds, such as leader, members, and guild points.
* hiredmerchant: Manages items being sold in player-hired merchant stores.
* hiredmerchanttemp: A temporary table for hired merchant data.
* htsquads: Organizes squads for the Horntail boss expedition.
* inventoryequipment: Details the stats and upgrades of equipment items in a character's inventory.
* inventoryitems: Manages all items within a character's inventory, including their type and quantity.
* ipbans: A list of all banned IP addresses to block access to the game.
* iplog: Logs the IP addresses used by accounts for security and tracking purposes.
* keymap: Stores the custom key configurations for each character.
* loginserver: Manages login server information and world assignments.
* macbans: A list of all banned MAC addresses to prevent users from circumventing IP bans.
* macfilters: Filters MAC addresses to control access to the game.
* marriages: Manages the marriage status and relationships between characters.
* monsterdrops: Defines the items that can be dropped by each monster and their drop rates.
* notes: Stores in-game notes created by players.
* pets: Contains information about player-owned pets, including their level and closeness.
* questinfo: Stores information about available quests.
* queststatus: Tracks the progress and completion status of quests for each character.
* reactordrops: Defines the items dropped by in-game reactors (interactive objects).
* reactors: Manages the state and properties of all in-game reactors.
* reports: A log of reports made by players against others for misconduct.
* rings: Manages friendship and couple rings, including partner information.
* savedlocations: Stores locations saved by players for quick travel.
* serverconfig: Contains global server configuration settings.
* shopitems: Defines the items sold in NPC shops, including their prices and stock.
* shops: Manages all NPC shops and their properties.
* sidekicks: Contains information about character sidekicks.
* skills: Stores the skill levels and data for each character.
* spawnpoints: Defines the locations where monsters spawn in the game world.
* storages: Manages items kept in the player's storage.
* tournaments: Contains information about in-game tournaments.
* trocklocations: Stores saved locations for the Teleport Rock item.
* zaksquads: Organizes squads for the Zakum boss expedition.
