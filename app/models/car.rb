class Car < ApplicationRecord
    scope :search_for, -> (query) {
        where(
            arel_table[:brand].matches("%#{query}%")
            .or(arel_table[:model].matches("%#{query}%"))
            .or(arel_table[:registration_number].matches("%#{query}%"))
        )
        .order(arel_table[:id].asc)
      }
end
