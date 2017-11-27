module Alchemy
  class Admin::EssenceMailupListsController < Alchemy::Admin::BaseController
    authorize_resource class: Alchemy::EssenceMailupList
    before_action :load_essence

    def update
      @essence.update(essence_audio_params)
    end

    private

    def load_essence
      @essence = EssenceMailupList.find(params[:id])
    end

    def essence_audio_params
      params.require(:essence_mailup_list).permit(
        :list_id
      )
    end
  end
end
