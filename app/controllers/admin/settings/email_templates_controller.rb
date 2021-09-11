module Admin
  module Settings
    class EmailTemplatesController < BaseController
      def index
        @email_templates = Email::Template.all
      end

      def edit
        @email_template = Email::Template.find(params[:id])
      end

      def show
        @global_template = Email::GlobalSettings.first
        @email_template = Email::Template.find(params[:id])
        render layout: false
      end

      def update
        @email_template = Email::Template.find(params[:id])
        @email_template.update!(email_template_params)
        redirect_to edit_admin_settings_email_template_path(@email_template)
      end

      private

      def email_template_params
        params.require(:email_template).permit(:title, :subject, :prebody, :body, :postbody, :banner1, :banner2, :closing, :footer)
      end
    end
  end
end
