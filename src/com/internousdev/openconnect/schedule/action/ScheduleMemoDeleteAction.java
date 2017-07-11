package com.internousdev.openconnect.schedule.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.openconnect.schedule.dao.ScheduleMemoDeleteDAO;
import com.opensymphony.xwork2.ActionSupport;

public class ScheduleMemoDeleteAction extends ActionSupport implements SessionAware{
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private int id = -1;
	private String errorMsg = "";
	private Map<String, Object> session;

	@Override
	public String execute() throws SQLException{
		String result = ERROR;

		System.out.println("id" + id);
		if(id < 0){
			errorMsg ="error";
			System.out.println(result);
			return result;
		}
		ScheduleMemoDeleteDAO dao = new ScheduleMemoDeleteDAO();
		if(dao.delete(id)){
			result = SUCCESS;
			System.out.println(result);
			return result;
		}
		errorMsg ="error";
		System.out.println(result);
		return result;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	};


}
