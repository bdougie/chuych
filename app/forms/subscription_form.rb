class SubscriptionForm
  include Virtus.model
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attribute :email, String
  attribute :name, String

end
