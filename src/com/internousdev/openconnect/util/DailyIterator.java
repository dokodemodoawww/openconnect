
package com.internousdev.openconnect.util;

import java.util.Calendar;
import java.util.Date;

/** 毎日同じ時間の設定を維持するためのクラス
 * @author Teppei Matsumoto
 * @since  2017/06/27
 * @version 1.0
 */
public class DailyIterator implements ScheduleIterator {

    private final int hourOfDay, minute, second;

    private final Calendar calendar = Calendar.getInstance();

    public DailyIterator(int hourOfDay, int minute, int second) {

    	this(hourOfDay, minute, second, new Date());
    }

    public DailyIterator(int hourOfDay, int minute, int second, Date date) {

    	this.hourOfDay = hourOfDay;
        this.minute = minute;
        this.second = second;
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, hourOfDay);
        calendar.set(Calendar.MINUTE, minute);
        calendar.set(Calendar.SECOND, second);
        calendar.set(Calendar.MILLISECOND, 0);
        if (!calendar.getTime().before(date)) {
            calendar.add(Calendar.DATE, -1);
        }
    }
    public Date next() {
        calendar.add(Calendar.DATE, 1);
        return calendar.getTime();
    }

/* 以下いらないかも */
	/**
	* 取得メソッド を取得
	* @return hourOfDay
	*/
	public int getHourOfDay() {
		return hourOfDay;
	}

	/**
	* 取得メソッド を取得
	* @return minute
	*/
	public int getMinute() {
		return minute;
	}

	/**
	* 取得メソッド を取得
	* @return second
	*/
	public int getSecond() {
		return second;
	}
}
