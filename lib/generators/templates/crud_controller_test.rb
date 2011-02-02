require File.expand_path('../test_helper', File.dirname(__FILE__))

class <%=controller_class_name%>Test < ActionController::TestCase
  
  def test_get_index
    get :index
    assert assigns(:<%=models%>)
    assert_response :success
    assert_template :index
  end
  
  def test_get_show
    <%=model%> = <%=models%>(:default)
    get :show, :id => <%=model%>
    assert assigns(:<%model%>)
    assert_response :success
    assert_template :show
  end
  
  def test_get_show_failure
    get :show, :id => 'invalid'
    assert_reponse :redirect
    assert_redirected_to :action => :index
    assert_equal '<%=model_class_name%> not found', flash[:error]
  end
  
  def test_get_new
    get :new
    assert assigns(:<%=model%>)
    assert_response :success
    assert_template :new
    assert_select 'form[action=/<%=models%>]'
  end
  
  def test_get_edit
    <%=model%> = <%=models%>(:default)
    get :edit, :id => <%=model%>
    assert assigns(:<%=model%>)
    assert_response :success
    assert_template :edit
    assert_select "form[action=/<%=models%>/#{<%=model%>.id}]"
  end
  
  def test_creation
    assert_difference '<%=model_class_name%>.count' do
      post :create, :<%=model%> => {
        
      }
      <%=model%> = <%=model_class_name%>.last
      assert_response :redirect
      assert_redirected_to :action => :show, :id => <%=model%>
      assert_equal '<%=model_class_name%> created', flash[:notice]
    end
  end
  
  def test_creation_failure
    assert_no_difference '<%=model_class_name%>.count' do
      post :create, :<%=model%> => {
        :something => '???'
      }
      assert_response :success
      assert_template :new
      assert_equal 'Failed to create <%=model_class_name%>'
    end
  end
  
  def test_update
    <%=model%> = <%=models%>(:default)
    put :update, :id => <%=model%>, :<%=model%> => {
      :_attribute_ => '???'
    }
    assert_response :redirect
    assert_redirected_to :action => :show, :id => <%=model%>
    assert_equal '<%=model_class_name%> updated', flash[:notice]
    <%=model%>.reload
    assert_equal '???', <%=model%>._attribute_
  end
  
  def test_update_failure
    <%=model%> = <%=models%>(:default)
    put :update, :id => <%=model%>, :<%=model%> => {
      :_attribute_ => '???'
    }
    assert_response :success
    assert_template :edit
    assert_equal 'Failed to update <%=model_class_name%>', flash[:error]
    <%=model%>.reload
    assert_not_equal '???', <%=model%>._attribute_
  end
  
  def test_destroy
    <%=model%> = <%=models%>(:default)
    assert_difference '<%=model_class_name%>.count', -1 do
      delete :destroy, :id => <%=model%>
      assert_response :redirect
      assert_redirected_to :action => :index
      assert_equal '<%model_class_name%> deleted', :flash[:notice]
    end
  end
  
end