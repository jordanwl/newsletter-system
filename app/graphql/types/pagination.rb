module Types
  class Pagination < BaseInputObject
    argument :offset, Integer, required: false
    argument :limit, Integer, required: false
  end
end
