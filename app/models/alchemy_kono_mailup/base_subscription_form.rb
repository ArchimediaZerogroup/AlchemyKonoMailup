module AlchemyKonoMailup
  class BaseSubscriptionForm
    include ActiveModel::Model

    attr_accessor :newsletter_list, :email, :element_id

    validates :newsletter_list, :email, :element_id, :presence => true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  end
end