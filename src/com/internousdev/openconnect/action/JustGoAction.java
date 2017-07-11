package com.internousdev.openconnect.action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * ユーザー情報を削除するためのクラス
 *
 * @author KOCHO SANSHIRO
 * @since 2016/08/11
 */
public class JustGoAction extends ActionSupport {
	/**
	 * シリアルバージョンIDの生成
	 */
	private static final long serialVersionUID = 61119234L;

	/**
	 * 呼ばれるとSUCCESSを返すメソッド
	 *
	 * @author KOCHO SANSHIRO
	 * @return SUCCESS
	 */
	public String execute() throws Exception {
		return SUCCESS;
	}
}
