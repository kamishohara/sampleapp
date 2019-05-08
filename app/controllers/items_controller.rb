class ItemsController < ApplicationController
  protect_from_forgery except: :save
 # before_action :authenticate_user!
  def search
    if params[:keyword]
    @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword],hits: 10)
  end
 end

  def kawase
  client = HTTPClient.new
  response = client.get_content("http://www.gaitameonline.com/rateaj/getrate")
  body = JSON.parse(response)
  @AUD = body["quotes"][3]["currencyPairCode"]
  @AUDopen = body["quotes"][3]["open"]

  @NZD = body["quotes"][7]["currencyPairCode"]
  @NZDopen = body["quotes"][7]["open"]

  @ZAR = body["quotes"][11]["currencyPairCode"]
  @ZARopen = body["quotes"][11]["open"]

  @CHF = body["quotes"][13]["currencyPairCode"]
  @CHFopen = body["quotes"][13]["open"]

  @EUR = body["quotes"][16]["currencyPairCode"]
  @EURopen = body["quotes"][16]["open"]

  @USD = body["quotes"][20]["currencyPairCode"]
  @USDopen = body["quotes"][20]["open"]

  @GBP = body["quotes"][23]["currencyPairCode"]
  @GBPopen = body["quotes"][23]["open"]
  end


  def create
    @sample = params[:sample]
    @count = params[:count]
  end
  def toppage


  end

  def save
    @hairetu = []
    params[:price].each do |price|
    @hairetu << params[:price]
    binding.pry
    end
  end



  def index
    @items= Item.all

  end
end
