class FilmsController < ApplicationController
  before_filter :check_admin_user, :except=>['index', 'show','rentals']

  def index
    @films = Film.page(params[:page])
  end

  def show
    @film = Film.full_load.find(params[:id])
    
    @rental = Rental.includes("film").where(:film_id => params[:id])
    box_offices = BoxOffice.where(:rental_id => @rental)
    @sum_rental=0
    box_offices.each do |box|
    @sum_rental += box.sum_all 
    end
    
    sum = BoxOffice.where(:rental_id => Rental.where(:film_id => params[:id], :country_id => (Country.where(:name => "Россия")[0]).id))
    @sum_coun = 0
    sum.each do |s|
    @sum_coun += s.sum_all
    end

    summa = BoxOffice.where(:rental_id => Rental.where(:film_id => params[:id], :country_id => (Country.where(:name => "Соединенные Штаты")[0]).id))
    @sum_co = 0
    summa.each do |i|
    @sum_co += i.sum_all
    end    
    
    @current_genre=@film.genre #for layout
  end

  def new
    @film = Film.new
  end

  def edit
    @film = Film.full_load.find(params[:id])
  end

  def create
    @film = Film.new(params[:film])
    if @film.save
      redirect_to @film, :notice => 'Фильм добавлен.'
    else
      render :action => "new"
    end
  end

  def update
    @film = Film.full_load.find(params[:id])
    if @film.update_attributes(params[:film])
      redirect_to @film, :notice => 'Фильм сохранен.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @film = Film.find(params[:id])
    @film.destroy
    redirect_to films_url, :notice=>"Фильм удален"
  end

  def rentals
    #raise params.inspect
    @rentals = Rental.where(:film_id => params[:id]).page(params[:page])
  end

  def new_rental
    @film = Film.find(params[:id])
    @rental = @film.rentals.build
  end

end
