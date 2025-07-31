# Networking with apache mina core

Go through all java files under src, find all apache mina usages, and explain how the system work in networking perspective.

---

Core Components:

   * `org.apache.mina.transport.socket.nio.SocketAcceptor`: This is the core of the server. It listens for incoming TCP connections from clients on a specific port. There are two main servers in this
     application:
       * `net.sf.odinms.net.login.LoginServer`: Handles the initial login process.
       * `net.sf.odinms.net.channel.ChannelServer`: Manages a specific game channel that players connect to after logging in.
   * `org.apache.mina.filter.codec.ProtocolCodecFilter`: This filter is attached to the SocketAcceptor. It uses a MapleCodecFactory to create a MaplePacketEncoder and a MaplePacketDecoder.
       * `net.sf.odinms.net.mina.MaplePacketDecoder`: When the server receives data from a client, this decoder is responsible for reading the raw bytes and assembling them into a MaplePacket object.
         It handles the specifics of the game's network protocol, such as packet headers and length.
       * `net.sf.odinms.net.mina.MaplePacketEncoder`: When the server wants to send data to a client, this encoder takes a MaplePacket object and converts it into a stream of bytes that can be sent
         over the network.
   * `net.sf.odinms.net.MapleServerHandler`: This is an IoHandlerAdapter that gets attached to the SocketAcceptor. It's the primary entry point for all network events. Key methods include:
       * sessionOpened: Called when a new client connects. It creates a MapleClient object to represent the connection.
       * sessionClosed: Called when a client disconnects. It handles cleaning up the MapleClient and removing the player from the game.
       * messageReceived: Called when a complete MaplePacket has been decoded by the MaplePacketDecoder. The handler then dispatches the packet to the appropriate MaplePacketHandler for processing
         based on the packet's opcode.
   * `net.sf.odinms.client.MapleClient`: This class represents a single client connected to the server. It holds the IoSession from MINA, which is the actual connection to the client. It also manages
     the player's state, such as their character information. When the server needs to send a packet to a client, it calls the sendPacket method on the corresponding MapleClient object, which in turn
     uses the IoSession to write the data.

  Network Flow:

   1. Server Startup: The LoginServer and ChannelServer are started. Each one creates a SocketAcceptor and binds it to a specific port. They configure the acceptor with a ProtocolCodecFilter (using
      the MapleCodecFactory) and a MapleServerHandler.
   2. Client Connection: A game client connects to the LoginServer's port. The SocketAcceptor accepts the connection, and a new IoSession is created.
   3. Session Opened: The MapleServerHandler's sessionOpened method is called. It creates a new MapleClient object and associates it with the IoSession.
   4. Packet Reception: The client sends a packet (e.g., a login request). The MaplePacketDecoder reads the incoming bytes, decrypts them, and creates a MaplePacket object.
   5. Message Received: The MapleServerHandler's messageReceived method is called with the decoded MaplePacket.
   6. Packet Handling: The handler looks up the appropriate MaplePacketHandler based on the packet's opcode and passes the packet to it for processing.
   7. Sending a Response: The packet handler generates a response packet (e.g., a login success or failure packet) and uses the MapleClient's sendPacket method to send it back to the client.
   8. Packet Encoding: The MaplePacketEncoder takes the response packet, encrypts it, and writes the raw bytes to the IoSession.
   9. Client Disconnection: When the client disconnects, the sessionClosed method is called, and the server cleans up the associated MapleClient object.

  In essence, the system uses MINA to handle the low-level networking tasks of accepting connections and reading/writing data. The application logic is built on top of this, with custom codecs for
  the game's specific packet structure and a handler-based system for processing game events.
