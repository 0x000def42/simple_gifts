module Private
  class GiftsController < PrivateController

    before_action :set_gift, only: [:show, :update, :edit, :destroy]

    def index
      @gifts = Gift.where(autor: current_user)
    end

    def new
      @gift = Gift.new
      @gift.recepient = User.new
    end

    def edit

    end

    def show

    end

    def create
      @gift = current_user.gifts_as_autor.build gift_params
      email = params[:gift][:recepient_attributes][:email]
      @gift.recepient = User.find_by(email: email) || User.get_new(email)
      @gift.set_access_hash!
      if @gift.valid? && @gift.save
        redirect_to gifts_path
      else
        render action: :new
      end
    end

    def update
      if @gift.update(gift_params)
        redirect_to gift_path(@gift)
      else
        render action: :edit
      end
    end

    def destroy
      @gift.delete
      redirect_to gifts_path
    end

    private

    def set_gift
      @gift = Gift.find(params[:id])
    end

    def gift_params
      params.require(:gift).permit(:name, :description, :content, :occurrence_at)
    end
  end
end