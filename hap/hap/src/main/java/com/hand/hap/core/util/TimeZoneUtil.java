/*
 * #{copyright}#
 */
package com.hand.hap.core.util;

import java.util.TimeZone;

/**
 * 时区工具类.
 * 
 * @author njq.niu@hand-china.com
 *
 *         2016年3月16日
 */
public final class TimeZoneUtil {

    private static ThreadLocal<TimeZone> local = new ThreadLocal<>();

    private TimeZoneUtil() {

    }

    /**
     * 返回当前时区.
     * <p>
     * 如果当前线程中没有时区对象，取系统默认时区.
     * 
     * @return 当前时区
     */
    public static TimeZone getTimeZone() {
        TimeZone timeZone = local.get();
        return timeZone != null ? timeZone : TimeZone.getDefault();
    }

    /**
     * 设置时区.
     * 
     * @param timeZone
     *            时区对象
     */
    public static void setTimeZone(TimeZone timeZone) {
        local.set(timeZone);
    }

    /**
     * convert timezone id to GMT format .
     * <p>
     * Asia/Shanghai -- GMT+0800<br>
     * Europe/Guernsey -- GMT<br>
     * America/New_York -- GMT-0500
     * 
     * @param timeZone
     *            TimeZone
     * @return GMT+0800
     */
    public static String toGMTFormat(TimeZone timeZone) {
        long of = timeZone.getRawOffset();
        if (of == 0) {
            return "GMT";
        }
        if (of > 0) {
            return String.format("GMT+%02d%02d", of / 3600000, (of / 60000) % 60);
        }
        return String.format("GMT-%02d%02d", of / 3600000, (of / 60000) % 60);
    }
}
