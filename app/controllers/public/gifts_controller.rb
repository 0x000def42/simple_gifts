module Public
  class GiftsController < PublicController
    def index
      if params[:access_hash] == 'test'
        @gifts = [Gift.new(
          name: 'Тестовый подарочек',
          description: 'Описание тестового подарочка',
          content: 'Контент тестового подарочка',
          occurrence_at: 1.hours.ago,
          access_hash: 'test',
          id: 0
        )]
      else
        @gifts = Gift.where(access_hash: params[:access_hash])
      end
    end
  
    def show
      if params[:access_hash] == 'test'
        @gift = Gift.new(
          name: 'Тестовый подарочек',
          description: 'Описание тестового подарочка',
          content: 'Контент тестового подарочка',
          occurrence_at: 1.hours.ago,
          access_hash: 'test',
          id: 0
        )
      else
        @gift = Gift.find_by(id: params[:id], access_hash: params[:access_hash])
      end
    end
  end
end