require "n_able_rails/version"
require 'savon'

module NAbleRails
  attr_accessor :username, :password

  #params sas_url, username, password,
  def self.initialize
    # Define variables... These will be params eventually.
    sas_url = "http://nablenfr.ensi.com"
    @username = "alex.myers@enspiresoftware.com"
    @password = "Enspire123!@#"

    # create a client for the service
    @client = Savon.client(wsdl: "#{sas_url}/dms/services/ServerEI?wsdl")
  end


  # List all available operations for the api.
  def self.operations
    @client.operations
  end

  # Sanity Check to see if you can hit the server.
  def self.version_info
    @client.call(:version_info_get)
  end

  def self.list_devices(customer_id)
    @client.call(:device_list, message: { Username: @username, Password: @password, Settings: { customerID: customer_id } } )
  end

  def self.get_device_info(device_id)
    @client.call(:device_get, message: { Username: @username, Password: @password, Settings: { deviceID: device_id } } )
  end

  def self.list_device_property(device_id)
    @client.call(:device_property_list, message: { Username: @username, Password: @password, Settings: { deviceID: device_id } } )
  end

  def self.list_customers
    initialize
    #@client.call(:customer_list, message: { Username: @username, Password: @password, Settings: { listSOs: false} } )
    request = @client.build_request(:customer_list, message: { Username: @username, Password: @password, Settings: { key: "listsos", value: "false"} } )

    puts request.headers
    puts request.body
    request = @client.call(:customer_list, message: { Username: @username, Password: @password, Settings: { key: "listsos", value: "false"} } )
  end

  def self.device_status(device_id)
    @client.call(:device_property_list, message: { Username: @username, Password: @password, Settings: { deviceID: device_id } } )
  end
end
