module Mutations
  class AddUser < BaseMutation
    # This is the correct definition for the input argument
    argument :input, Types::CreateUserInputType, required: true

    field :user, Types::UserType, null: true
    field :errors, [ String ], null: false

    def resolve(input:)
      name = input[:name]
      companyId = input[:companyId]

      response = HTTP.post("http://localhost:4000/users", json: {
        name: name,
        companyId: companyId
      })

      if response.status.success?
        user_data = JSON.parse(response.body.to_s)
        {
          user: user_data,
          errors: []
        }
      else
        {
          user: nil,
          errors: [ response.body.to_s ]
        }
      end
    end
  end
end
