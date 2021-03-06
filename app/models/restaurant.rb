class Restaurant < ApplicationRecord

	has_many :reviews,
					-> {extending WithUserAssociationExtension },
					dependent: :destroy

	validates :name, length: { minimum: 3 }, uniqueness: true
end
