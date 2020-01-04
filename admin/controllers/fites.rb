FiteApp::Admin.controllers :fites do
  get :index do
    @title = "Fites"
    @fites = Fite.all
    render 'fites/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'fite')
    @fite = Fite.new
    render 'fites/new'
  end

  post :create do
    @fite = Fite.new(params[:fite])
    if @fite.save
      @title = pat(:create_title, :model => "fite #{@fite.id}")
      flash[:success] = pat(:create_success, :model => 'Fite')
      params[:save_and_continue] ? redirect(url(:fites, :index)) : redirect(url(:fites, :edit, :id => @fite.id))
    else
      @title = pat(:create_title, :model => 'fite')
      flash.now[:error] = pat(:create_error, :model => 'fite')
      render 'fites/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "fite #{params[:id]}")
    @fite = Fite.find(params[:id])
    if @fite
      render 'fites/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'fite', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "fite #{params[:id]}")
    @fite = Fite.find(params[:id])
    if @fite
      if @fite.update_attributes(params[:fite])
        flash[:success] = pat(:update_success, :model => 'Fite', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:fites, :index)) :
          redirect(url(:fites, :edit, :id => @fite.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'fite')
        render 'fites/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'fite', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Fites"
    fite = Fite.find(params[:id])
    if fite
      if fite.destroy
        flash[:success] = pat(:delete_success, :model => 'Fite', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'fite')
      end
      redirect url(:fites, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'fite', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Fites"
    unless params[:fite_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'fite')
      redirect(url(:fites, :index))
    end
    ids = params[:fite_ids].split(',').map(&:strip)
    fites = Fite.find(ids)
    
    if Fite.destroy fites
    
      flash[:success] = pat(:destroy_many_success, :model => 'Fites', :ids => "#{ids.join(', ')}")
    end
    redirect url(:fites, :index)
  end
end
