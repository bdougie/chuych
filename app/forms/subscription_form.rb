class SubscriptionForm
  include Virtus.model
  include ActiveModel::Conversion
  extend  ActiveModel::Naming
  include Subscribable

  attribute :email, String

end
