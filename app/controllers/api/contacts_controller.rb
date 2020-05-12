class Api::ContactsController < ApplicationController
  def show
    @contact = Contact.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def index
    # group = Group.find_by(name: params[:group_name])
    # @contacts = group.where(user_id: current_user.id)
    @contacts = Contact.all
    render 'index.json.jb'
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      bio: params[:bio],
      address: params[:address],
      # user_id: current_user.id
    )
    if @contact.save
      render 'show.json.jb'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.bio = params[:bio] || @contact.bio
    @contact.address = params[:address] || @contact.address

    if @contact.save
      render 'show.json.jb'
    else
      render json: {errors: @contact.errors.full_messages}
    end
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: {message: "Contact has been removed"}
  end
end
