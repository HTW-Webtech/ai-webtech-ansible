module ArisControl
  class Bookkeeper
    attr_reader :persistence

    def initialize(persistence)
      @persistence = persistence
      @users = persistence.load_users
    end

    def list
      @users
    end

    def add(name:, email:, **opts)
      attributes = opts.merge(name: name, email: email)
      @users << Aris::User.new(attributes)
      @persistence.store(@users)
    end

    def delete(name)
      @users.reject! { |user| user.name == name }
      @persistence.store(@users)
    end
  end
end
