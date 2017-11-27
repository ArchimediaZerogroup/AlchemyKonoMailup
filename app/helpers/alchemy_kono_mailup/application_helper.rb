module AlchemyKonoMailup
  module ApplicationHelper

    def client
      if KonoMailup::API.client_ready?
        KonoMailup::API.new
      else
        false
      end
    end

    def mailup_lists
      if client
        client.console.user.lists.deep_symbolize_keys[:Items]
      else
        []
      end
    end


  end
end
