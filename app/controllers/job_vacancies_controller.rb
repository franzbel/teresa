class JobVacanciesController < ApplicationController
  def index
    @job_vacancies = JobVacancy.all
  end

  def new
    @job_vacancy = JobVacancy.new
  end

  def create
    # render(:text => params)
    @job_vacancy = JobVacancy.new(job_vacancy_params)
    @job_vacancy.user = current_user
    @job_vacancy.save
    redirect_to @job_vacancy
  end

  def show
    # render(:text => params)
    @job_vacancy = JobVacancy.find(params[:id])
  end

  def edit
    # render(:text => params)
    @job_vacancy = JobVacancy.find(params[:id])
  end

  def update
    # render(:text => params)
    @job_vacancy = JobVacancy.find(params[:id])
    @job_vacancy.update(job_vacancy_params)
    redirect_to @job_vacancy
  end

  def destroy
    # render(:text => params)
    @job_vacancy = JobVacancy.find(params[:id])
    @job_vacancy.destroy
    redirect_to job_vacancies_url
  end

  private
  def job_vacancy_params
    params.require(:job_vacancy).permit(:years_of_experience, :education)
  end
end
