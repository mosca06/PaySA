class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save

      @transaction.update!(status: 'Processed')
      redirect_to @transaction, notice: 'Transaction was successfully created and processed.'
    else
      render :new
    end
  end


  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transaction_url(@transaction), notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy!

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:amount, :currency, :status)
    end

  def simulate_payment(transaction)
    begin
      token = 'tok_visa'

      charge = Stripe::Charge.create(
        amount: (transaction.amount * 100).to_i, # Valor em centavos
        currency: transaction.currency,
        description: "Payment for transaction ##{transaction.id}",
        source: token # O token do cartão de crédito de teste
      )

      transaction.update!(
        transaction_number: charge.id,
        payment_method: 'Stripe Test Payment',
        processed_at: Time.current,
        status: 'Processed'
      )

      Rails.logger.info "Payment simulation completed for transaction ##{transaction.id}"
      Rails.logger.info "Transaction ID: #{charge.id}"
      Rails.logger.info "Payment Method: Stripe Test Payment"

    rescue Stripe::CardError => e
      Rails.logger.error "Payment simulation failed for transaction ##{transaction.id}: #{e.message}"
      transaction.update!(status: 'Failed')
    end
  end
end
