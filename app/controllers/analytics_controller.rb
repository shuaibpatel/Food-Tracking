class AnalyticsController < ApplicationController
  before_action :set_analytic, only: [:show, :edit, :update, :destroy]

  # GET /analytics
  # GET /analytics.json
  def index
    @analytics = Analytic.all
  end

  # GET /analytics/1
  # GET /analytics/1.json
  def show
  end

  # GET /analytics/new
  def new
    @analytic = Analytic.new
  end
  
  def proteinCalc
  
  end 
  
  def proteinCounter

		@weight= params[:check_number]

		@protein=ProteinCount.weight(@weight.to_i)



 end	
  
  
  def graphs
    @monday=Analytic.where(:Day =>['Monday']).sum(:Calories)
    @tuesday=Analytic.where(:Day =>['Tuesday']).sum(:Calories)
    @wednesday=Analytic.where(:Day =>['Wednesday']).sum(:Calories)
    @thursday=Analytic.where(:Day =>['Thursday']).sum(:Calories)
    @friday=Analytic.where(:Day =>['Friday']).sum(:Calories)
    @saturday=Analytic.where(:Day =>['Saturday']).sum(:Calories)
    @sunday=Analytic.where(:Day =>['Sunday']).sum(:Calories)
    
    
    
    @protein=Analytic.sum(:Protein)
    @carb=Analytic.sum(:Carbohydrates)
    @fat=Analytic.sum(:Fats)
    
    
    @target=@monday+@tuesday+@wednesday+@thursday+@friday+@saturday+@sunday
    
    
    
  end  
  
  
  

  # GET /analytics/1/edit
  def edit
  end

  # POST /analytics
  # POST /analytics.json
  def create
    @analytic = Analytic.new(analytic_params)

    respond_to do |format|
      if @analytic.save
        format.html { redirect_to @analytic, notice: 'Analytic was successfully created.' }
        format.json { render :show, status: :created, location: @analytic }
      else
        format.html { render :new }
        format.json { render json: @analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analytics/1
  # PATCH/PUT /analytics/1.json
  def update
    respond_to do |format|
      if @analytic.update(analytic_params)
        format.html { redirect_to @analytic, notice: 'Analytic was successfully updated.' }
        format.json { render :show, status: :ok, location: @analytic }
      else
        format.html { render :edit }
        format.json { render json: @analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analytics/1
  # DELETE /analytics/1.json
  def destroy
    @analytic.destroy
    respond_to do |format|
      format.html { redirect_to analytics_url, notice: 'Analytic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analytic
      @analytic = Analytic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analytic_params
      params.require(:analytic).permit(:Food, :Day, :Protein, :Carbohydrates, :Fats, :Calories, :Country)
    end
end
