
package com.internousdev.openconnect.attendance.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.internousdev.openconnect.attendance.dao.AddAttendanceDAO;
import com.internousdev.openconnect.util.DailyIterator;
import com.internousdev.openconnect.util.Scheduler;
import com.internousdev.openconnect.util.SchedulerTask;

/** 毎日0時に全Userの勤怠を『連絡なし』で送るためのメソッド
 * @author Teppei Matsumoto
 * @since  2017/06/27
 * @version 1.0
 */

/* 「javaを実行」では起動するが、コマンドプロンプトではメインメソッドが発見されないエラーあり
 * コマンドプロンプトでも動くようにする
 * 場合によっては、時間のところを外しインサートの部分とLinuxのクーロンの時間指定で行う
 * 余裕があれば引き継ぎお願いします。
 */

public class AddAttendanceAction{
	private final Scheduler scheduler = new Scheduler();

	private final int hourOfDay, minute, second;

	/**
	 * ユーザーID
	 * joinでuser_nameを引っ張って来たい
	 */
	private int userId;

	/**
	 * 出欠状況
	 */
	private String attendance="連絡なし";

	Calendar cal = Calendar.getInstance();


	/**
	 * 報告年
	 */
	private int atYear=cal.get(Calendar.YEAR);

	/**
	 * 報告月
	 */
	private int atMonth= cal.get(Calendar.MONTH)+1;

	/**
	 * 報告日
	 */
	private int atDay= cal.get(Calendar.DAY_OF_MONTH);

	Calendar cal2 = Calendar.getInstance();

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");



	/** 指定した時間に値をインサートするメソッド
	 *
	 * @param hourOfDay
	 * @param minute
	 * @param second
	 */
	public AddAttendanceAction(int hourOfDay, int minute, int second) {
		this.hourOfDay = hourOfDay;
		this.minute = minute;
		this.second = second;
	}


	public void start() {

		scheduler.schedule(new SchedulerTask() {
			public void run() {
				atendanceadd();
			}

			public void atendanceadd(){

				cal.setLenient(true);
				cal2.setLenient(true);
				cal2.add(Calendar.DAY_OF_MONTH,1);

				String atDate =sdf.format(cal.getTime());
				String atDate2 =sdf.format(cal2.getTime());


				AddAttendanceDAO dao=new AddAttendanceDAO();


				if(dao.insert(userId)>0){
					int count = dao.update(atYear,atMonth,atDay,attendance,atDate,atDate2);
					if(count > 0){

				}}

			}
		}, new DailyIterator(hourOfDay, minute, second));
		}

	public static void main(String[] args) {
		AddAttendanceAction addattendanceaction = new AddAttendanceAction(17, 05, 0);
		addattendanceaction.start();
		}

}

