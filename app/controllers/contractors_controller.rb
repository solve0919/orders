class ContractorsController < ApplicationController
  before_action :set_contractor, {only: [:show, :edit, :update, :destroy]}
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy,]}
  protect_from_forgery :except => [:new ,:create]
  


  # GET /contractors
  # GET /contractors.json
  def index
    @contractors = Contractor.all
    @contractor = Contractor.find_by(user_id: current_user)
    @order = Order.find_by(user_id: current_user)
  end

  # GET /contracto  rs/1
  # GET /contractors/1.json
  def show
  end

  # GET /contractors/new
  def new
    @contractor = Contractor.new
  end

  # GET /contractors/1/edit
  def edit
  end

  # POST /contractors
  # POST /contractors.json
  def create
    @contractor = Contractor.new(contractor_params)
    @contractor.user = current_user
    @contractor.save
    respond_to do |format|
      if @contractor.save
        format.html { redirect_to @contractor, notice: 'Contractor was successfully created.' }
        format.json { render :show, status: :created, location: @contractor }
      else
        format.html { render :new }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contractors/1
  # PATCH/PUT /contractors/1.json
  def update
    respond_to do |format|
      if @contractor.update(contractor_params)
        format.html { redirect_to @contractor, notice: 'Contractor was successfully updated.' }
        format.json { render :show, status: :ok, location: @contractor }
      else
        format.html { render :edit }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contractors/1
  # DELETE /contractors/1.json
  def destroy
    @contractor.destroy
    respond_to do |format|
      format.html { redirect_to contractors_url, notice: 'Contractor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    # Use callbacks to share common setup or constraints between actions.
    def set_contractor
      @contractor = Contractor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contractor_params
      params.require(:contractor).permit(:user_id, :name, :adress, :birthday, :prefectures, :phone_number, :description)
    end

    def ensure_correct_user
      @contractor = Contractor.find_by(id: params[:id])
      if current_user.id != @contractor.user_id
        flash[:notice] = "権限がありません"
        redirect_to("/contractors")
      else
      end
    end
end
