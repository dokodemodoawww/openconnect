package com.internousdev.bulletinboard.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.bulletinboard.dao.AddImageDAO;
import com.internousdev.bulletinboard.dao.Base64DAO;
import com.opensymphony.xwork2.ActionSupport;

public class AddImageAction extends ActionSupport implements SessionAware{

		/** シリアスコード */
		private static final long serialVersionUID = 1L;

		/** ユーザーID */
		private int userId;

		/** セッション情報 */
		private Map<String,Object> session;

		/** イメージパス */
		private String userImg;



		/**
		 * 画像情報を追加する
		 * @author Jun Kikuchi
		 * @since 2017/06/08
		 * @version 1.0
		 */
		public String execute()throws Exception{
			String result = ERROR;

			int inserted=0;
			Base64DAO dao= new Base64DAO();
			String Users  = dao.loadBinaryImage(userImg);
			AddImageDAO dao2 = new AddImageDAO();

			inserted=dao2.insert(userId,userImg);

			if(inserted>0){
				result = SUCCESS;
			}
			return result;
		}


		public int getUserId() {
			return userId;
		}

		public void setUserId(int userId) {
			this.userId = userId;
		}

		public Map<String, Object> getSession() {
			return session;
		}

		public void setSession(Map<String, Object> session) {
			this.session = session;
		}

		public String getUserImg() {
			return userImg;
		}

		public void setUserImg(String userImg) {
			this.userImg = userImg;
		}
}
