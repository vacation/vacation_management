class UserMailer < ActionMailer::Base
  default from: "leahliu7@gmail.com"
  def vacation_approved(user)
  	@user = user
  	mail(:to => user.email, :subject => "Vacation Approved")
  end
  def account_approved(user)
  	@user = user
  	mail(:to => user.email, :subject => "Account Approved")
  end
  def vacation_declined(user)
  	@user = user
  	mail(:to => user.email, :subject => "Account declined")
  end
end
