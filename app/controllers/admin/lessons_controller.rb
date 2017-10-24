class Admin::LessonsController < Admin::ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @lessons = Kaminari.paginate_array(Lesson.all.order('created_at DESC')).page(params[:page]).per(20)
  end

  def show
  end

  def new
    @lesson = Lesson.new
    authorize [:admin, @lesson]
  end

  def edit
  end

  def create
    @lesson = Lesson.new(lesson_params)
    authorize [:admin, @lesson]

    if @lesson.save
      redirect_to @lesson, notice: 'Lesson was successfully created.'
    else
      render :new
    end
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to @lesson, notice: 'Lesson was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy
    redirect_to admin_lessons_url, notice: 'Lesson was successfully destroyed.'
  end

  private
    def set_lesson
      @lesson = Lesson.find(params[:id])
      authorize [:admin, @lesson]
    end

    def lesson_params
      params.require(:lesson).permit(:title, :question, :introduction, :image_id, :objectives, :activities, :assessment, :standards)
    end
end
