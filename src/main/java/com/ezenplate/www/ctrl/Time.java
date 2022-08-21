package com.ezenplate.www.ctrl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;




public class Time {
	private static class TIME_MAXIMUM {
		public static final int SEC = 60;
		public static final int MIN = 60;
		public static final int HOUR = 24;
		public static final int DAY = 30;
		public static final int MONTH = 12;
	}
	
	public static String calculateTime(String regat) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			Date date = cal.getTime();
			String curTime = format.format(date);
			
			String msg = null;
			try {
				Date date2 = format.parse(regat);
				String regTime = format.format(date2);
				long difTime =(date.getTime()-date2.getTime())/1000;
			
				if (difTime < TIME_MAXIMUM.SEC) {
					// sec
					msg = difTime + "초 전";
				} else if ((difTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
					// min
					msg = difTime + "분 전";
				} else if ((difTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
					// hour
					msg = (difTime) + "시간 전";
				} else if ((difTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY) {
					// day
					msg = (difTime) + "일 전";
				} else if ((difTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH) {
					// day
					msg = (difTime) + "달 전";
				} else {
					msg = (difTime) + "년 전";
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return msg;
}
}
