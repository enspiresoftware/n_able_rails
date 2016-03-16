require "n_able_rails/version"
require 'savon'

module NAbleRails
  attr_accessor :username, :password

  # Initialize required params to begin calls
  def self.initialize(sas_url, username, password)
    @username = username
    @password = password

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
    @client.call(:device_list, message: { Username: @username, Password: @password, Settings:
                                          { "@xsi:type" => "impl:ArrayOf_tns1_T_KeyPair", "@env:arrayType" => "impl:T_KeyPair[]",
                                          Setting:{key: "customerID", value: customer_id} }
                                        })
  end

  def self.get_device_info(device_id)
    @client.call(:device_get, message: { Username: @username, Password: @password, Settings:
                                { Setting:{key: "deviceID", value: device_id} }
                                       } )
  end

  def self.list_device_property(device_id)
    @client.call(:device_property_list, message: { Username: @username, Password: @password, DeviceIDs: { DeviceID: device_id}, DeviceNames:{}, FilterIDs:{}, FilterNames:{}, ReverseOrder: false })
  end

  def self.list_customers
    @client.call(:customer_list, message: { Username: @username, Password: @password, Settings: {  } })
  end

  def self.device_asset_info_export2ById(device_id)
    @client.call(:device_asset_info_export2, message: { Version: "0.0", Username: @username, Password: @password, Settings:
                                                        { Setting:{Key: 'TargetByDeviceID', Value: {Value: device_id} } }
                                                      } )
  end

  def self.device_asset_info_export2()
    @client.call(:device_asset_info_export2, message: { Version: "0.0", Username: @username, Password: @password })
  end

  def self.device_status(device_id)
    @client.call(:device_get_status, message: { Username: @username, Password: @password, Settings:
                                          { Setting:{key: "deviceID", value: device_id} }
                                              } )
  end
end
