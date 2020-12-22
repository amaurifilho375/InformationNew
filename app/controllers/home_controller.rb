class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit ]
  before_action :set_user2, only: [:show_update, :show_destroy]


def index
  @users = User.all
 # @reports = Report.all
  @tags = Tag.all 
  @videos = Video.all
  #authorize @users
 #puts "user_signed_in.user #{user_signed_in.email}"
 #puts "user_signed_in#{user_signed_in}"
  
 if params[:search]
  #@report = Report.where("titulo like '%#{params[:search]}%'") 
      
        #ou assim que eh mais indicado pela comunidade:
     @report = Report.where("titulo like ?", "%#{params[:search][:titulo]}%")          

  else
    @report = Report.all 
  end



 # @user = User.new
 # authorize @user
end

def friends
   @friends = User.where(role: 1)
end

def manipulationusers
     
   @users = User.all
  
end 


def new
    # @user = User.new
    # authorize @user
end

def show
end

def show_create
  
   if User.find_by(email: params[:@user][:email].strip).nil?
        @iqual = 1
       
      @iqual=0
      @user = User.new(user_params)
      @role = params[:@user][:role]
      #id.to_i
      @role = @role.to_i
      #respond_to do |format|
        if @user.save(validate: false)
          @user.role =@role
          @user.save(validate: false)
          flash[:error] = ""
          flash[:notice] = "Usuario criado com sucessoo!"
          
          # format.html { redirect_to @user, notice: 'Report was successfully created.' }
        # format.json { render :show, status: :created, location: @user }
        else
          #format.html { render :new }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
            render :new
        end
      #end
    else
      flash[:error] = "Erro! Conta ja existe!"
      #render :new 
       redirect_to home_new_path
    end  

end

def edit

end


def show_update
  @quarda = user_params
  puts "valor do user_params #{@quarda}"
  #puts "params titulo = #{params[:user][:email]}"  
  
  #@user.email = params[:user][:email]
  #@user.password = params[:user][:password]
  #@user.password_confirmation = params[:user][:password_confirmation]
  @user.role = params[:@user][:role].to_i
  @user.name = params[:@user][:name]
  
  #respond_to do |format|
    if @user.save(validate: false)
      #format.html { redirect_to @user, notice: 'Report was successfully updated.' }
      flash[:notice] = "Credenciais do usuario 
          {#{@user.name}} atualizada com sucesso!"
          
      # format.json { render :show, status: :ok, location: @user }
    else
       render :edit
     # format.html { render :edit }
     # format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  
end


def show_destroy
  @userbanido = @user
  @user.destroy
  flash[:notice] = "O usuario 
    {#{@userbanido.name}} foi excluido com sucesso!"

  
end



private

  def set_user
     puts "valor da params #{params} e #{params[:id]}"
     puts "valor params format #{params[:format]}"
     #cont = params[format].to.i
     @user = User.find(params[:format])
  end

  def set_user2
    puts "valor da params #{params} e #{params[:id]}"
    puts "valor params format #{params[:format]}"
    #cont = params[format].to.i
    @user = User.find(params[:id])
 end


  def user_params
     params.require(:@user).permit(:email, :password, :password_confirmation, :name)
  end



end
