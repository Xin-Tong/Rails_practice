class MoviesController < ApplicationController

  # GET /movies
  def index
    @movies = Movie.released
  end

  # GET /movies/:id
  def show
    @movie = Movie.find(params[:id])
  end

  # GET /movies/:id/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies/:id
  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie successfully updated!"
    else
      render :edit
    end
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie successfully created!"
    else
      render :new
    end
  end

  # DELETE /movies/:id
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url, alert: "Movie successfully deleted!"
  end

private

  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name)
  end
end

