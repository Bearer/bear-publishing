class PaymentAccountsController < ApplicationController
  before_action :require_user!
  before_action :set_payment_account, only: %i[ show edit update destroy ]

  # GET /payment_accounts or /payment_accounts.json
  def index
    @payment_accounts = current_organization.payment_accounts
  end

  # GET /payment_accounts/1 or /payment_accounts/1.json
  def show
  end

  # GET /payment_accounts/new
  def new
    @payment_account = current_organization.payment_accounts.build
  end

  # GET /payment_accounts/1/edit
  def edit
  end

  # POST /payment_accounts or /payment_accounts.json
  def create
    @payment_account = current_organization.payment_accounts.build(payment_account_params)

    respond_to do |format|
      if @payment_account.save
        format.html { redirect_to payment_account_url(@payment_account), notice: "Payment account was successfully created." }
        format.json { render :show, status: :created, location: @payment_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_accounts/1 or /payment_accounts/1.json
  def update
    respond_to do |format|
      if @payment_account.update(payment_account_params)
        format.html { redirect_to payment_account_url(@payment_account), notice: "Payment account was successfully updated." }
        format.json { render :show, status: :ok, location: @payment_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_accounts/1 or /payment_accounts/1.json
  def destroy
    @payment_account.destroy

    respond_to do |format|
      format.html { redirect_to payment_accounts_url, notice: "Payment account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_account
      @payment_account = PaymentAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_account_params
      params.require(:payment_account).permit(:reference_name, :holder_address, :bank_address, :bank_name, :account_number, :sort_code, :holder_name)
    end
end
