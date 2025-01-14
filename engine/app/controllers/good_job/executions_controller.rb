# frozen_string_literal: true
module GoodJob
  class ExecutionsController < GoodJob::ApplicationController
    def destroy
      deleted_count = GoodJob::Execution.where(id: params[:id]).delete_all
      message = deleted_count.positive? ? { notice: "Job execution deleted" } : { alert: "Job execution not deleted" }
      redirect_back fallback_location: jobs_path, **message
    end
  end
end
