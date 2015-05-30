def search
  if params[:q].nil?
    @articles = []
  else
    @articles = Dish.search params[:q]
  end
end