class WorkSessionsController < ApplicationController

  def index
    @work_sessions = WorkSession.all.order(created_at: :desc)
  end

  def show

  end

  def create
    @work_session = WorkSession.new(work_session_params)
    @work_session.user_id = current_user.id
    if @work_session.save
      response = @work_session
    else
      response = { errors: @work_session.errors.full_messages }
    end
    render json: response
  end

  def edit

  end

  def update
    @work_session = WorkSession.find(params[:id])
    @work_session.finish = DateTime.now
    @work_session.hours = (@work_session.finish - @work_session.created_at)/3600
    if @work_session.save
      response = @work_session
    else
      response = { errors: @work_session.errors.full_messages }
    end
    render json: response
  end

  private

  def work_session_params
    params.require(:work_session).permit(:project_id, :finish)
  end

end
