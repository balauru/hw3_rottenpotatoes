class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    url = request.referer ? Rails.application.routes.recognize_path(request.referer) : { :controller => "movies", :action => "some_action" }

    controller = url[:controller]
    action = url[:action]

    sort = params[:sort] || session[:sort]
    ordering = {}

    case sort
      when 'title'
        ordering, @title_header = {:order => :title}, 'hilite'
      when 'release_date'
        ordering, @date_header = {:order => :release_date}, 'hilite'
      else
        # type code here
    end

    @all_ratings = Movie.all_ratings
    # we only care for session when we come from somewhere else
    @selected_ratings = (controller == "movies" && action != "index") ? session[:ratings] || Hash[@all_ratings.map {|rating| [rating, rating]}] : params[:ratings] || {}

    if params[:sort] != session[:sort] or params[:ratings] != session[:ratings]
      session[:sort] = sort
      session[:ratings] = @selected_ratings
    end

    @movies = Movie.find_all_by_rating(@selected_ratings.keys, ordering)
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
