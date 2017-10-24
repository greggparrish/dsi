class Admin::HeadersController < Admin::ApplicationController

  def new
    @header = Header.new
    authorize [:admin, @header]
  end

  def edit
  end

  def create
    @header = Header.new(header_params)
    authorize [:admin, @header]
    respond_to do |format|
      if @header.save
        format.html { redirect_to @header, notice: 'header was successfully created.' }
        format.json { render :show, status: :created, location: @header }
      else
        format.html { render :new }
        format.json { render json: @header.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @header = Header.find(params[:id])
    @modelpath = '/admin/'+@header.modelname.pluralize
    authorize [:admin, @header]
    respond_to do |format|
      if @header.update(header_params)
        format.html { redirect_to @modelpath, notice: 'header was successfully updated.' }
        format.json { render :show, status: :ok, location: @header }
      else
        format.html { render :edit }
        format.json { render json: @header.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @header.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'header was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def header_params
      params.require(:header).permit(:guide,:guide_text,:image_id,:modelname,:text,:title)
    end

end
