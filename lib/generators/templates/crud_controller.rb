class <%=controller_class_name%>Controller < ApplicationController
  
  before_filter :build_<%=model%>,  :only => [:new, :create]
  before_filter :load_<%=model%>,   :only => [:show, :edit, :update, :destroy]
  
  def index
    @<%=models%> = <%=model_class_name%>
  end
  
  def show
    render
  end
  
  def new
    render
  end
  
  def edit
    render
  end
  
  def create
    @<%=model%>.save!
    flash[:notice] = '<%=model_class_name%> created'
    redirect_to :action => :show, :id => @<%=model%>
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to create <%=model_class_name%>'
    render :action => :new
  end
  
  def update
    @<%=model%>.update_attributes!(params[:<%=model%>])
    flash[:notice] = '<%=model_class_name%> updated'
    redirect_to :action => :show, :id => @<%=model%>
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to update <%=model_class_name%>'
    render :action => :edit
  end
  
  def destroy
    @<%=model%>.destroy
    flash[:notice] = '<%=model_class_name%> deleted'
    redirect_to :action => :index
  end
  
protected
  
  def build_<%=model%>
    @<%=model%> = <%=model_class_name%>.new(params[:<%=model%>])
  end
  
  def load_<%=model%>
    @<%=model%> = <%=model_class_name%>.find(params[:<%=model%>])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = '<%=model_class_name%> not found'
    redirect_to :action => :index
  end
  
end