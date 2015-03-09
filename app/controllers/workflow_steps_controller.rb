# encoding: utf-8
class WorkflowStepsController < ApplicationController
  include Wicked::Wizard
  # load_and_authorize_resource
  before_filter :authenticate
  # prepend_before_filter :set_steps
  steps :custserv_exe
  
  def show
    @title = "营销工作任务"
    @workflowunderway = Workflowunderway.find(params[:workflowunderway_id])
    @workflow = @workflowunderway.workflow
    
    render_wizard
  end
end
