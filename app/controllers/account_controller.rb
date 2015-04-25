class AccountController < ApplicationController
	def create
		# fullName: document.getElementById('fullName').value,
		# birthYear: document.getElementById('user_date_of_birth_1i').value,
		# birthMonth: document.getElementById('user_date_of_birth_2i').value,
		# birthDay: document.getElementById('user_date_of_birth_3i').value,
		# placeOfResidence: document.getElementById('place_of_residence').value,
		# cigarettesPerDay: document.getElementById('cigarettesPerDay').value,
		# dipsPerDay: document.getElementById('dipsPerDay').value,
		# cigarsPerDay: document.getElementById('cigarsPerDay').value,
		# cigaretteBrand: document.getElementById('cigarette_brand').value,
		# cigarBrand: document.getElementById('cigar_brand').value,
		# dipBrand: document.getElementById('dip_brand').value,
		# username: username,
		# email: email,
		# password: password,
		# passwordConfirmation: passwordConfirmation

		isEmailTaken = true

		if false
			# create account
		else
			render :nothing => true, :status => 400, :json => {:errors => ["Full name: #{params[:fullName]}", "Error message 2"]}
		end
	end

	def login

	end

	def attempt

	end

	def logout

	end
end
