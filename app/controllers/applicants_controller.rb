class ApplicantsController < ApplicationController
  def create
    # render(:text => params[:applicant])
    applicant = Applicant.new(applicant_params)
    applicant.applicant_id = current_user.id
    applicant.save
    redirect_to  profile_path(current_user.name)
  end
  private
  def applicant_params
    params.require(:applicant).permit(:job_vacancy_id)
  end
end
