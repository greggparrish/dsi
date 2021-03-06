class LessonsController < ApplicationController

  def index
    @lessons = Kaminari.paginate_array(policy_scope(Lesson.includes(:image))).page(params[:page]).per(20)
  end

  def show
    @lesson = Lesson.friendly.find(params[:id])
    authorize @lesson
  end

end
