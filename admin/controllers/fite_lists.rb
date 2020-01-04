FiteApp::Admin.controllers :fite_lists do
  get :index do
    @title = "Fite_lists"
    @fite_lists = FiteList.all
    render 'fite_lists/index'
  end

  get :show do
    @list = FiteList.includes(:fites).find(params["id"])
    render 'fite_lists/show'
  end


  get :new do
    @title = pat(:new_title, :model => 'fite_list')
    @fite_list = FiteList.new
    render 'fite_lists/new'
  end

  post :create do
    @fite_list = FiteList.new(params[:fite_list])
    if @fite_list.save
      @title = pat(:create_title, :model => "fite_list #{@fite_list.id}")
      flash[:success] = pat(:create_success, :model => 'FiteList')
      params[:save_and_continue] ? redirect(url(:fite_lists, :index)) : redirect(url(:fite_lists, :edit, :id => @fite_list.id))
    else
      @title = pat(:create_title, :model => 'fite_list')
      flash.now[:error] = pat(:create_error, :model => 'fite_list')
      render 'fite_lists/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "fite_list #{params[:id]}")
    @fite_list = FiteList.find(params[:id])
    if @fite_list
      render 'fite_lists/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'fite_list', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "fite_list #{params[:id]}")
    @fite_list = FiteList.find(params[:id])
    if @fite_list
      if @fite_list.update_attributes(params[:fite_list])
        flash[:success] = pat(:update_success, :model => 'Fite_list', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:fite_lists, :index)) :
          redirect(url(:fite_lists, :edit, :id => @fite_list.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'fite_list')
        render 'fite_lists/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'fite_list', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Fite_lists"
    fite_list = FiteList.find(params[:id])
    if fite_list
      if fite_list.destroy
        flash[:success] = pat(:delete_success, :model => 'Fite_list', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'fite_list')
      end
      redirect url(:fite_lists, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'fite_list', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Fite_lists"
    unless params[:fite_list_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'fite_list')
      redirect(url(:fite_lists, :index))
    end
    ids = params[:fite_list_ids].split(',').map(&:strip)
    fite_lists = FiteList.find(ids)
    
    if FiteList.destroy fite_lists
    
      flash[:success] = pat(:destroy_many_success, :model => 'Fite_lists', :ids => "#{ids.join(', ')}")
    end
    redirect url(:fite_lists, :index)
  end
end
