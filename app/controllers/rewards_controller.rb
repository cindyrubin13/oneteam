class RewardsController < ApplicationController
  # GET /rewards
  # GET /rewards.json
  def index
    @request_selection = RequestSelection.find(params[:request_selection_id])
    @current_date = DateTime.now
    @rewards = Reward.all
    @skills = Skill.all
    @developer_skills = DeveloperSkill.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rewards }
    end
  end

  # GET /rewards/1
  # GET /rewards/1.json
  def show
   
     @current_date = DateTime.now
     @skills = Skill.all
     @request_selection = RequestSelection.find(params[:request_selection_id])
    
   
   @reward = Reward.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reward }
    end
  end

  # GET /rewards/new
  # GET /rewards/new.json
  def new

    @request_selection = RequestSelection.find(params[:request_selection_id])
   
    @current_date = DateTime.now
    @reward = @request_selection.build_reward
    @skills = Skill.all
    @developer_skills = DeveloperSkill.all
     1.times do
      evaluation = @reward.evaluations.build
     end
  

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reward }
    end
  end

  # GET /rewards/1/edit
  def edit
   
    @request_selection = RequestSelection.find(params[:request_selection_id])
    
    @reward = Reward.find(params[:id])
     @skills = Skill.all
      @current_date = DateTime.now
  end

  # POST /rewards
  # POST /rewards.json
  def create
   
   @request_selection = RequestSelection.find(params[:request_selection_id])
  
   @reward = @request_selection.create_reward(params[:reward])
   @developer_skills = DeveloperSkill.find_by_employee_id(:employee_id)
  
   @skills = Skill.all
   @current_date = DateTime.now
   

    respond_to do |format|
      if @reward.save
       
        format.html { redirect_to project_requests_path }
        format.json { render json: @reward, status: :created, location: @reward }
      else
        format.html { render action: "new" }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rewards/1
  # PUT /rewards/1.json
  def update
     
    @request_selection = RequestSelection.find(params[:request_selection_id])
     
    @reward = Reward.find(params[:id])
    @skills = Skill.all
    @current_date = DateTime.now

    respond_to do |format|
      if @reward.update_attributes(params[:reward])
       
        format.html { redirect_to @reward, notice: 'Reward was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards/1
  # DELETE /rewards/1.json
  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy

    respond_to do |format|
      format.html { redirect_to rewards_url }
      format.json { head :no_content }
    end
  end
end
