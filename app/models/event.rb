class Event < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments

=begin
    # Validate
    validates :start_date,
            presence: true
            validate: is_past?

    validates :duration,
            presence: true
            validate: is_multiple_of_5?
   
    validates :title,
                presence: true,
                length: { in: 6..100 }

    validates :description,
                presence: true

    validates :price,
                presence: true,
                numericality: { in: 2..100 }

    validates :location,
            presence: true

    #######
    private
    #######

    def is_past?
        start_date < Date.today
    end

    def is_multiple_of_5?
        duration > 0 && duration % 5 == 0
    end
=end

end