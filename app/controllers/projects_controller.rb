class ProjectsController < ApplicationController
  load_and_authorize_resource only: [:show, :destroy]
  before_action :fetch_project, only: [:show, :destroy]

  def index
    @projects =  current_user.projects
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    unless @project.errors.blank?
      respond_to do |format|
        format.js
      end
    else 
      @project.users << current_user
      redirect_to project_path(@project)
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end 

  def send_invitation
    project = Project.find(params[:project_id])
    user = current_user
    params[:users].each do |email|
      token = encode({email: email, project_id: params[:project_id]})
      to = User.find_by_email(email)
      InvitationMailer.send_project_invitation(user,email, token, project.name).deliver_now unless(project.users.include?(to))
    end
    redirect_to project_path(project)
  end

  def accept_invitation
    decoded_token = decode(params[:t]).first
    user = User.find_by_email(decoded_token["email"])
    project = Project.find(decoded_token["project_id"])
    if project.present?
      project.users << user  if(user == current_user && !user.projects.include?(project))
    end 
    redirect_to project_path(project)
  end 

  private

    def fetch_project
      @project = Project.find(params[:id])
    end 

    def project_params
      params.require(:project).permit(:name)
    end 

end
