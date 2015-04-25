class User < ActiveRecord::Base
	has_secure_password

	validates :name, presence: true
	validates :username, presence: true
	validates :birthdate, presence: true
	validates :username, length: { in: 3..50 },
		message: "Username must be between 3 and 50 characters."
	validates :password, length: { in: 8..50 },
		message: "Password must be between 8 and 50 characters."
	validates :stateOfResidence, length: { is: 2 }
	validates :email, presence: true
	validates :email, length: { maximum: 254 },
		message: "Invalid email address. Cannot be longer than 254 characters."

	validates :cigarettesPerDay, numericality: { only_integer: true },
		message: "Only integers are allowed for cigarettes per day."
	validates :dipsPerDay, numericality: { only_integer: true },
		message: "Only integers are allowed for dips per day."
	validates :cigarsPerDay, numericality: { only_integer: true },
		message: "Only integers are allowed for cigars per day."
end
