class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_one :profile
    has_many :addresses

    default_scope { includes(:profile) }

    scope :search_for, -> (query) {
        where(
            arel_table[:name].matches("%#{query}%")
            .or(arel_table[:email].matches("%#{query}%"))
            .or(Profile.arel_table[:name].matches("%#{query}%"))
        )
        .references(:profile)
        .order(arel_table[:id].asc)
      }
end
