/*
 * #{copyright}#
 */

package com.hand.hap.core;

/**
 * 一般用于 DTO获取 IRequest.
 * <p>
 *
 * @author shengyang.zhou@hand-china.com
 */
public interface IRequestAware {
    /**
     * 设置上下文.
     * 
     * @param request
     *            请求上下文
     */
    void setRequest(IRequest request);
}
