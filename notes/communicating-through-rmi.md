# Communicating through RMI

Based on my examination of the source code, here is a detailed explanation of how the LoginServer, ChannelServer, and WorldServer communicate:

  Communication Architecture: Java RMI

  The servers communicate using Java RMI (Remote Method Invocation). This allows objects in one Java virtual machine (JVM) to invoke methods on objects in another JVM. The WorldServer acts as a
  central RMI registry and coordinator.

  `WorldServer`'s Role: The Central Hub

   1. RMI Registry: The WorldServer starts and creates an RMI registry on a specific port. It then binds an object, an instance of WorldRegistryImpl, to this registry with the name "WorldRegistry".
      This WorldRegistry object is the single entry point for all other servers.

   2. Central Configuration: The WorldServer is responsible for loading and providing global configuration properties from world.properties and db.properties. This includes game rates (EXP, meso,
      drop), server messages, and other world-specific settings.

   3. Server Registration: The WorldRegistryImpl (running within the WorldServer's process) exposes methods for the other servers to register themselves:
       * registerLoginServer(key, lwi): Called by the LoginServer to register itself.
       * registerChannelServer(key, cwi): Called by a ChannelServer to register itself.

   4. State Management: It maintains the state of the entire world, including which login servers and channel servers are online, their IP addresses, and the number of players connected to each
      channel. It also manages cross-channel social features like parties, guilds, and messengers.

  `LoginServer`'s Role: Authentication and Channel Listing

   1. Registration: On startup, the LoginServer connects to the WorldServer's RMI registry, looks up the "WorldRegistry", and calls the registerLoginServer method. This action informs the WorldServer
      that a new login server is available.

   2. Receiving Configuration: After registering, the LoginServer receives a WorldLoginInterface object from the WorldServer. It uses this interface to pull necessary configuration, such as the user
      limit, server name, and event messages.

   3. Channel Information: The LoginServer is responsible for displaying the list of available worlds and channels to the player. It gets this information from the WorldServer. The WorldServer knows
      which ChannelServers are running and how many players are on each one. The LoginServer periodically updates this information.

   4. Player Authentication: When a player authenticates, the LoginServer communicates with the database to verify credentials.

   5. Directing Players: After a player selects a channel, the LoginServer provides the client with the IP address and port of the selected ChannelServer. This information is obtained from the
      WorldServer.

  `ChannelServer`'s Role: Gameplay

   1. Registration: Similar to the LoginServer, each ChannelServer instance connects to the WorldServer's RMI registry on startup. It calls registerChannelServer to make itself known to the world.

   2. Receiving Configuration: Upon registration, it receives a WorldChannelInterface object. It uses this to fetch game-specific properties from the WorldServer, such as EXP, meso, and drop rates.

   3. "Ready" Notification: Once the ChannelServer has successfully initialized (loaded maps, events, etc.), it calls serverReady() on the WorldChannelInterface. This tells the WorldServer that it is
      ready to accept players. The WorldServer can then start showing this channel as "online" on the LoginServer.

   4. Handling Players: The ChannelServer is where all the core gameplay happens. It manages maps, NPCs, monsters, and player interactions within its designated channel.

   5. Cross-Channel Communication: When a player performs an action that affects players on other channels (e.g., sending a whisper to a friend on another channel, managing a guild), the ChannelServer
      uses its WorldChannelInterface to send the request to the WorldServer. The WorldServer then relays the message or state change to the appropriate ChannelServer(s). For example, guild and party
      operations are managed centrally by the WorldServer to ensure consistency across all channels.

  Summary of the Communication Flow:

   1. WorldServer starts up first and establishes the RMI registry.
   2. LoginServer and one or more ChannelServers start up.
   3. They each connect to the WorldServer's RMI registry and register themselves.
   4. They pull their respective configurations from the WorldServer.
   5. A player connects to the LoginServer.
   6. LoginServer gets the list of available channels from the WorldServer and displays it.
   7. The player selects a channel.
   8. LoginServer tells the player's client the IP and port for the chosen ChannelServer.
   9. The player's client disconnects from the LoginServer and connects to the ChannelServer.
   10. All subsequent gameplay and cross-channel interactions are handled by the ChannelServer, which communicates with the WorldServer as needed.

  This architecture allows for multiple channel servers to handle the gameplay load while the world and login servers manage the overall state and authentication, creating a scalable multi-server
  environment.
