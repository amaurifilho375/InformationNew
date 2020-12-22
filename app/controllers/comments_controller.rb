class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update]
  before_action :set_comment_personification, only: [:edit_personification]
  before_action :set_destroy, only: [:destroy]
  # GET /comments
  # GET /comments.json
  def index
    
    @report = Report.find(params[:report_id])
    @comments = @report.comments
    @user_current = current_user.id
    @users = User.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
   
    puts "VALOR DO PARAMS NA VIEW #{params[:report_id]}"
    @report = Report.find(params[:report_id])
    @comment = @report.comments.new
    #@comment = Comment.new
    
     puts "VALOR DO PARAMS NA VIEW #{params[:report_id]}"
     puts "valor de new do comentario : #{@comment.report_id}"
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    puts "VALOR DO PARAMS no METODO CREATEEE #{params[:report_id]}"

     @report = Report.find(params[:report_id])
     @comment = @report.comments.new(comment_params)
     @comment.status = 1
     @comment.user_id = current_user.id
    

    respond_to do |format|
      if @comment.save(validate: false)
        format.html { redirect_to report_comments_path(@report), notice: 'Comment was successfully created.' }
       # format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

def update_personification
     @comment = Comment.find(params[:@comment][:id])
     @comment.comment = params[:@comment][:comment]
     @comment.rating = params[:comment][:rating]
    
  if @comment.save(validate: false)
    flash[:notice] = "comentario atualizado com sucessoo!"
  end
end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
     
    @comment = @report2.comments.find(params[:id])
    puts "testando REPORTS2: #{@comment.comment}"

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to reports_path, notice: 'Comentario excluido com sucesso.' }
      format.json { head :no_content }
    end
  end

  #def comment_report
      
  #end

  def edit_personification
    puts " @comentario no metodod edit personalidade #{@comment.comment}"
    puts " @comentario  ID #{@comment.id}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      #@comment = Comment.find(params[:id])
      @report = Report.find(params[:id])
      @comments = @report.comments
        
    end

    def set_destroy
       @report2 =  Report.find(params[:report_id])
    end


   def set_comment_personification
      @comment = Comment.find(params[:id])  
   end


    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:comment, :rating)
    end
end
