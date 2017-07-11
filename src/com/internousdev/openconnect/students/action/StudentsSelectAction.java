package com.internousdev.openconnect.students.action;

import java.util.ArrayList;
import java.util.List;

import com.internousdev.openconnect.students.dao.StudentsSelectDAO;
import com.internousdev.openconnect.students.dto.StudentsDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * DBから受講生一覧を取得し表示するクラス
 *
 * @author KOHEI NITABARU
 * @since 2016/09/07
 */
public class StudentsSelectAction extends ActionSupport {

    /**
     * シリアル番号
     */
    private static final long serialVersionUID = 214651219760554487L;

    /**
     * 検索文字
     */
    private int searchInt ;
    /**
     * 結果文字
     */
    private String resultSelect = "該当する情報はありません。";

    /**
	 * ユーザーID
	 */
	private int userId;

	/**
	 * ログインパスワード
	 */
	private String password;

	/**
	 * 姓（漢字）
	 */
	private String familyNameKanji;

	/**
	 * 名（漢字）
	 */
	private String givenNameKanji;

	/**
	 * 姓（ふりがな）
	 */
	private String familyNameKana;

	/**
	 * 名（ふりがな）
	 */
	private String givenNameKana;
	/**
	 * ユーザー名
	 */
	private String userName;



	/**
	 * メールアドレス
	 */
	private String email;

	/**
	 * チーム名
	 */
	private String teamName;

	/**
	 * 受講年
	 */
	private int year;

	/**
	 * 受講開始月
	 */
	private String month;


	/**
     * 生徒リスト
     */
    private ArrayList<StudentsDTO> studentsList = new ArrayList<StudentsDTO>();

    /**
     * 実行メソッド 受講生一覧を表示
     *
     * @author KOHEI NITABARU
     * @return result
     */
    public String execute() {

        String result = ERROR;
        StudentsSelectDAO dao = new StudentsSelectDAO();
        studentsList = dao.select(userId);

        if (studentsList.size() != 0) {
            result = SUCCESS;
            resultSelect = "検索結果を表示しました。(赤：管理者、黄：リーダー、緑：メンバー）";
            sort();
        }

        return result;
    }

    /**
     * 実行メソッド ソート
     *
     * @author MINORI SUNAGAWA
     */
    private void sort() {

        if (studentsList.size() == 1) {
            return;
        }
        boolean result = false;
        int i = 0;

        while (i < studentsList.size() - 1) {
            result = false;
            for (int j = i + 1; j < studentsList.size(); j++) {
                String date1 = studentsList.get(i).getYear() + studentsList.get(i).getMonth();
                String date2 = studentsList.get(j).getYear() + studentsList.get(j).getMonth();
                if (Integer.parseInt(date1) < Integer.parseInt(date2)) {
                    StudentsDTO dto = studentsList.get(i);
                    studentsList.remove(i);
                    studentsList.add(dto);
                    result = true;
                    break;
                }
            }
            if (result)
                continue;

            i++;
        }
    }

    /**
     * 取得メソッド 受講生リストを取得
     *
     * @author KOHEI NITABARU
     * @return studentsList
     */
    public List<StudentsDTO> getStudentsList() {
        return studentsList;
    }

    /**
     * 設定メソッド 受講生リストを設定
     *
     * @author KOHEI NITABARU
     * @param studentsList
     */
    public void setStudentsList(ArrayList<StudentsDTO> studentsList) {
        this.studentsList = studentsList;
    }

    /**
     * 取得メソッド 検索文字を取得
     *
     * @author KOHEI NITABARU
     * @return search
     */
    public int getSearchInt() {
        return searchInt;
    }

    /**
     * 設定メソッド 検索文字を設定
     *
     * @author KOHEI NITABARU
     * @param search
     */
    public void setSearchInt(int searchInt) {
        this.searchInt = searchInt;
    }

    /**
     * 取得メソッド シリアル番号を取得
     *
     * @author KOHEI NITABARU
     * @return serialVersionUID
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * 取得メソッド 結果文字を取得
     *
     * @author KOHEI NITABARU
     * @return resultSelect
     */
    public String getResultSelect() {
        return resultSelect;
    }

    /**
     * 設定メソッド 結果文字を設定
     *
     * @author KOHEI NITABARU
     * @param resultSelect
     */
    public void setResultSelect(String resultSelect) {
        this.resultSelect = resultSelect;
    }

    /**
	 * ユーザーIDを取得するためのメソッド
	 *
	 * @author YUKI MAEDA
	 * @return userId 取得するユーザーID
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * ユーザーIDを格納するためのメソッド
	 *
	 * @author YUKI MAEDA
	 * @param userId 格納するユーザーID
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	 * パスワードを取得するためのメソッド
	 *
	 * @author YUKI MAEDA
	 * @return password 取得するパスワード
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * パスワードを格納するためのメソッド
	 *
	 * @param password 格納するパスワード
	 *
	 * @author YUKI MAEDA
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 取得メソッド を取得
	 * @author
	 * @return familyNameKanji
	 */
	public String getFamilyNameKanji() {
		return familyNameKanji;
	}

	/**
	 * 設定メソッド を設定
	 * @author
	 * @param familyNameKanji
	 */
	public void setFamilyNameKanji(String familyNameKanji) {
		this.familyNameKanji = familyNameKanji;
	}

	/**
	 * 取得メソッド を取得
	 * @author
	 * @return givenNameKanji
	 */
	public String getGivenNameKanji() {
		return givenNameKanji;
	}

	/**
	 * 設定メソッド を設定
	 * @author
	 * @param givenNameKanji
	 */
	public void setGivenNameKanji(String givenNameKanji) {
		this.givenNameKanji = givenNameKanji;
	}

	/**
	 * 取得メソッド を取得
	 * @author
	 * @return familyNameKana
	 */
	public String getFamilyNameKana() {
		return familyNameKana;
	}

	/**
	 * 設定メソッド を設定
	 * @author
	 * @param familyNameKana
	 */
	public void setFamilyNameKana(String familyNameKana) {
		this.familyNameKana = familyNameKana;
	}

	/**
	 * 取得メソッド を取得
	 * @author
	 * @return givenNamekana
	 */
	public String getGivenNameKana() {
		return givenNameKana;
	}

	/**
	 * 設定メソッド を設定
	 * @author
	 * @param givenNamekana
	 */
	public void setGivenNameKana(String givenNameKana) {
		this.givenNameKana = givenNameKana;
	}


	/**
	 * 取得メソッド を取得
	 * @author
	 * @return year
	 */
	public int getYear() {
		return year;
	}

	/**
	 * 設定メソッド を設定
	 * @author
	 * @param year
	 */
	public void setYear(int year) {
		this.year = year;
	}

	/**
	 * 取得メソッド を取得
	 * @author
	 * @return month
	 */
	public String getMonth() {
		return month;
	}

	/**
	 * 設定メソッド を設定
	 * @author
	 * @param month
	 */
	public void setMonth(String month) {
		this.month = month;
	}

	/**
	 * メールアドレスを取得するためのメソッド
	 *
	 * @author YUKI MAEDA
	 * @return email 取得するメールアドレス
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * メールアドレスを格納するためのメソッド
	 *
	 * @author YUKI MAEDA
	 * @param email 格納するメールアドレス
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * チーム名を取得するためのメソッド
	 *
	 * @author TATSUHIRO SAITO
	 * @return team_namel 取得するメールアドレス
	 */
	public String getTeamName() {
		return teamName;
	}

	/**
	 * チーム名を格納するためのメソッド
	 *
	 * @author TATSUHIRO SAITO
	 * @param team_name 格納するチーム名
	 */
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	/**
	 * チーム名を取得するためのメソッド
	 *
	 * @author TATSUHIRO SAITO
	 * @return
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * チーム名を格納するためのメソッド
	 *
	 * @author TATSUHIRO SAITO
	 * @param user_name
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}


}
