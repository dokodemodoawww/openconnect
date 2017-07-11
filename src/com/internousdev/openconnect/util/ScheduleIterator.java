/**
 *
 */
package com.internousdev.openconnect.util;

import java.util.Date;

/** SchedulerTaskが、スケジュールに従って実行する時間を規定するインターフェース
 * @author internousdev
 *
 */
public interface ScheduleIterator {
    public Date next();
}
