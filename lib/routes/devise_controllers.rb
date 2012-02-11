class Routes::DeviseControllers
  @prefix = 'auth/devise'
  @controllers = [:confirmations, :passwords, :registrations, :sessions, :unlocks]

  def self.controllers
    @controllers
  end

  def self.prefix
    @prefix
  end

  def self.to_hash
    Hash[*controllers.map {|controller| [controller, "#{prefix}/#{controller}"]}.flatten]
  end
end
