class AlertMailer < ActionMailer::Base
  default from: "from@example.com"

  def alert(alert,email)
    mail(:to => email, :subject => "#{alert.school.name}") do |format|
      render :text => 'hello'
    end

  end
end
