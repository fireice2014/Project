package com.snwd.model;

import java.util.ArrayList;

public class Json {

	public static void main(String[] args) {
		// Json j=new Json();
		// j.reSet();
		// j.setSuccess(true);
		// j.addItem("id", "1");
		// j.addItem("name", "zb");
		// j.addItemOk();
		// j.addItem("id", "2");
		// j.addItem("name", "jim");
		// j.addItemOk();
		// String dd=j.ToString();
		// System.out.println(dd);
	}

	public String singleInfo = "";
	protected boolean _success = true;
	protected String _error = "";
	protected ArrayList arrData = new ArrayList();
	protected ArrayList dataItem = new ArrayList();

	public String getError() {
		return _error;
	}

	public void setError(String error) {
		if (!error.equals(""))
			this._success = false;
		this._error = error;
	}

	public boolean getSuccess() {
		return _success;
	}

	public void setSuccess(boolean success) {
		if (success)
			this._error = "";
		this._success = success;
	}

	public Json() {

	}

	public void reSet() {
		_success = true;
		_error = "";
		singleInfo = "";
		arrData.clear();
		dataItem.clear();
	}

	public void addItem(String name, String _value) {
		dataItem.add(name);
		dataItem.add(_value);
	}

	// 一锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟较ｏ拷一锟斤拷锟铰碉拷锟斤拷锟介开始
	public void addItemOk() {
		arrData.add(dataItem);
		dataItem = new ArrayList();
	}

	/**
	 * 
	 * 转锟斤拷为json 锟斤拷式锟斤拷锟?
	 * 
	 * @return
	 */
	public String ToString() {
		StringBuilder sb = new StringBuilder();

		sb.append("[");
		int ad = arrData.size();
		for (int i = 0; i < ad; i++) {
			ArrayList arr = (ArrayList) (arrData.get(i));
			sb.append("{");
			int t = arr.size();
			for (int j = 0; j < t; j += 2) {
				if (j == t)
					break;
				sb.append(arr.get(j).toString());
				sb.append(":");
				sb.append("\"");
				sb.append(arr.get(j + 1));
				sb.append("\"");
				if (j < t - 2)
					sb.append(",");
			}
			sb.append("}");
			if (i < ad - 1)
				sb.append("," + "");
		}
		sb.append("]");

		return sb.toString();
	}

}
