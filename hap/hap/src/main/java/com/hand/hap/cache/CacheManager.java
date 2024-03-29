/*
 * #{copyright}#
 */

package com.hand.hap.cache;

/**
 * @author shengyang.zhou@hand-china.com
 */
public interface CacheManager {

    /**
     * 根据 name 获取 Cache.
     * 
     * @param name
     *            cache name
     * @param <T>
     *            cache 元素类型
     * @return Cache, may be null
     */
    <T> Cache<T> getCache(String name);

    /**
     * 注册 cache.
     * <p>
     * 根据 cache 的 name 注册.
     * 
     * @param cache
     *            cache
     */
    void addCache(Cache<?> cache);

}
