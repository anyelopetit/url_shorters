class ShortersController < ApplicationController
  before_action :set_shorter, only: [:show, :edit, :update, :destroy]

  # GET /shorters
  # GET /shorters.json
  def index
    @shorters = Shorter.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /shorters/1
  # GET /shorters/1.json
  def show
  end

  # GET /shorters/new
  def new
    @shorter = Shorter.new
  end

  # GET /shorters/1/edit
  def edit
  end

  # POST /shorters
  # POST /shorters.json
  def create
    @shorter = Shorter.new(shorter_params)

    respond_to do |format|
      if @shorter.save
        format.html { redirect_to @shorter, notice: 'Shorter was successfully created.' }
        format.json { render :show, status: :created, location: @shorter }
      else
        format.html { render :new }
        format.json { render json: @shorter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shorters/1
  # PATCH/PUT /shorters/1.json
  def update
    respond_to do |format|
      if @shorter.update(shorter_params)
        format.html { redirect_to @shorter, notice: 'Shorter was successfully updated.' }
        format.json { render :show, status: :ok, location: @shorter }
      else
        format.html { render :edit }
        format.json { render json: @shorter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shorters/1
  # DELETE /shorters/1.json
  def destroy
    @shorter.destroy
    respond_to do |format|
      format.html { redirect_to shorters_url, notice: 'Shorter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def counter
    @shorter = Shorter.find(params[:shorter_id])
    @shorter.update(redirect_counter: @shorter.redirect_counter.nil? ? 0 : @shorter.redirect_counter + 1)
    redirect_to "https://#{@shorter.original_url}"
    # redirect_to shorters_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shorter
      @shorter = Shorter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shorter_params
      params.require(:shorter).permit(:original_url, :shorted_url, :expire_time, :redirect_counter)
    end
end
