package com.internousdev.openconnect.schedule.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.schedule.dao.ScheduleMemoDAO;
import com.internousdev.openconnect.schedule.dto.ScheduleDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ScheduleMemoAction extends ActionSupport implements SessionAware{
	/**
	 *
	 * @author
	 */
	private static final long serialVersionUID = 1L;
	private String comment;
	private int id;
	private ArrayList<ScheduleDTO> memoList = new ArrayList<>();
	private Map<String, Object> session;
	@Override

	public String execute() throws SQLException{
		String result = ERROR;

		ScheduleMemoDAO dao = new ScheduleMemoDAO();
		if(!(comment == null || comment.length() == 0)){
			if(!dao.insert(comment)){
				return result;
			}
		}
		memoList = dao.select();
		System.out.println(memoList.size());
		if(memoList.isEmpty()){
			return result;
		}
		result = SUCCESS;
		return result;
	};

	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ArrayList<ScheduleDTO> getMemoList() {
		return memoList;
	}

	public void setMemoList(ArrayList<ScheduleDTO> memoList) {
		this.memoList = memoList;
	}

	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}
}


