#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do
		session[:user_name] = params[:username]
		session[:phone] = params[:phone]
		session[:datetime] = params[:datetime]
		session[:barber] = params[:barber]
		session[:color] = params[:color]

		erb "<h1> Спасибо, вы записались!</h1>"
	end