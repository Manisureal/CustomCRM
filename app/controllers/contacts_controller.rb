class ContactsController < ApplicationController

  def index
    @contacts = Contact.page(params[:page]).per(9)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @new_contact = Contact.new
  end

  def create
    @new_contact = Contact.new(contact_params)
    if @new_contact.save
      redirect_to contacts_path
      flash[:notice] = "Contact successfully created"
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to request.referrer
      flash[:notice] = "Contact##{@contact.id} was successfully updated!"
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      redirect_to contacts_path
      flash[:notice] = "Contact##{@contact.id} was successfully deleted!"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :company, :email, :phone, :address, :city, :postcode, product: [])
  end

end
