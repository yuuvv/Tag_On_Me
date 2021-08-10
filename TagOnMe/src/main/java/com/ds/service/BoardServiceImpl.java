package com.ds.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import com.ds.domain.AttachDTO;
import com.ds.domain.BoardDTO;
import com.ds.mapper.AttachMapper;
import com.ds.mapper.BoardMapper;
import com.ds.paging.PaginationInfo;
import com.ds.util.FileUtils;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;

	@Autowired
	private AttachMapper attachMapper;

	@Autowired
	private FileUtils fileUtils;

	@Override
	public boolean registerBoard(BoardDTO params) {

		int queryResult = 0;

		if (params.getBno() == null) {
			queryResult = boardMapper.insertBoard(params);
		} else {
			queryResult = boardMapper.updateBoard(params);

			// 파일이 추가, 삭제, 변경된 경우
			if ("Y".equals(params.getChangeYn())) {
				attachMapper.deleteAttach(params.getBno());

				// fileIdxs에 포함된 idx를 가지는 파일의 삭제여부를 'N'으로 업데이트
				if (CollectionUtils.isEmpty(params.getFileIdxs()) == false) {
					attachMapper.undeleteAttach(params.getFileIdxs());
				}
			}
		}

		return (queryResult > 0);
	}

	@Override
	public boolean registerBoard(BoardDTO params, MultipartFile[] files) {
		int queryResult = 1;

		if (registerBoard(params) == false) {
			return false;
		}

		List<AttachDTO> fileList = fileUtils.uploadFiles(files, params.getBno());
		if (CollectionUtils.isEmpty(fileList) == false) {
			queryResult = attachMapper.insertAttach(fileList);
			if (queryResult < 1) {
				queryResult = 0;
			}
		}

		return (queryResult > 0);
	}

	@Override
	public BoardDTO getBoardDetail(Long idx) {
		return boardMapper.selectBoardDetail(idx);
	}

	@Override
	public boolean deleteBoard(Long idx) {
		int queryResult = 0;

		BoardDTO board = boardMapper.selectBoardDetail(idx);

		if (board != null && "N".equals(board.getDeletedYn())) {
			queryResult = boardMapper.deleteBoard(idx);
		}

		return (queryResult == 1) ? true : false;
	}

	@Override
	public List<BoardDTO> getBoardList(BoardDTO params) {
		List<BoardDTO> boardList = Collections.emptyList();
		boardMapper.updateReplyCount(params.getBno());
		int boardTotalCount = boardMapper.selectBoardTotalCount(params);

		PaginationInfo paginationInfo = new PaginationInfo(params);
		paginationInfo.setTotalRecordCount(boardTotalCount);

		params.setPaginationInfo(paginationInfo);

		if (boardTotalCount > 0) {
			boardList = boardMapper.selectBoardList(params);
		}

		return boardList;
	}

	@Override
	public List<AttachDTO> getAttachFileList(Long boardIdx) {

		int fileTotalCount = attachMapper.selectAttachTotalCount(boardIdx);
		if (fileTotalCount < 1) {
			return Collections.emptyList();
		}
		return attachMapper.selectAttachList(boardIdx);
	}
	
	@Override
	public List<BoardDTO> getHitBoardList(BoardDTO params) {
		return boardMapper.selectHitBoardList(params);
	}

	@Override
	public AttachDTO getAttachDetail(Long idx) {
		return attachMapper.selectAttachDetail(idx);
	}

}
