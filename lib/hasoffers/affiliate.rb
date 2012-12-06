module HasOffers

  class Affiliate < Base

    Target = 'Affiliate'

    class << self

      def create(data, return_object = false)
        requires!(data, %w[company address1 city country zipcode phone])
        if data['country'] == 'US' or data['country'] == 'CA'
          requires!(data, 'region')
        end
        params = build_data(data, return_object)
        post_request(Target, 'create', params)
      end

      def update(id, data, return_object = false)
        params = build_data(data, return_object)
        params['id'] = id
        post_request(Target, 'update', params)
      end

      def find_all(params = {})
        post_request(Target, 'findAll', params)
      end

      def get_offer_payouts(params = {})
        post_request(Target, 'getOfferPayouts', params)
      end

      def get_approved_offer_ids(params = {})
        post_request(Target, 'getApprovedOfferIds', params)
      end

    end

  end

end