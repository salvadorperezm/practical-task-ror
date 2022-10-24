class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show update destroy ]

  def index
    @players = Player.all

    render json: @players
  end

  def new
    render json: params_required
  end

  def show
    render json: @player
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      render json: @player, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def edit
    render json: params_required
  end

  def destroy
    @player.destroy
  end

  def players_by_nationality
    @players = Player.where(nationality: params[:nationality])

    render json: @players
  end

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.permit(:first_name, :last_name, :nationality, :age, :shirt_number, :position, :weight, :height)
  end

  def params_required
    {
      first_name: 'Your player\'s first name',
      last_name: 'Your player\'s last name',
      nationality: 'Your player\'s nationality',
      age: 'Your player\'s age without the single quotes',
      shirt_number: 'Your player\'s shirt number without the single quotes',
      position: 'Positions available: GK || DF || MF || FW',
      weight: 'Your player\'s weight in the format: \'34.5kg\'',
      height: 'Your player\'s height in the format: \'176cm\''
    }
  end  
end
