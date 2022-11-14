class Author < ApplicationRecord

    has_and_belongs_to_many :papers
    validates :last_name, presence: true,
                    length: { minimum: 1 }
    def name
        self.first_name + " " + self.last_name
    end

end
