package com.blanche.board.common.constant;

public interface BoardConstant {
	public static final String SESSION_USER_DATA = "blancheUser";

	public static final String VIEW_NORMAL_LIST = "board/default/listForm";
	public static final String VIEW_NORMAL_DETAIL = "board/default/detailForm";
	public static final String VIEW_NORMAL_WRITE = "board/default/writeForm";
	public static final String VIEW_NORMAL_EDIT = "board/default/editForm";
	
	public static final String VIEW_MYPAGE_LIST = "board/mypage/mylistForm";
	public static final String VIEW_MYPAGE_DETAIL = "board/mypage/myarticleForm";

	public static final String VIEW_RETURN_LIST = "board/common/returnList";
	public static final String VIEW_RETURN_ERROR = "board/common/returnError";
	public static final String VIEW_RETURN_LOGIN = "board/common/returnError";
	
	public static final String VIEW_IMAGE_UPLOAD = "board/common/imageUpload";
	
	public static final String ERROR_BOARD_FAIL = "해당하는 게시판이 존재하지 않습니다.";
	public static final String ERROR_DETAIL_FAIL = "해당하는 게시물이 존재하지 않습니다.";
	public static final String ERROR_LOGON_FAIL = "로그인 상태에서만 가능합니다.";
	public static final String ERROR_INSERT_FAIL = "글 작성에 실패하였습니다.";
	public static final String ERROR_UPDATE_FAIL = "글 수정에 실패하였습니다.";
	public static final String ERROR_DELETE_FAIL = "글 삭제에 실패하였습니다.";
	public static final String ERROR_DELETE_CANT = "답변이 있어 삭제를 할 수 없습니다.";
}