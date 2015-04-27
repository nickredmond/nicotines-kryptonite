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

		isEmailTaken = User.exists?([ "email = ?", params[:email] ])
		isUsernameTaken = User.exists?([ "username = ?", params[:username] ])
		isValidInput = false
		errorMessages = []

		begin
			if !(isEmailTaken || isUsernameTaken)
				stateCode = normalize_place_of_residence params[:placeOfResidence]

				monthNumber = Date::MONTHNAMES.index(params[:birthMonth]) # TODO: drop the 'ABBR_' if it's full month names
				theYear = params[:birthYear].to_i
				theDay = params[:birthDay].to_i
				# Rails.logger.debug("nil to ingeter: #{params[:birthYear]} #{monthNumber} #{params[:birthDay]}")
				birthdate = DateTime.new(theYear, monthNumber, theDay)

				dailyCigarettes = params[:cigarettesPerDay].empty? ? 0 : params[:cigarettesPerDay].to_i
				dailyDips = params[:dipsPerDay].empty? ? 0 : params[:dipsPerDay].to_i
				dailyCigars = params[:cigarsPerDay].empty? ? 0 : params[:cigarsPerDay].to_i

				user = User.new(name: params[:fullName], username: params[:username], birthdate: birthdate,
								stateOfResidence: stateCode, cigarettesPerDay: dailyCigarettes,
								dipsPerDay: dailyDips, cigarsPerDay: dailyCigars,
								email: params[:email], password: params[:password], 
								passwordConfirmation: params[:passwordConfirmation]
								)

				set_user_tobacco_brands user

				if user.save()
					isValidInput = true
				else
					user.errors.full_messages.each do |error|
						errorMessages.push(error)
					end
				end
			else
				errorMessages.push("Username is already taken.") if isUsernameTaken
				errorMessages.push("Email address is already taken.") if isEmailTaken
			end	
		rescue
			theYear = params[:birthYear].to_i
			theDay = params[:birthDay].to_i
			errorMessages.push("wtf: #{theYear} #{theDay}") 
			render :nothing => true, :status => 400, :json => {:errors => errorMessages}
		end

		if isValidInput
			session[:is_new_user] = true
			redirect_to :action => 'index', :controller => 'dashboard'
		else
			#render :nothing => true, :status => 400, :json => {:errors => errorMessages}
		end
	end

	def login

	end

	def attempt

	end

	def logout

	end
private
	def set_user_tobacco_brands user
		user.ciaretteBrandId = (user.cigarettesPerDay > 0) ? 
			TobaccoBrand.find(:first, :conditions => [ "name = ?", params[:cigaretteBrand] ]).id : nil
		user.dipBrandId = (user.dipsPerDay > 0) ? 
			TobaccoBrand.find(:first, :conditions => [ "name = ?", params[:dipBrand] ]).id : nil
		user.cigarBrandId = (user.cigarsPerDay > 0) ? 
			TobaccoBrand.find(:first, :conditions => [ "name = ?", params[:cigarBrand] ]).id : nil
	end

	def normalize_place_of_residence stateCode
		stateCode = 'PR' if stateCode == 'Puerto Rico'
		stateCode = 'XX' if stateCode == 'Outside U.S.'
	end
end
