class ListInclusionsController < ApplicationController
  before_action :set_list, only: [:update]

  def update
    respond_to do |format|
      if @list_inclusion.update(list_inclusion_params)
        format.html { redirect_to @list_inclusion.list, notice: 'List inclusion was successfully updated.' }
        format.json { render :show, status: :ok, location: @list_inclusion }
      else
        format.html { render :edit }
        format.json { render json: @list_inclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def list_inclusion_params
    params.require(:list_inclusion).permit(:name, :flagged_invalid_at)
  end

  def set_list
    @list_inclusion = ListInclusion.find(params[:id])
  end
end
