module WorkflowunderwaysHelper
  def current_step(workflowunderway)
    workflow = Workflow.find(workflowunderway.workflow_id).code
    step = workflowunderway.step
    case workflow
    when "1001"
      case step
      when 1
        'custserv_exe'
      end
    end
  end
end
