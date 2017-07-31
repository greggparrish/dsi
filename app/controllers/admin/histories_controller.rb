class Admin::HistoriesController < Admin::ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]

  def index
    @histories = Kaminari.paginate_array(History.all.order('date DESC')).page(params[:page]).per(20)
  end

  def show
  end

  def new
    @history = History.new
    authorize [:admin, @history]
  end

  def edit
  end

  def create
    @history = History.new(history_params)
    authorize [:admin, @history]
    respond_to do |format|
      if @history.save
        format.html { redirect_to @history, notice: 'history was successfully created.' }
        format.json { render :show, status: :created, location: @history }
      else
        format.html { render :new }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @history.update(history_params)
        format.html { redirect_to @history, notice: 'history was successfully updated.' }
        format.json { render :show, status: :ok, location: @history }
      else
        format.html { render :edit }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_history
      @history = History.friendly.find(params[:id])
      authorize [:admin, @history]
    end

    def history_params
      params.require(:history).permit(:image, :title, :date, :description, :media)
    end
end
