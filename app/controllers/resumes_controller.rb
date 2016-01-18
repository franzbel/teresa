class ResumesController < ApplicationController
  def new
    @resume = Resume.new
    1.times  { @resume.photos.build }
    3.times  { @resume.emails.build }
    3.times  { @resume.phones.build }
    3.times  { @resume.sites.build }
    10.times { @resume.experiences.build }
    5.times  { @resume.educations.build }
  end

  def create
    # render(:text => params)
    resume = Resume.new(resume_params)
    resume.user = current_user
    resume.save
    redirect_to resume_path(resume.id)
  end


  def show
    @resume = Resume.find(params[:id])
  end

  def edit
    @resume = Resume.find(params[:id])
    (1-@resume.photos.count).times  { @resume.photos.build }
    (3-@resume.emails.count).times  { @resume.emails.build }
    (3-@resume.phones.count).times  { @resume.phones.build }
    (3-@resume.sites.count).times  { @resume.sites.build }
    (10-@resume.experiences.count).times { @resume.experiences.build }
    (5-@resume.educations.count).times { @resume.educations.build }
  end

  def update
    # render(:text => params)
    resume = Resume.find(params[:id])
    resume.update(resume_params)
    redirect_to resume_path(resume.id)
  end

  private
  def resume_params
    params.require(:resume).permit(:name,
                                   photos_attributes:[:id, :photo],
                                   emails_attributes: [:id, :email],
                                   phones_attributes: [:id, :number],
                                   sites_attributes: [:id, :name],
                                   experiences_attributes: [:id, :start_date,
                                                            :end_date,
                                                            :job_title,
                                                            :company_name,
                                                            :job_description],
                                    educations_attributes:[:id,
                                                           :start_date,
                                                           :end_date,
                                                           :degree_name,
                                                           :school_name,
                                                           :education_description])
  end
end
