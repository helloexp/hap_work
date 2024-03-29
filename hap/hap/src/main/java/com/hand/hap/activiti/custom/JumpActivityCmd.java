package com.hand.hap.activiti.custom;

import java.io.Serializable;
import java.util.List;

import org.activiti.bpmn.model.FlowElement;
import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.impl.interceptor.CommandContext;
import org.activiti.engine.impl.persistence.entity.ExecutionEntity;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.impl.persistence.entity.TaskEntityManager;
import org.activiti.engine.impl.util.ProcessDefinitionUtil;
import org.slf4j.Logger;

/**
 * jump to specified activiti node (typically a usertask node)
 * 
 * @author shengyang.zhou@hand-china.com
 */
public class JumpActivityCmd implements Command, Serializable {
    Logger logger = org.slf4j.LoggerFactory.getLogger(JumpActivityCmd.class);

    private String activityId;
    private String taskId;
    private String jumpOrigin;

    // task assignees,if the target activity is multi-instance
    private List<String> taskUsers;

    // task assignee, if not multi-instance
    private String taskUser;

    public JumpActivityCmd(String taskId, String activityId, String jumpOrigin, List<String> taskUsers,
            String taskUser) {
        this(taskId, activityId, jumpOrigin);
        this.taskUsers = taskUsers;
        this.taskUser = taskUser;
    }

    public JumpActivityCmd(String taskId, String activityId) {
        this(taskId, activityId, "jump");
    }

    public JumpActivityCmd(String taskId, String activityId, String jumpOrigin) {
        this.activityId = activityId;
        this.taskId = taskId;
        this.jumpOrigin = jumpOrigin;
    }

    public Object execute(CommandContext commandContext) {
        TaskEntityManager taskEntityManager = commandContext.getTaskEntityManager();
        TaskEntity task = taskEntityManager.findById(taskId);

        ExecutionEntity execution = commandContext.getExecutionEntityManager().findById(task.getExecutionId());
        execution.getCurrentFlowElement();

        // executionEntity.destroyScope(jumpOrigin);

        String processDefinitionId = execution.getProcessDefinitionId();
        org.activiti.bpmn.model.Process process = ProcessDefinitionUtil.getProcess(processDefinitionId);
        FlowElement targetFlowElement = process.getFlowElement(activityId, true);

        execution.setDeleted(true);
        execution.setDeleteReason(jumpOrigin);
        List<TaskEntity> taskOnCurrentExecution = taskEntityManager.findTasksByExecutionId(execution.getId());
        if (taskOnCurrentExecution != null) {
            for (TaskEntity taskEntity : taskOnCurrentExecution) {

            }
        }

        taskEntityManager.deleteTask(task, jumpOrigin, false, true);

        ExecutionEntity nextExecution = commandContext.getExecutionEntityManager().create();
        nextExecution.setProcessDefinitionId(execution.getProcessDefinitionId());
        nextExecution.setProcessInstanceId(execution.getProcessInstanceId());
        nextExecution.setRootProcessInstanceId(execution.getRootProcessInstanceId());
        nextExecution.setTenantId(execution.getTenantId());

        nextExecution.setScope(false);
        nextExecution.setActive(true);

        nextExecution.setParentId(execution.getParentId() != null ? execution.getParentId() : execution.getId());

        nextExecution.setCurrentFlowElement(targetFlowElement);

        commandContext.getExecutionEntityManager().insert(nextExecution);

        commandContext.getAgenda().planContinueProcessInCompensation(nextExecution);
        return nextExecution;

    }

}