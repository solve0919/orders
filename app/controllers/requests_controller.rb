class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user , only: [:show ,:edit ,:update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
    @contractor = current_user.contractor
    @order = current_user.order
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @count = @request.status.to_i
    @count = @count + 1
    @request.status = @count
    @request.save
  end

  # GET /requests/new
  def new
    @request = Request.new
    @request.contractor_id = params[:id]  #contractor_IDを挿入
    @contractor = Contractor.find(params[:id]) #
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests  
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    @request.order_id = current_user.order.id
    @count = 0
    @request.status = @count #ステータスを確定
    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def ensure_correct_user 
      @order = @request.order
      @contractor = @request.contractor
      
      unless @request.can_access?(user = current_user)
        flash[:notice] = '権限がありません'
        redirect_to('/requests')
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:order_id, :contractor_id, :money, :delivery, :quantity, :hope, :note, :receive, :adress, :payment, :status)
    end
end
