module Types
  class SubscriberArgs < BaseInputObject
    argument :name, String, required: false
    argument :email, String, required: false
  end
end
