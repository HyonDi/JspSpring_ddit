package com.bms.service.reply;

import java.sql.SQLException;
import java.util.List;

import com.bms.dto.reply.ReplyVO;
import com.bms.request.reply.CommunityReplyRequest;

public interface ReplyService {
	
	void mobileReplyWrite(ReplyVO reply) throws SQLException;
	
	ReplyVO mobileReply(String board_code) throws SQLException;

	void mobileReplyDelete(String reply_code) throws SQLException;

	void mobileReplyModify(ReplyVO reply) throws SQLException;

	List<ReplyVO> mobileReplyList(String board_code) throws SQLException;

	int mobileReplyCnt(String board_code) throws SQLException;

	List<CommunityReplyRequest> mobileReplyUpCode() throws SQLException;

	void mobilReplyRegist(ReplyVO reply) throws SQLException;

	void mobilReplyResRegist(ReplyVO reply) throws SQLException;


}
