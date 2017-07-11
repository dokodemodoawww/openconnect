package com.internousdev.bulletinboard.util;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

final public class SafeDateFormat {
	private static final ThreadLocal<SimpleDateFormat> formatter = new ThreadLocal<SimpleDateFormat>() {
		@Override
		protected SimpleDateFormat initialValue() {
			return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		}
	};

	private SafeDateFormat() {}

	public static final Calendar getCalendar() {
		return formatter.get().getCalendar();
	}

	public static final void applyPattern(String pattern) {
		formatter.get().applyPattern(pattern);
	}

	public static final String format(Date date) {
		return formatter.get().format(date);
	}

	public static final Date parse(final String source, final ParsePosition pos) {
		return formatter.get().parse(source, pos);
	}

	public static final Date parse(String source) throws ParseException {
		return formatter.get().parse(source);
	}
}