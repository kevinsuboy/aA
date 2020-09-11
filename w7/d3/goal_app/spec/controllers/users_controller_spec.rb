require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    # Test whatever routes we implement
    # #index
    # #new
    describe "GET #new" do
        it "renders the new users template" do
            get :new
            expect(response).to render_template(:new)
        end
    end
    # user = User.create(user_params)
    # if user.save
    # else
    # end
    describe "POST #create" do
        context "with invalid params" do
            # it "validates the presence of password and renders the new template with errors" do
            it "validates the presence of the user's email and password" do
                # Execute RESTful route with param
                post :create, params: { user: { email: "jack_bruce@place.com", password: "" } }
                # assertions (something that needs to happen)
                expect(response).to render_template("new")
                expect(flash[:errors]).to be_present
            end
            it "validates that the password is at least 6 characters long" do
                post :create, params: { user: { email: "jack_bruce@place.com", password: "short" } }
                expect(response).to render_template("new")
                expect(flash[:errors]).to be_present
            end
        end
        context "with valid params" do
            it "redirects user to user's page on success" do
                post :create, params: { user: { email: "jack_bruce@place.com", password: "password" } }
                user = User.find_by(email: "jack_bruce@place.com")
                expect(response).to redirect_to(user_url(user))
            end
        end
    end

end

