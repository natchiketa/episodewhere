class VlcService
  class VlcUnavailableError < StandardError; end

  def initialize
    #TODO: configurable client
    @client = VLC::Client.new('127.0.0.1', 9999)
    @system = VLC::System.new
    @client.connect unless @system.connected?
  end

  def raise_client_error
    raise VlcUnavailableError, "Failed to reach VLC client"
  end

  def system
    @system
  end

  def client
    @client
  end
end
