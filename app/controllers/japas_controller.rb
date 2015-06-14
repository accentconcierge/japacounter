class JapasController < ApplicationController
  
  before_action :set_japa, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /japas
  # GET /japas.json
  def index
    @japas = Japa.where(user_id: current_user.id)
  end

  # GET /japas/1
  # GET /japas/1.json
  def show
  end

  # GET /japas/new
  def new
    @japa = current_user.japas.build
  end

  # GET /japas/1/edit
  def edit
  end

  # POST /japas
  # POST /japas.json
  def create
    @japa = current_user.japas.build(japa_params)

    respond_to do |format|
      if @japa.save
        format.html { redirect_to @japa, notice: 'Japa was successfully created.' }
        format.json { render :show, status: :created, location: @japa }
      else
        format.html { render :new }
        format.json { render json: @japa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /japas/1
  # PATCH/PUT /japas/1.json
  def update
    respond_to do |format|
      if @japa.update(japa_params)
        format.html { redirect_to @japa, notice: 'Japa was successfully updated.' }
        format.json { render :show, status: :ok, location: @japa }
      else
        format.html { render :edit }
        format.json { render json: @japa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /japas/1
  # DELETE /japas/1.json
  def destroy
    @japa.destroy
    respond_to do |format|
      format.html { redirect_to japas_url, notice: 'Japa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_japa
      @japa = Japa.find(params[:id])
    end
     

   def correct_user
      @japa = current_user.japas.find_by(id: params[:id])
      redirect_to japas_path, notice: "Not authorized to edit this japacount" if @japa.nil?
   
 end
    # Never trust parameters from the scary internet, only allow the white list through.
    def japa_params
      params.require(:japa).permit(:rounds, :comment, :user_id)
    end

end
