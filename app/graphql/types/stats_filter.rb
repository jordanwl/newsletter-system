module Types
  class StatsFilter < GraphQL::Schema::Enum
    value "DAYS"
    value "WEEKS"
    value "MONTHS"
    value "YEARS"
  end
end
