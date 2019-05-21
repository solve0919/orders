class ContractorsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  protect_from_forgery :except => [:new ,:create]
  


  # GET /contractors
  # GET /contractors.json
  def index
    @contractors = Contractor.all
    @contractor = current_user.contractor
    @order = current_user.order
  end

  # GET /contracto  rs/1
  # GET /contractors/1.json
  def show
    @contractor = Contractor.find(params[:id])
    @categories = Category.all
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
    @contractor.name = current_user.order.name #orderから名前を引っ張ってくる
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def contractor_params
      params.require(:contractor).permit(:user_id, :name, :adress, :birthday, :prefectures, :phone_number, :description, :image ,:category_ids => [])
    end
    
    def ensure_correct_user
      if current_user.id != @contractor.user_id
        flash[:notice] = "権限がありません"
        redirect_to("/contractors")
      end
    end
  
end
