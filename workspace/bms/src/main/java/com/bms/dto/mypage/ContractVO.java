package com.bms.dto.mypage;

import java.util.Date;

public class ContractVO {

	private String constract_code; //계약 내역 글 코드
	private String member_code;		//입주자 코드
	private String member_name;
	private Date constract_start_date;//계약 시작 날짜
	private Date constract_last_date; //계약 종료 날짜
	private String constract_kind;	//계약 유형
	private int constract_amount;	//계약 금액
	private String constract_term;	//계약 기간
	private String constract_type; //구분용도
	private String board_sort_code;	//게시판 구분 코드
	
	
	public String getConstract_code() {
		return constract_code;
	}
	public void setConstract_code(String constract_code) {
		this.constract_code = constract_code;
	}
	public String getMember_code() {
		return member_code;
	}
	public void setMember_code(String member_code) {
		this.member_code = member_code;
	}
	public Date getConstract_start_date() {
		return constract_start_date;
	}
	public void setConstract_start_date(Date constract_start_date) {
		this.constract_start_date = constract_start_date;
	}
	public Date getConstract_last_date() {
		return constract_last_date;
	}
	public void setConstract_last_date(Date constract_last_date) {
		this.constract_last_date = constract_last_date;
	}
	public String getConstract_kind() {
		return constract_kind;
	}
	public void setConstract_kind(String constract_kind) {
		this.constract_kind = constract_kind;
	}
	public int getConstract_amount() {
		return constract_amount;
	}
	public void setConstract_amount(int constract_amount) {
		this.constract_amount = constract_amount;
	}
	public String getConstract_term() {
		return constract_term;
	}
	public void setConstract_term(String constract_term) {
		this.constract_term = constract_term;
	}
	public String getConstract_type() {
		return constract_type;
	}
	public void setConstract_type(String constract_type) {
		this.constract_type = constract_type;
	}
	public String getBoard_sort_code() {
		return board_sort_code;
	}
	public void setBoard_sort_code(String board_sort_code) {
		this.board_sort_code = board_sort_code;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	@Override
	public String toString() {
		return "ContractVO [constract_code=" + constract_code + ", member_code=" + member_code + ", member_name="
				+ member_name + ", constract_start_date=" + constract_start_date + ", constract_last_date="
				+ constract_last_date + ", constract_kind=" + constract_kind + ", constract_amount=" + constract_amount
				+ ", constract_term=" + constract_term + ", constract_type=" + constract_type + ", board_sort_code="
				+ board_sort_code + "]";
	}
	
	
	
}