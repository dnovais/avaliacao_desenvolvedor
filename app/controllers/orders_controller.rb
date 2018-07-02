class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    if params[:order]
      file = params[:order][:import_file] if params[:order][:import_file]

      if file && file.content_type == 'text/plain'
        import_file_result = Order.import_file(file.read)

        respond_to do |format|
          if import_file_result[:status]
            format.html { redirect_to orders_url, notice: "File imported successfully and orders was successfully created.\n #{import_file_result[:total]}" }
            format.json { render action: 'index', status: :created, location: @order }
          else
            format.html { render action: 'index' }
            format.json { render json: @order.errors, status: :unprocessable_entity }
          end
        end
      end
    else
      respond_to do |format|
        format.html { render action: 'index', notice: "File not imported!" }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:person_id, :description, :unity_price, :quantity, :supplier_id)
    end
end
