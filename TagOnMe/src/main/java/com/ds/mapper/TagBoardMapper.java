package com.ds.mapper;

import java.util.List;

import com.ds.domain.TagVO;
import org.apache.ibatis.annotations.Mapper;

import com.ds.domain.BoardDTO;
import com.ds.domain.TagBoardDTO;
import com.ds.domain.TagDTO;

@Mapper
public interface TagBoardMapper {
	public List<TagBoardDTO> selectTagBoardList(TagBoardDTO params);
	
	public List<TagBoardDTO> selectTagDetail(Long bno);
	
	public List<TagBoardDTO> selectTagCount(TagBoardDTO params);
	
	public List<TagBoardDTO> selectSearchTagList(Long bno);
	
	public List<TagBoardDTO> selectSearchTagListForNull(TagBoardDTO params);

	void oldBoardTag(TagBoardDTO tagBoardDTO);//존재하는 유저태그 삽입

	void newTag(TagBoardDTO tagBoardDTO);//존재하지 않는 태그 만들기, bno유무 상관없음.
	void newBoardTag(TagBoardDTO tagBoardDTO);//존재하지 않는 유저태그 삽입

	void delBoardTag(TagBoardDTO tagBoardDTO);//유저태그 삭제(임시)
	void delBoardWriteTag(TagBoardDTO tagBoardDTO);
	
	String oldBoardWriteTag(TagBoardDTO tagBoardDTO); //bno가 없는데 존재하는 태그를 삽입할때
	void newBoardWriteTag(TagBoardDTO tagBoardDTO); //bno가 없고, 존재하지 않는 태그를 삽입할때
	
	
	
}
