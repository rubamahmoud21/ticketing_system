class InvitationMailer < ApplicationMailer
  layout false 
  def send_project_invitation(user,email,token, project_name)
    @token  = token
    @user = user 
    @project_name = project_name
    mail(from: "rubamahmoud37@gmail.com", to: email, subject: 'invitation')
  end
end
