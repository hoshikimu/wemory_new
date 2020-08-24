class ContactsController < ApplicationController
  def contact
    @contact = Contact.new
  end

  def contact_create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:success] = 'お問い合わせを受け付けました！'
      redirect_to root_path
    else
      render :contact
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :message)
  end
end
