class AttachmentsController < ApplicationController
  def index
    @attachments = Attachment.all
  end

  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new

    @attachment.name = params[:name]
    @attachment.claim_id = params[:claim_id]

    save_status = @attachment.save

    if save_status == true
      redirect_to("/attachment/#{@attachment.claim_id}", notice: "El archivo #{@attachment.name} se ha agregado exitosamente.")
    else
      render "new"
    end

  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    redirect_to attachments_path, notice:  "El archivo #{@attachment.name} se ha eliminado."
  end

  private
  def attachment_params
    params.require(:attachment).permit(:claim_id, :attachment)
    params.require(:attachment).permit(:name, :attachment)
  end

  def show

    @attachments = Attachment.all

    render("attachments/show.html.erb")

  end

end
