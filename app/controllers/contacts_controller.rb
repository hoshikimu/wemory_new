class ContactsController < ApplicationController
  def contact
    @contact = Contact.new
  end

  def contact_create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:success] = 'お問い合わせを受け付けました！'
      if user_signed_in?
        redirect_to top_path
      else
        redirect_to root_path
      end
    else
      render :contact
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :message)
  end
end
