package com.internousdev.openconnect.decision.dto;

/**
 * 決裁手続クラス
 * @author KOTA MIYAZATO
 * @since 2017/06/05
 */
public class DecisionDTO {

	/**
	 * 実施起案者ユーザーID
	 *
	 */
	private int jDrafterId;

	/**
	 * 契約/実施兼契約起案者ユーザーID
	 *
	 */
	private int kDrafterId;

	/**
	 * 決裁番号
	 */
	private int decisionId;

	/**
	 * 案件名
	 *
	 */
	private String decisionName;


	private String decisionPath;

	/**
	 * 決裁種類
	 *
	 */
	private String decisionType;

	/**
	 * 開始日
	 */
	public String startDay;
	/**
	 * 実施起案番号
	 *
	 */
	private String jImpId;
	/**
	 * 実施決裁番号
	 *
	 */
	private String jDecId;
	/**
	 * 契約起案番号
	 *
	 */
	private String kImpId;
	/**
	 * 契約決裁番号
	 *
	 */
	private String kDecId;
	/**
	 * 実施兼契約起案番号
	 *
	 */
	private String jkImpId;
	/**
	 * 実施兼契約番号
	 *
	 */

	private String jkDecId;


	/**
	 * 理由・目的
	 */
	public String cause;

	/**
	 * 建設費用
	 */
	private float bildCost;

	/**
	 * 損益費用
	 */
	private float benefit;

	/**
	 * 合計金額
	 */
	private float amountAll;

	/**
	 * 概要
	 */
	public String summary;

	/**
	 * 実施申請日(日付)
	 */
	public String jApplyDay;

	/**
	 * 実施申請日(承認者日付)
	 */
	public String jSlashApplyDay;

	/**
	 * 契約申請日(日付)
	 */
	public String kApplyDay;

	/**
	 * 契約申請日(承認者日付)
	 */
	public String kSlashApplyDay;

	/**
	 * 遡求申請日(日付)
	 */
	public String sApplyDay;

	/**
	 * 終了日
	 */
	public String endDay;

	/**
	 * 人数
	 */
	public int person;


	/**
	 * 開発端末料
	 */
	public int prove;

	/**
	 * 合計開発端末料
	 */
	public int totalProve;

	/**
	 * リリース環境使用料
	 */
	public float re;

	/**
	 * 合計リリース環境使用料
	 */
	public float totalRe;

	/**
	 *回線使用料
	 */
	public int line;

	/**
	 *合計回線使用料
	 */
	public int totalLine;

	/**
	 *施設使用料
	 */
	public float room;

	/**
	 *合計施設使用料
	 */
	public float totalRoom;

	/**
	 *開発要員
	 */
	public int human;

	/**
	 *合計開発要員
	 */
	public int totalHuman;

	/**
	 *雑費
	 */
	public float etc;

	/**
	 *合計雑費
	 */
	public float totalEtc;

	/**
	 * 実施、契約決裁の振り分け用。
	 */
	public int type;

	/**
	* 実施_承認者ID(1人目:リーダー)
	*/
	private int jPermiterId1;
	/**
	* 実施_承認者ID(2人目:リーダー)
	*/
	private int jPermiterId2;
	/**
	* 実施_承認者ID(3人目:先生)
	*/
	private int jPermiterId3;

	/**
	* 契約_承認者ID(1人目:リーダー)
	*/
	private int kPermiterId1;
	/**
	* 契約_承認者ID(2人目:リーダー)
	*/
	private int kPermiterId2;
	/**
	* 契約_承認者ID(3人目:先生)
	*/
	private int kPermiterId3;

	/**
	 *姓（漢字）
	 */
	public String familyNameKanji;


	/**
	 *名（漢字）
	 */
	public String givenNameKanji;

	/**
	 *人数
	 */
	public int persons;



	/**
	 * 資料名
	 */
	public String documentName;

	/**
	 * 資料パス
	 */
	public String documentPath;


	/**
	 * 決済ID
	 */
	public int projectId;

	/**
	 * プロジェクト名
	 */
	public String projectName;


	/** 取得メソッド を取得
	* @return person
	*/
	public int getPerson() {
		return person;
	}
	/**
	* 設定メソッド を設定
	* @param person
	*/
	public void setPerson(int person) {
		this.person = person;
	}

	/**
	* 取得メソッド を取得
	* @author KOHEI NITABARU
	* @return totalProve
	*/
	public int getTotalProve() {
		return totalProve;
	}
	/**
	* 設定メソッド を設定
	* @author KOHEI NITABARU
	* @param totalProve
	*/
	public void setTotalProve(int totalProve) {
		this.totalProve = totalProve;
	}
	/**
	* 取得メソッド を取得
	* @author KOHEI NITABARU
	* @return totalRe
	*/
	public float getTotalRe() {
		return totalRe;
	}
	/**
	* 設定メソッド を設定
	* @author KOHEI NITABARU
	* @param totalRe
	*/
	public void setTotalRe(float totalRe) {
		this.totalRe = totalRe;
	}
	/**
	* 取得メソッド を取得
	* @author KOHEI NITABARU
	* @return totalLine
	*/
	public int getTotalLine() {
		return totalLine;
	}
	/**
	* 設定メソッド を設定
	* @author KOHEI NITABARU
	* @param totalLine
	*/
	public void setTotalLine(int totalLine) {
		this.totalLine = totalLine;
	}
	/**
	* 取得メソッド を取得
	* @author KOHEI NITABARU
	* @return totalRoom
	*/
	public float getTotalRoom() {
		return totalRoom;
	}
	/**
	* 設定メソッド を設定
	* @author KOHEI NITABARU
	* @param totalRoom
	*/
	public void setTotalRoom(float totalRoom) {
		this.totalRoom = totalRoom;
	}
	/**
	* 取得メソッド を取得
	* @author KOHEI NITABARU
	* @return totalHuman
	*/
	public int getTotalHuman() {
		return totalHuman;
	}
	/**
	* 設定メソッド を設定
	* @author KOHEI NITABARU
	* @param totalHuman
	*/
	public void setTotalHuman(int totalHuman) {
		this.totalHuman = totalHuman;
	}
	/**
	* 取得メソッド を取得
	* @author KOHEI NITABARU
	* @return totalEtc
	*/
	public float getTotalEtc() {
		return totalEtc;
	}
	/**
	* 設定メソッド を設定
	* @author KOHEI NITABARU
	* @param totalEtc
	*/
	public void setTotalEtc(float totalEtc) {
		this.totalEtc = totalEtc;
	}
	/**
	* 取得メソッド を取得
	* @author KOHEI NITABARU
	* @return persons
	*/
	public int getPersons() {
		return persons;
	}
	/**
	* 設定メソッド を設定
	* @author KOHEI NITABARU
	* @param persons
	*/
	public void setPersons(int persons) {
		this.persons = persons;
	}

	/**
	 * @return prove
	 */
	public int getProve() {
		return prove;
	}
	/**
	 * @param prove セットする prove
	 */
	public void setProve(int prove) {
		this.prove = prove;
	}
	/**
	 * @return re
	 */
	public float getRe() {
		return re;
	}
	/**
	 * @param re セットする re
	 */
	public void setRe(float re) {
		this.re = re;
	}
	/**
	 * @return line
	 */
	public int getLine() {
		return line;
	}
	/**
	 * @param line セットする line
	 */
	public void setLine(int line) {
		this.line = line;
	}
	/**
	 * @return room
	 */
	public float getRoom() {
		return room;
	}
	/**
	 * @param room セットする room
	 */
	public void setRoom(float room) {
		this.room = room;
	}
	/**
	 * @return human
	 */
	public int getHuman() {
		return human;
	}
	/**
	 * @param human セットする human
	 */
	public void setHuman(int human) {
		this.human = human;
	}
	/**
	 * @return etc
	 */
	public float getEtc() {
		return etc;
	}
	/**
	 * @param etc セットする etc
	 */
	public void setEtc(float etc) {
		this.etc = etc;
	}

	/**
	* 取得メソッド
	* @author KOTA MIYAZATO
	* @return
	*/
	public int getJDrafterId() {
		return jDrafterId;
	}
	/**
	* 設定メソッド
	* @author KOTA MIYAZATO
	* @param
	*/
	public void setJDrafterId(int jDrafterId) {
		this.jDrafterId = jDrafterId;
	}

	/**
	* 取得メソッド を取得
	* @return kDrafterId
	*/
	public int getKDrafterId() {
		return kDrafterId;
	}
	/**
	* 設定メソッド を設定
	* @param kDrafterId
	*/
	public void setKDrafterId(int kDrafterId) {
		this.kDrafterId = kDrafterId;
	}
	/**
	* 取得メソッド
	* @author KOTA MIYAZATO
	* @return
	*/
	public String getDecisionName() {
		return decisionName;
	}
	/**
	* 設定メソッド
	* @author KOTA MIYAZATO
	* @param
	*/
	public void setDecisionName(String decisionName) {
		this.decisionName = decisionName;
	}

	/**
	* 取得メソッド を取得
	* @return decisionType
	*/
	public String getDecisionType() {
		return decisionType;
	}


	/**
	* 設定メソッド を設定
	* @param decisionType
	*/
	public void setDecisionType(String decisionType) {
		this.decisionType = decisionType;
	}



	/**
	* 取得メソッド を取得
	* @return jImpId
	*/
	public String getJImpId() {
		return jImpId;
	}
	/**
	* 設定メソッド を設定
	* @param jImpId
	*/
	public void setJImpId(String jImpId) {
		this.jImpId = jImpId;
	}
	/**
	* 取得メソッド を取得
	* @return jDecId
	*/
	public String getJDecId() {
		return jDecId;
	}
	/**
	* 設定メソッド を設定
	* @param jDecId
	*/
	public void setJDecId(String jDecId) {
		this.jDecId = jDecId;
	}
	/**
	* 取得メソッド を取得
	* @return kImpId
	*/
	public String getKImpId() {
		return kImpId;
	}
	/**
	* 設定メソッド を設定
	* @param kImpId
	*/
	public void setKImpId(String kImpId) {
		this.kImpId = kImpId;
	}
	/**
	* 取得メソッド を取得
	* @return kDecId
	*/
	public String getKDecId() {
		return kDecId;
	}
	/**
	* 設定メソッド を設定
	* @param kDecId
	*/
	public void setKDecId(String kDecId) {
		this.kDecId = kDecId;
	}
	/**
	* 取得メソッド を取得
	* @return jkImpId
	*/
	public String getJkImpId() {
		return jkImpId;
	}
	/**
	* 設定メソッド を設定
	* @param jkImpId
	*/
	public void setJkImpId(String jkImpId) {
		this.jkImpId = jkImpId;
	}
	/**
	* 取得メソッド を取得
	* @return jkDecId
	*/
	public String getJkDecId() {
		return jkDecId;
	}
	/**
	* 設定メソッド を設定
	* @param jkDecId
	*/
	public void setJkDecId(String jkDecId) {
		this.jkDecId = jkDecId;
	}
	/**
	 * @return bildcost
	 */
	public float getBildCost() {
		return bildCost;
	}
	/**
	 * @param bildcost セットする bildcost
	 */
	public void setBildCost(float bildCost) {
		this.bildCost = bildCost;
	}

	/**
	 * @return cause
	 */
	public String getCause() {
		return cause;
	}
	/**
	 * @param cause セットする cause
	 */
	public void setCause(String cause) {
		this.cause = cause;
	}

		/**
		* 取得メソッド を取得
		* @return jApplyDay
		*/
		public String getJApplyDay() {
			return jApplyDay;
		}
		/**
		* 設定メソッド を設定
		* @param jApplyDay
		*/
		public void setJApplyDay(String jApplyDay) {
			this.jApplyDay = jApplyDay;
		}

		/**
		* 取得メソッド を取得
		* @return jSlashApplyDay
		*/
		public String getJSlashApplyDay() {
			return jSlashApplyDay;
		}
		/**
		* 設定メソッド を設定
		* @param jSlashApplyDay
		*/
		public void setJSlashApplyDay(String jSlashApplyDay) {
			this.jSlashApplyDay = jSlashApplyDay;
		}

		/**
		* 取得メソッド を取得
		* @return kApplyDay
		*/
		public String getKApplyDay() {
			return kApplyDay;
		}
		/**
		* 設定メソッド を設定
		* @param kApplyDay
		*/
		public void setKApplyDay(String kApplyDay) {
			this.kApplyDay = kApplyDay;
		}

		/**
		* 取得メソッド を取得
		* @return kSlashApplyDay
		*/
		public String getKSlashApplyDay() {
			return kSlashApplyDay;
		}
		/**
		* 設定メソッド を設定
		* @param kSlashApplyDay
		*/
		public void setKSlashApplyDay(String kSlashApplyDay) {
			this.kSlashApplyDay = kSlashApplyDay;
		}
		/**
		* 取得メソッド を取得
		* @return sApplyDay
		*/
		public String getSApplyDay() {
			return sApplyDay;
		}
		/**
		* 設定メソッド を設定
		* @param sApplyDay
		*/
		public void setSApplyDay(String sApplyDay) {
			this.sApplyDay = sApplyDay;
		}
		/**
		 * @return endDay
		 */
		public String getEndDay() {
			return endDay;
		}
		/**
		 * @param endDay セットする endDay
		 */
		public void setEndDay(String endDay) {
			this.endDay = endDay;
		}
		/**
		 * @return startDay
		 */
		public String getStartDay() {
			return startDay;
		}
		/**
		 * @param start_day セットする start_day
		 */
		public void setStartDay(String startDay) {
			this.startDay = startDay;
		}
		/**
		 * @return summary
		 */
		public String getSummary() {
			return summary;
		}
		/**
		 * @param summary セットする summary
		 */
		public void setSummary(String summary) {
			this.summary = summary;
		}
		/**
		 * @return benefit
		 */
		public float getBenefit() {
			return benefit;
		}
		/**
		 * @param benefit セットする benefit
		 */
		public void setBenefit(float benefit) {
			this.benefit = benefit;
		}
		/**
		 * @return amountAll
		 */
		public float getAmountAll() {
			return amountAll;
		}
		/**
		 * @param amountAll セットする amountAll
		 */
		public void setAmountAll(float amountAll) {
			this.amountAll = amountAll;
		}

		/**
		 * 実施_承認者ID(1人目:リーダー)を取得します。
		 * @return 実施_承認者ID(1人目:リーダー)
		 */
		public int getJPermiterId1() {
		    return jPermiterId1;
		}
		/**
		 * 実施_承認者ID(1人目:リーダー)を設定します。
		 * @param jPermiterId1 実施_承認者ID(1人目:リーダー)
		 */
		public void setJPermiterId1(int jPermiterId1) {
		    this.jPermiterId1 = jPermiterId1;
		}
		/**
		 * 実施_承認者ID(2人目:リーダー)を取得します。
		 * @return 実施_承認者ID(2人目:リーダー)
		 */
		public int getJPermiterId2() {
		    return jPermiterId2;
		}
		/**
		 * 実施_承認者ID(2人目:リーダー)を設定します。
		 * @param jPermiterId2 実施_承認者ID(2人目:リーダー)
		 */
		public void setJPermiterId2(int jPermiterId2) {
		    this.jPermiterId2 = jPermiterId2;
		}
		/**
		 * 実施_承認者ID(3人目:先生)を取得します。
		 * @return 実施_承認者ID(3人目:先生)
		 */
		public int getJPermiterId3() {
		    return jPermiterId3;
		}
		/**
		 * 実施_承認者ID(3人目:先生)を設定します。
		 * @param jPermiterId3 実施_承認者ID(3人目:先生)
		 */
		public void setJPermiterId3(int jPermiterId3) {
		    this.jPermiterId3 = jPermiterId3;
		}


		/**
		 * 契約_承認者ID(1人目:リーダー)を取得します。
		 * @return 契約_承認者ID(1人目:リーダー)
		 */
		public int getKPermiterId1() {
		    return kPermiterId1;
		}
		/**
		 * 契約_承認者ID(1人目:リーダー)を設定します。
		 * @param kPermiterId1 契約_承認者ID(1人目:リーダー)
		 */
		public void setKPermiterId1(int kPermiterId1) {
		    this.kPermiterId1 = kPermiterId1;
		}
		/**
		 * 契約_承認者ID(2人目:リーダー)を取得します。
		 * @return 契約_承認者ID(2人目:リーダー)
		 */
		public int getKPermiterId2() {
		    return kPermiterId2;
		}
		/**
		 * 契約_承認者ID(2人目:リーダー)を設定します。
		 * @param kPermiterId2 契約_承認者ID(2人目:リーダー)
		 */
		public void setKPermiterId2(int kPermiterId2) {
		    this.kPermiterId2 = kPermiterId2;
		}
		/**
		 * 契約_承認者ID(3人目:先生)を取得します。
		 * @return 契約_承認者ID(3人目:先生)
		 */
		public int getKPermiterId3() {
		    return kPermiterId3;
		}
		/**
		 * 契約_承認者ID(3人目:先生)を設定します。
		 * @param kPermiterId3 契約_承認者ID(3人目:先生)
		 */
		public void setKPermiterId3(int kPermiterId3) {
		    this.kPermiterId3 = kPermiterId3;
		}

		/**
		* 取得メソッド を取得
		* @author KOHEI NITABARU
		* @return familyNameKanji
		*/
		public String getFamilyNameKanji() {
			return familyNameKanji;
		}
		/**
		* 設定メソッド を設定
		* @author KOHEI NITABARU
		* @param familyNameKanji
		*/
		public void setFamilyNameKanji(String familyNameKanji) {
			this.familyNameKanji = familyNameKanji;
		}
		/**
		* 取得メソッド を取得
		* @author KOHEI NITABARU
		* @return givenNameKanji
		*/
		public String getGivenNameKanji() {
			return givenNameKanji;
		}
		/**
		* 設定メソッド を設定
		* @author KOHEI NITABARU
		* @param givenNameKanji
		*/
		public void setGivenNameKanji(String givenNameKanji) {
			this.givenNameKanji = givenNameKanji;
		}
		/**
		* 取得メソッド を取得
		* @return decisionId
		*/
		public int getDecisionId() {
			return decisionId;
		}
		/**
		* 設定メソッド を設定
		* @param decisionId
		*/
		public void setDecisionId(int decisionId) {
			this.decisionId = decisionId;
		}

		/**
		* 取得メソッド を取得
		* @return documentName
		*/
		public String getDocumentName() {
			return documentName;
		}
		/**
		* 設定メソッド を設定
		* @param documentName
		*/
		public void setDocumentName(String documentName) {
			this.documentName = documentName;
		}
		/**
		* 取得メソッド を取得
		* @return documentPath
		*/
		public String getDocumentPath() {
			return documentPath;
		}
		/**
		* 設定メソッド を設定
		* @param documentPath
		*/
		public void setDocumentPath(String documentPath) {
			this.documentPath = documentPath;
		}
		/**
		* 取得メソッド を取得
		* @return type
		*/
		public int getType() {
			return type;
		}
		/**
		* 設定メソッド を設定
		* @param type
		*/
		public void setType(int type) {
			this.type = type;
		}
		/**
		* 取得メソッド を取得
		* @return decisionPath
		*/
		public String getDecisionPath() {
			return decisionPath;
		}
		/**
		* 設定メソッド を設定
		* @param decisionPath
		*/
		public void setDecisionPath(String decisionPath) {
			this.decisionPath = decisionPath;
		}

		/**
		* 取得メソッド を取得
		* @return projectId
		*/
		public int getProjectId() {
			return projectId;
		}
		/**
		* 設定メソッド を設定
		* @param projectId
		*/
		public void setProjectId(int projectId) {
			this.projectId = projectId;
		}
		/**
		* 取得メソッド を取得
		* @return projectName
		*/
		public String getProjectName() {
			return projectName;
		}
		/**
		* 設定メソッド を設定
		* @param projectName
		*/
		public void setProjectName(String projectName) {
			this.projectName = projectName;
		}


}
