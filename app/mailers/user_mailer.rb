class UserMailer < ApplicationMailer
	default from: "vincentgao99@gmail.com"

	def welcome_email(user)
		@user=user
		mail(to: @user.email, subject: "Welcome to Deal Now")
	end
end
