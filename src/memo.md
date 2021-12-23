menuお気に入り登録機能を実装する手順を考える


rails g model Favorite user_id:integer menu_id:integer
↓
routesを通す

resources :menus do
  resources :favorites, only:[:create, :destroy]
end

↓
user.rb(model)とmenu.rb(model)にアソシエーション。dependent: :destroyはどちらとも
↓
favorite_controllerのcreateとdestroyを書く

def create
  @menu = Menu.find(params[:id])
  @favorite = Favorite.new(user_id: current_user.id, menu_id: @menu.id)
  @favorite.save
  redirect_to menu_url(@menu), success: "「#{@menu.name}」をお気に入り登録しました。"
end

def destroy
end