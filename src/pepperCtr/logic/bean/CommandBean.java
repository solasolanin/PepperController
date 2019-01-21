package pepperCtr.logic.bean;

import java.io.Serializable;

/**
 * 1コマンドの中身
 * @author hidetaka
 *
 */
public class CommandBean implements Serializable {
	/**シリアルID*/
	private static final long serialVersionUID = 1L;
	private String cmdName;
	private String userDefinedName;
	private String cmdOnClick;
	private String cmdClass;
	private String cmdParam;

	public CommandBean() {
		this.cmdOnClick = "";
		this.cmdClass = "";
		this.cmdParam = "";
	}

	public CommandBean(String cmdName, String userDefinedName, String cmdOnClick, String cmdClass) {
		this.cmdName = cmdName;
		this.userDefinedName = userDefinedName;
		this.cmdOnClick = cmdOnClick;
		this.cmdClass = cmdClass;
	}

	/**
	 * @return cmdName
	 */
	public String getCmdName() {
		return cmdName;
	}

	/**
	 * @param cmdName セットする cmdName
	 */
	public void setCmdName(String cmdName) {
		this.cmdName = cmdName;
	}

	/**
	 * @return userDefinedName
	 */
	public String getUserDefinedName() {
		return userDefinedName;
	}

	/**
	 * @param userDefinedName セットする userDefinedName
	 */
	public void setUserDefinedName(String userDefinedName) {
		this.userDefinedName = userDefinedName;
	}

	/**
	 * @return cmdOnClick
	 */
	public String getCmdOnClick() {
		return cmdOnClick;
	}

	/**
	 * @param cmdOnClick セットする cmdOnClick
	 */
	public void setCmdOnClick(String cmdOnClick) {
		this.cmdOnClick = cmdOnClick;
	}

	/**
	 * @return cmdClass
	 */
	public String getCmdClass() {
		return cmdClass;
	}

	/**
	 * @param cmdClass セットする cmdClass
	 */
	public void setCmdClass(String cmdClass) {
		this.cmdClass = cmdClass;
	}

	/**
	 * @return cmdParam
	 */
	public String getCmdParam() {
		return cmdParam;
	}

	/**
	 * @param cmdParam セットする cmdParam
	 */
	public void setCmdParam(String cmdParam) {
		this.cmdParam = cmdParam;
	}

	/**
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "CommandBean [cmdName=" + cmdName + ", userDefinedName=" + userDefinedName + ", cmdOnClick=" + cmdOnClick
				+ ", cmdClass=" + cmdClass + ", cmdParam=" + cmdParam + "]";
	}

}
