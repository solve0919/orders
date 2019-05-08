class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy ,:case_status]
  before_action :ensure_correct_user , only: [:show ,:edit ,:update, :destroy ,:case_status ]
  


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
  end

  def case_status
    case @request.status 
      when 'request'
        @request.status  = 'consultation'
      when 'consultation'
        @request.status  = 'orders'
      when 'orders'
        @request.status  = 'work'
      when 'work'
        @request.status  = 'shipping'
      when 'shipping'
        @request.status  = 'completion'
      when 'completion'
        @request.status  = 'completion'
    end
    @request.save
    redirect_to request_path
  end


  # GET /requests/new
  def new
    @request = Request.new
    @request.contractor_id = params[:id]  #contractor_IDを挿入
    @contractor = @request.contractor #
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests  
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    @request.order_id = current_user.order.id
    @request.status = 0 #ステータスを確定
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
      unless @request.can_access?(current_user)
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
