module Aris
  module_function
  def config
    @@config ||= {
      database_url: ENV.fetch('DATABASE_URL')
    }
  end
end
