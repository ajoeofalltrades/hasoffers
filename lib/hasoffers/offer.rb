module HasOffers
  
  class Offer < Base

    Target = 'Offer'

    class << self

      def create(data, return_object = false)
        requires!(data, %w[name description advertiser_id offer_url preview_url protocol status expiration_date])
        params = build_data data, return_object
        post_request(Target, 'create', params)
      end

      def update(id, data, return_object = false)
        params = build_data data, return_object
        params['id'] = id
        post_request(Target, 'update', params)
      end

      def find_all(params = {})
        post_request(Target, 'findAll', params)
      end

      def find_all_by_ids(params = {})
        post_request(Target, 'findAllByIds', params)
      end

      def get_thumbnail(params = {})
        post_request(Target, 'getThumbnail', params)
      end

    end
    
  end
  
end